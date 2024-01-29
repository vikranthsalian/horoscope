
import 'package:flutter/material.dart';
enum BlocEventState { LOADING, LOADED, ERROR }
class BlocMapToEvent extends StatelessWidget {
  BlocMapToEvent(
      {
        required this.state,
        required this.child,
        this.loaderChild,
        this.callback,
        required this.message});
  final BlocEventState state;
  final Widget child;
  final Widget? loaderChild;
  final String message;
  Function? callback;

  @override
  Widget build(BuildContext context) {
    return _mapStateToWidget(state);
  }

  Widget _mapStateToWidget(BlocEventState state) {
    switch (state) {
      case BlocEventState.LOADING:
        if(callback!=null){
          callback!(false);
        }
        return loaderChild ?? Container(color: Colors.white);
      case BlocEventState.LOADED:
        if(callback!=null){
          callback!(true);
        }
        return child;
      case BlocEventState.ERROR:
        return Center(
          child: Text(message),
        );
      default:
        return Container();
    }
  }
}

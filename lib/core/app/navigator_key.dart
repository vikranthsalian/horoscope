import 'package:flutter/material.dart';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

BuildContext globalContext = appNavigatorKey.currentState!.context;

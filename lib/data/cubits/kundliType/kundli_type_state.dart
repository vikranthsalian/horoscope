part of 'kundli_type_cubit.dart';

@immutable
abstract class KundliTypeState {}

class KundliTypeInitial extends KundliTypeState {}

class KundliTypeSet extends KundliTypeState {
  final int kundliType;
  KundliTypeSet({required this.kundliType});
}

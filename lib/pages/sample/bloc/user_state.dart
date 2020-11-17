part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class TestState extends UserState {
  bool isActive;

  TestState(this.isActive);
}

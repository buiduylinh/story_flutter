part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class TestEvent extends UserEvent {
  String content;

  TestEvent(this.content);


}

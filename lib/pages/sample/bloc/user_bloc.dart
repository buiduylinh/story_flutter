import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is TestEvent) {
      if(event.content != null && event.content.isNotEmpty){
        yield TestState(true);
      } else {
        yield TestState(false);
      }

    }
  }
}

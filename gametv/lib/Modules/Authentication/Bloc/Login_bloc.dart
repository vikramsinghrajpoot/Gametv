import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:gametv/Modules/Authentication/widgets/AppTextField.dart';

import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextFieldType type;
  LoginBloc({this.type}) : super();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  LoginState get initialState => LoginDefaultState();
}

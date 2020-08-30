import 'dart:async';
import 'dart:developer' as developer;
import 'package:gametv/Modules/Authentication/widgets/AppTextField.dart';
import 'package:gametv/Modules/Utils/UserSession.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
}

class AuthenticationEvent extends LoginEvent {
  final String userName;
  final String password;
  AuthenticationEvent({this.userName, this.password});
  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield LoginStartingState();
      final password = UserSession.allUsers[this.userName];
      if (password == this.password) {
        UserSession.setLoggedIn();
        yield LoginFinishedState();
      } else {
        yield ErrorLoginState("invalidCredential");
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }
}

class FieldValidationEvent extends LoginEvent {
  final String text;
  final TextFieldType type;
  FieldValidationEvent({
    this.text,
    this.type,
  });

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      if (currentState is LoginDefaultState ||
          currentState is ErrorLoginState) {
        if (type == TextFieldType.userName) {
          yield LoginValidatorState(
              userNameError: _userError(), type: this.type);
        } else {
          yield LoginValidatorState(
              passwordError: _passwordError(), type: this.type);
        }
        return;
      }
      if (currentState is LoginValidatorState) {
        if (type == TextFieldType.userName) {
          yield LoginValidatorState(
              userNameError: _userError(),
              passwordError: currentState.passwordError,
              text: text);
        } else {
          yield LoginValidatorState(
              passwordError: _passwordError(),
              userNameError: currentState.userNameError,
              text: text);
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(_?.toString());
    }
  }

  _userError() =>
      text.length >= 3 && text.length <= 10 ? null : "userNameValidation";
  _passwordError() =>
      text.length >= 3 && text.length <= 10 ? null : "emailValidation";
}

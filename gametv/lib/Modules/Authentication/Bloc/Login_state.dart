import 'package:equatable/equatable.dart';
import 'package:gametv/Modules/Authentication/widgets/AppTextField.dart';

abstract class LoginState extends Equatable {
  final List propss;
  LoginState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

class LoginDefaultState extends LoginState {
  LoginDefaultState() : super([]);

  @override
  String toString() => 'LoginDefaultState';
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorLoginState';
}

class LoginStartingState extends LoginState {
  final String message;

  LoginStartingState({this.message}) : super([message]);

  @override
  String toString() => 'LoginStartingState';
}

class LoginFinishedState extends LoginState {
  final String message;

  LoginFinishedState({this.message}) : super([message]);

  @override
  String toString() => 'LoginStartingState';
}

class LoginValidatorState extends LoginState {
  final String userNameError;
  final String passwordError;
  final String text;
  final TextFieldType type;

  LoginValidatorState(
      {this.userNameError, this.passwordError, this.text = '', this.type})
      : super([userNameError, passwordError, type, text]);

  LoginValidatorState copyWith(
      {String userNameError, String passwordError, String text}) {
    return LoginValidatorState(
      userNameError: userNameError ?? this.userNameError,
      passwordError: passwordError ?? this.passwordError,
    );
  }

  @override
  String toString() => 'LoginStartingState';
}

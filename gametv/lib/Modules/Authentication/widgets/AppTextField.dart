
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gametv/Localizations/Localizations.dart';
import 'package:gametv/Modules/Authentication/Bloc/index.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextFieldType type;
  const AppTextField({Key key, this.hintText = '', this.type, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _userError;
    String _passwordError;
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, state) {
          if (state is LoginValidatorState) {
            _userError = state.userNameError != null
                ? AppLocalizations.of(context).translate(state.userNameError)
                : null;

            _passwordError = state.passwordError != null
                ? AppLocalizations.of(context).translate(state.passwordError)
                : null;
          }

          print("_userError: $_userError _passwordError:$_passwordError");
          return Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              obscureText: this.type == TextFieldType.password ? true : false,
              decoration: InputDecoration(
                errorText: this.type == TextFieldType.userName
                    ? _userError
                    : _passwordError,
                hintText: this.hintText,
              ),
              onChanged: (text) {
                BlocProvider.of<LoginBloc>(context)
                    .add(FieldValidationEvent(type: this.type, text: text));
              },
            ),
          );
        });
  }
}

enum TextFieldType { userName, password }

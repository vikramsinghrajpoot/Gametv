import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gametv/Localizations/Localizations.dart';
import 'package:gametv/Modules/Authentication/Bloc/index.dart';

class LoginButton extends StatelessWidget {
  final String userName;
  final String password;
  const LoginButton({Key key, this.password, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _userError;
    String _passwordError;
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, state) {
          if (state is LoginValidatorState) {
            _userError = state.userNameError;
            _passwordError = state.passwordError;
          }
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: 120,
            decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(
                    _validate(_userError, _passwordError, state) ? 1 : 0.3),
                borderRadius: BorderRadius.circular(30)),
            child: FlatButton(
              child: Text(
                AppLocalizations.of(context).translate("login"),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: _validate(_userError, _passwordError, state)
                  ? () => this._loginPressed(context)
                  : null,
            ),
          );
        });
  }

  _validate(_userError, _passwordError, state) {
    final status = (_userError == null &&
            _passwordError == null &&
            state is LoginValidatorState) &&
        this.userName.length > 0 &&
        this.password.length > 0;
    return status;
  }

  _loginPressed(context) async {
    BlocProvider.of<LoginBloc>(context).add(
        AuthenticationEvent(userName: this.userName, password: this.password));
  }
}

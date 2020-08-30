
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gametv/Localizations/Localizations.dart';
import 'package:gametv/Modules/Authentication/Bloc/index.dart';
import 'package:gametv/Modules/Authentication/widgets/AppTextField.dart';
import 'package:gametv/Modules/Authentication/widgets/LoginButton.dart';
import 'package:gametv/Modules/Home/Screens/HomeScreen.dart';

class LoginBuilder extends StatefulWidget {
  const LoginBuilder({Key key}) : super(key: key);

  @override
  _LoginBuilderState createState() => _LoginBuilderState();
}

class _LoginBuilderState extends State<LoginBuilder> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is LoginFinishedState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        }

        if (state is ErrorLoginState) {
          Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text(
                  AppLocalizations.of(context).translate(state.errorMessage))));
        }
      },
      bloc: BlocProvider.of<LoginBloc>(context),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/gametvlogo.png",
                    fit: BoxFit.cover,
                  ),
                  height: 50,
                  margin: EdgeInsets.only(bottom: 50),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.05),
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                spreadRadius: 3)
                          ]),
                      margin: EdgeInsets.all(15),
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AppTextField(
                            type: TextFieldType.userName,
                            hintText: AppLocalizations.of(context)
                                .translate("userName"),
                            controller: this._userNameController,
                          ),
                          AppTextField(
                            type: TextFieldType.password,
                            hintText: AppLocalizations.of(context)
                                .translate("password"),
                            controller: this._passwordController,
                          ),
                          LoginButton(
                            userName: this._userNameController.text,
                            password: this._passwordController.text,
                          )
                        ],
                      ),
                    );
                  },
                  bloc: BlocProvider.of<LoginBloc>(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    this._userNameController.dispose();
    this._passwordController.dispose();
    super.dispose();
  }
}

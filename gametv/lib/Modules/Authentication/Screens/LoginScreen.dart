import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gametv/Modules/Authentication/Bloc/index.dart';

import 'LoginBuilder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: LoginBuilder(),
      create: (BuildContext context) => LoginBloc(),
    );
  }
}

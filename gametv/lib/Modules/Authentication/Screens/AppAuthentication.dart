import 'package:flutter/material.dart';
import 'package:gametv/Modules/Home/Screens/HomeScreen.dart';
import 'package:gametv/Modules/Utils/UserSession.dart';

import 'LoginScreen.dart';

class AppAuthentication extends StatefulWidget {
  const AppAuthentication({Key key}) : super(key: key);

  @override
  _AppAuthenticationState createState() => _AppAuthenticationState();
}

class _AppAuthenticationState extends State<AppAuthentication> {
  Future _session;

  @override
  void initState() {
    _session = UserSession.getLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return snapshot.data ? HomeScreen() : LoginScreen();
          } else if (snapshot.hasError && snapshot.error != null) {
            return Center(
              child: Text(snapshot.error),
            );
          } else {
            return LoginScreen();
          }
        },
        future: _session,
      ),
    );
  }
}

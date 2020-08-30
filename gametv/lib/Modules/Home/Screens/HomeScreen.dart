import 'package:flutter/material.dart';
import 'package:gametv/Modules/Home/Bloc/index.dart';

import 'TournamentsList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TournamentsBloc _bloc;

  @override
  void initState() {
    _bloc = TournamentsBloc();
    _bloc.add(LoadTournamentsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey[200],
        child: TournamentsList(
          bloc: _bloc,
        ),
      ),
    );
  }
}

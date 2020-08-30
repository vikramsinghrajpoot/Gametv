import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class TournamentsBloc extends Bloc<TournamentsEvent, TournamentsState> {
  String cursor;

  TournamentsBloc({this.cursor}) : super();

  @override
  Stream<TournamentsState> mapEventToState(
    TournamentsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'TournamentsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  TournamentsState get initialState => TournamentsUninitializedState();
}

import 'dart:async';
import 'dart:developer' as developer;
import 'package:gametv/Modules/Home/Services/Service.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class TournamentsEvent {
  Stream<TournamentsState> applyAsync(
      {TournamentsState currentState, TournamentsBloc bloc});
}

class UnTournamentsEvent extends TournamentsEvent {
  @override
  Stream<TournamentsState> applyAsync(
      {TournamentsState currentState, TournamentsBloc bloc}) async* {
    yield TournamentsLoadingState();
  }
}

class LoadTournamentsEvent extends TournamentsEvent {
  @override
  Stream<TournamentsState> applyAsync(
      {TournamentsState currentState, TournamentsBloc bloc}) async* {
    try {
      if (currentState is TournamentsUninitializedState) {
        final data = await Service.getTournaments(cursor: bloc.cursor);
        yield TournamentsLoadedState(data: data.tournaments);
        return;
      }
      if (currentState is TournamentsLoadedState) {
        final data = await Service.getTournaments(cursor: bloc.cursor);
        yield data.isLastBatch
            ? currentState.copyWith(hasReachedMax: true)
            : TournamentsLoadedState(
                data: currentState.data + data.tournaments);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadTournamentsEvent', error: _, stackTrace: stackTrace);
      yield ErrorTournamentsState(_?.toString());
    }
  }
}

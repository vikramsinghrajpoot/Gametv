
import 'package:equatable/equatable.dart';
import 'package:gametv/Modules/Home/Models/TournamentsResponse.dart';

abstract class TournamentsState extends Equatable {
  final List propss;
  TournamentsState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class TournamentsLoadingState extends TournamentsState {
  TournamentsLoadingState();

  @override
  String toString() => 'TournamentsLoadingState';
}

/// Initialized
class TournamentsLoadedState extends TournamentsState {
  final List<Tournaments> data;
  final bool hasReachedMax;

  TournamentsLoadedState({this.data, this.hasReachedMax = false}) : super([data]);

  TournamentsLoadedState copyWith({
    List<Tournaments> data,
    bool hasReachedMax,
  }) {
    return TournamentsLoadedState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() => 'TournamentsLoadedState $data';
}

class ErrorTournamentsState extends TournamentsState {
  final String errorMessage;

  ErrorTournamentsState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorTournamentsState';
}

class TournamentsUninitializedState extends TournamentsState {
  TournamentsUninitializedState();

  @override
  String toString() => 'TournamentsUninitializedState';
}

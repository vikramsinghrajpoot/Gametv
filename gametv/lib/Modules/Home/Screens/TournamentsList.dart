import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gametv/Localizations/Localizations.dart';
import 'package:gametv/Modules/Home/Bloc/index.dart';
import 'package:gametv/Modules/Home/widgets/BottomLoader.dart';
import 'package:gametv/Modules/Home/widgets/GameCell.dart';
import 'package:gametv/Modules/Home/widgets/ProfileHeader.dart';
import 'package:gametv/Modules/Utils/Loader.dart';

class TournamentsList extends StatelessWidget {
  final TournamentsBloc bloc;
  const TournamentsList({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentsBloc, TournamentsState>(
        bloc: this.bloc,
        builder: (context, state) {
          if (state is TournamentsUninitializedState) {
            return Loader();
          }
          if (state is ErrorTournamentsState) {
            return Center(
              child: Container(
                child: Text(AppLocalizations.of(context)
                    .translate("someThingWentWrong")),
              ),
            );
          }
          if (state is TournamentsLoadedState) {
            if (state.data.isEmpty) {
              return Center(
                child: Text(
                    AppLocalizations.of(context).translate("noMoreRecords")),
              );
            }

            return _tournamentsList(state);
          } else {
            return Container();
          }
        });
  }

  _tournamentsList(TournamentsLoadedState state) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == state.data.length) {
          this.bloc.add(LoadTournamentsEvent());
          return BottomLoader();
        } else {
          return index == 0
              ? Container(
                  child: ProfileHeader(),
                )
              : GameCell(
                  tournament: state.data[index - 1],
                );
        }
      },
      itemCount:
          state.hasReachedMax ? state.data.length : state.data.length + 1,
    );
  }
}

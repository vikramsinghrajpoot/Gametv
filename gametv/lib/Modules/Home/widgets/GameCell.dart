import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gametv/Modules/Home/Models/TournamentsResponse.dart';

class GameCell extends StatelessWidget {
  final Tournaments tournament;
  const GameCell({Key key, this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.05),
                offset: Offset(0, 3),
                blurRadius: 7,
                spreadRadius: 7)
          ]),
          height: 150,
          child: Column(
            children: <Widget>[
              Container(
                width: size.width - 20,
                height: 85,
                child: Image(
                  image: CachedNetworkImageProvider(
                    this.tournament.coverUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              this.tournament.name,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(this.tournament.gameName,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

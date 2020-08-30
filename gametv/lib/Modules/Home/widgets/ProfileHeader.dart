import 'package:flutter/material.dart';
import 'package:gametv/Localizations/Localizations.dart';

import 'TournamentsStatus.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "Flyingwolf",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 40),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Container(
                  child: ClipRRect(
                      child: Image.asset("assets/user.png"),
                      borderRadius: BorderRadius.circular(35)),
                  height: 70,
                  width: 70,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Simon Baker",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(10),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blueAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "2250",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Elo Ratting",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TournamentsStatus(),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context).translate("recommendedForYou"),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(
              top: 30,
            ),
          )
        ],
      ),
    );
  }
}

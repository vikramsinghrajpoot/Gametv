import 'package:flutter/material.dart';

class TournamentsType extends StatelessWidget {
  final String count;
  final String type;
  final String status;
  final Gradient gradient;
  const TournamentsType(
      {Key key,
      this.count = '',
      this.type = '',
      this.status = '',
      this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${this.count}",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Text(
              this.type,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Text(
              this.status,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color bgColor;
  final Animation<Color> circleColor;
  Loader({this.bgColor, this.circleColor});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      color: bgColor ?? Colors.grey.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: this.circleColor,
        ),
      ),
    );
  }
}

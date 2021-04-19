import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';


class CardContent extends StatelessWidget {
  CardContent({@required this.cardIcon, @required this.cardSubtitle});

  final IconData cardIcon;
  final String cardSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
            height: 15.0
        ),
        Text(cardSubtitle, style: kCardSubtitleStyle),
      ],
    );
  }
}
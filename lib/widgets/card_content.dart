import 'package:flutter/material.dart';

const cardSubtitleStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98));

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
        Text(cardSubtitle, style: cardSubtitleStyle),
      ],
    );
  }
}
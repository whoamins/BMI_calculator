import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  RoundButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kButtonBackgroundColor,
      onPressed: onPressed,
    );
  }

}

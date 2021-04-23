import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {

  BottomButton({
    @required this.onTap,
    @required this.buttonTitle,
  });

  final Function onTap;
  final String buttonTitle;

  void _resetValue(DragEndDetails details) {

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) => _resetValue(details),
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity / 2,
        height: kBottomContainerHeight,
      ),
    );
  }
}

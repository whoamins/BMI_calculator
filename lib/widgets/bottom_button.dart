import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    @required this.onTap,
    @required this.buttonTitle,
  });

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: AnimatedTextKit(
            onTap: onTap,
            animatedTexts: [
              ColorizeAnimatedText(
                buttonTitle,
                textStyle: kColorizeTextStyle,
                colors: kColorizeColors,
                speed: Duration(milliseconds: 1000),
              ),
            ],
            isRepeatingAnimation: true,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

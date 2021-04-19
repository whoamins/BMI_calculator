import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/main_card.dart';
import 'package:bmi_calculator/widgets/card_content.dart';
import 'package:bmi_calculator/utils/constants.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: MainCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: CardContent(
                    cardIcon: FontAwesomeIcons.mars,
                    cardSubtitle: 'MALE',
                  ),
                )),
                Expanded(child: MainCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: CardContent(
                    cardIcon: FontAwesomeIcons.venus,
                    cardSubtitle: 'FEMALE',
                  ),
                ))
              ],
            )),
            Expanded(child: MainCard(
                color: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kCardSubtitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kMiddleCardNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kCardSubtitleStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: kSliderMinValue,
                      max: kSliderMaxValue,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
            )),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: MainCard(color: kInactiveCardColor)),
                Expanded(child: MainCard(color: kInactiveCardColor))
              ],
            )),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/main_card.dart';
import 'package:bmi_calculator/widgets/card_content.dart';


const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: MainCard(
                    color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardSubtitle: 'MALE',
                    ),
                  ),
                )),
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: MainCard(
                    color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardSubtitle: 'FEMALE',
                    ),
                  ),
                ))
              ],
            )),
            Expanded(child: MainCard(color: inactiveCardColor)),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: MainCard(color: inactiveCardColor)),
                Expanded(child: MainCard(color: inactiveCardColor))
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        )
    );
  }
}

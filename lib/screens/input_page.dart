import 'dart:async';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/main_card.dart';
import 'package:bmi_calculator/widgets/card_content.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/widgets/round_button.dart';
import 'package:bmi_calculator/calculate_bmi.dart';


enum Gender {
  male,
  female,
}

StreamController<bool> isLightTheme = StreamController();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 175;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: kAppBarBackgroundColor,
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MainCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          color: selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: CardContent(
                            cardIcon: FontAwesomeIcons.mars,
                            cardSubtitle: 'MALE',
                          ),
                        )),
                    Expanded(
                        child: MainCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          color: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: CardContent(
                            cardIcon: FontAwesomeIcons.venus,
                            cardSubtitle: 'FEMALE',
                          ),
                        ))
                  ],
                )),
            Expanded(
                child: MainCard(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kCardSubtitleStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kCardNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: kCardSubtitleStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: kSliderInactiveColor,
                          activeTrackColor: kSliderActiveColor,
                          thumbColor: kSliderThumbColor,
                          overlayColor: kSliderOverlayColor,
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 230.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MainCard(
                        color: kInactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kCardSubtitleStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kCardNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MainCard(
                        color: kInactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Age',
                              style: kCardSubtitleStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kCardNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            BottomButton(
              buttonTitle: 'CALCULATE',

              onTap: () {
                Calculate calc = Calculate(
                    height: height,
                    weight: weight
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        )
    );
  }
}
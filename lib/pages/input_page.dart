import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/services/bmi_calculate_service.dart';
import 'package:bmi_calculator/utils/play_sound.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Components
import '../components/reusable_card.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

// Constants
import '../constants.dart';

// Pages
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;

  Color maleCardIconColor = kInactiveIconColor;
  Color femaleCardIconColor = kInactiveIconColor;

  int height = 180;
  int weight = 60;
  int age = 20;

  PlaySound selectSound = PlaySound();

  void changeSelectedGender(kGender selectedGender) {
    if (selectedGender == kGender.male) {
      if (maleCardColor == kInActiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInActiveCardColor;
        maleCardIconColor = kActiveIconColor;
        femaleCardIconColor = kInactiveIconColor;
      } else {
        maleCardColor = kInActiveCardColor;
        maleCardIconColor = kInactiveIconColor;
      }
    } else if (selectedGender == kGender.female) {
      if (femaleCardColor == kInActiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInActiveCardColor;
        femaleCardIconColor = kActiveIconColor;
        maleCardIconColor = kInactiveIconColor;
      } else {
        femaleCardColor = kInActiveCardColor;
        femaleCardIconColor = kInactiveIconColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        selectSound.playSound('select');
                        setState(() {
                          changeSelectedGender(kGender.male);
                        });
                      },
                      colour: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconColor: maleCardIconColor,
                        iconSize: kIconSize,
                        label: 'MALE',
                        labelFontSize: kLabelFontSize,
                        labelColor: maleCardIconColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        selectSound.playSound('select');
                        setState(() {
                          changeSelectedGender(kGender.female);
                        });
                      },
                      colour: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconColor: femaleCardIconColor,
                        iconSize: kIconSize,
                        label: 'FEMALE',
                        labelFontSize: kLabelFontSize,
                        labelColor: femaleCardIconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: kLabelFontSize,
                      color: kInactiveIconColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: kActiveIconColor,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: kLabelFontSize,
                          color: kInactiveIconColor,
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveSliderColor,
                      inactiveTrackColor: kInactiveSliderColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: kActiveSliderThumbColor,
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: kActiveSliderThumbOverlayColor,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 10,
                      max: 300,
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
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: kLabelFontSize,
                                color: kInactiveIconColor),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                iconColor: Colors.white,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                iconColor: Colors.white,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: kLabelFontSize,
                              color: kInactiveIconColor),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconColor: Colors.white,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconColor: Colors.white,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(
                buttonText: 'CALCULATE',
                onTap: () async {
                  selectSound.playSound('calculate');
                  CalculateBMI calc = CalculateBMI(height: height, weight: weight);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultsPage(
                        bmiValue: calc.calculateBMI(),
                        bmiResult: calc.getResult(),
                        bmiAdvice: calc.getAdvice(),
                      )));
                })
          ],
        ));
  }
}



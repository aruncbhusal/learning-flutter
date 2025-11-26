import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age=25;
  // Yet another breach of null safety, but it's intentional

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(Gender gender){
  //   if (gender == Gender.male){
  //     maleCardColor = activeCardColor;
  //     femaleCardColor = inactiveCardColor;
  //   } else {
  //     femaleCardColor = activeCardColor;
  //     maleCardColor = inactiveCardColor;
  //   }
  // }
  // She finally introduced ternary operators and now we don't need this function



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTapAction: () {
                        setState(() {
                          // maleCardColor = maleCardColor == inactiveCardColor ? activeCardColor : inactiveCardColor;
                          // femaleCardColor = inactiveCardColor;
                          // Since we need to keep track of which gender is selected, rather than just the UI
                          // I might as well follow the course solution for this
                          selectedGender = Gender.male;
                        });
                      },
                      cardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapAction: () {
                        setState(() {
                          // femaleCardColor = femaleCardColor == inactiveCardColor ? activeCardColor : inactiveCardColor;
                          // maleCardColor = inactiveCardColor;
                          selectedGender = Gender.female;
                          // Like I expected, this doesn't implement the previous code fully, in that, we can't 'deselect' once selected
                          // Fair play, but mine was more complicated because of that one thing.
                        });
                      },
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      // Without specifying textBaseline property, it will throw an error. We want an alphabetic baseline
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kDisplayTextStyle),
                        Text('cm', style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          // Since by default overlay has 16% opacity as seen in source code, we'll keep that
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        max: 250.0,
                        min: 100.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(weight.toString(), style: kDisplayTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(age.toString(), style: kDisplayTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonText: 'CALCULATE YOUR BMI',
              onTap: (){
                // Separated the calculator logic from this file to another class in another file.
                CalculatorBrain calculatorBrain = CalculatorBrain(weight: this.weight, height: this.height);
                Map<String, dynamic> bmiInfo = calculatorBrain.calculateBMI();
                Navigator.push(context, MaterialPageRoute(builder: (context ) => ResultsPage(bmiInfo: bmiInfo),),);
              },
            )
          ],
        ),
      ),
    );
  }
}



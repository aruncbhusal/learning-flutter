import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

// This one I'll just do myself and then compare later with the course result.
// Okay the RenderFlex has been overflowing, and I'll stop at this, and I'll mention changes when appropriate

class ResultsPage extends StatelessWidget {
  ResultsPage({required Map<String, dynamic> this.bmiInfo}){}

  final Map<String, dynamic> bmiInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 50.0, left: 35.0),
              child: Text('Your Result', style: kResultTitleStyle),
            ),
          ),
          Expanded(
            // In the course, flex was used to circumvent the overflow issue at the very start
            flex: 5,
            child: Container(
                margin: EdgeInsets.all(25.0),
                padding: EdgeInsets.all(40.0),
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      bmiInfo['tier'],
                      style: kResultTextStyle.copyWith(color: bmiInfo['color']),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      bmiInfo['value'],
                      style: kResultNumStyle,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Normal BMI Range',
                          style: kResultTextStyle.copyWith(color: Colors.grey),
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: kResultTextStyle,
                        )
                      ],
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      bmiInfo['remarks'],
                      style: kResultTextStyle,
                    )
                  ],
                )
              ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE YOUR BMI',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      )

    );
  }
}



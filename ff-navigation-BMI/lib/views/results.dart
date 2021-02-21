import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/bottom-button.dart';
import 'package:robbinlaw/constants.dart';
import 'package:robbinlaw/widgets/reusable-card-enhanced.dart';

class Results extends StatelessWidget {
  Results({@required this.bmiResult});

  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your BMI',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                myColor: kActiveCardColor,
                reusableCardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                myText: 'RECALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
    );
  }
}

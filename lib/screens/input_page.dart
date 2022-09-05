import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

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
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Height',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D9E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                            ),
                            child: Slider(
                                min: 120.0,
                                max: 220.0,
                                value: height.toDouble(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.toInt();
                                  });
                                }),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(),
                )),
          )
        ],
      ),
    );
  }
}

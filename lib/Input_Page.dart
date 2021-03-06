import 'package:flutter/material.dart';
import 'Repeate_contanier.dart';
import 'RepeateTextIcon.dart';
import 'constent_variable.dart';
import 'Resultfind.dart';
import 'calculation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int slider_height = 100;
  int slider_weight = 30;
  int sliderage = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  /* child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //update_color(Gender.male);
                        selectGender = Gender.male;
                      });
                    },*/
                  child: Repeate_contanier(
                    onpressed: () {
                      setState(
                        () {
                          selectGender = Gender.male;
                        },
                      );
                    },
                    colors: selectGender == Gender.male
                        ? activationcolor
                        : deactivationcolor,
                    cardWidge: RepeateTextIcon(
                      iconData: FontAwesomeIcons.male,
                      //iconData: FontAwesomeIcons.male,
                      Label: 'MALE',
                    ),
                  ),
                  //),
                ),
                Expanded(
                  child: Repeate_contanier(
                    onpressed: () {
                      setState(
                        () {
                          selectGender = Gender.female;
                        },
                      );
                    },
                    colors: selectGender == Gender.female
                        ? activationcolor
                        : deactivationcolor,
                    cardWidge: RepeateTextIcon(
                      iconData: FontAwesomeIcons.female,
                      Label: 'FEMALE',
                    ),
                  ),
                  //),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Repeate_contanier(
                    colors: Colors.blue[900],
                    cardWidge: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: ConstentTextLabel),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$slider_height',
                              style: ConstentTextLabe2,
                            ),
                            Text(
                              'cm',
                              style: ConstentTextLabel,
                            ),
                          ],
                        ),
                        Slider(
                          value: slider_height.toDouble(),
                          min: 70.0,
                          max: 250.0,
                          activeColor: Colors.black,
                          inactiveColor: Colors.red,
                          onChanged: (double newvalue) {
                            setState(() {
                              slider_height = newvalue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Repeate_contanier(
                    cardWidge: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: ConstentTextLabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$slider_weight',
                              style: ConstentTextLabe2,
                            ),
                            Text(
                              'kg',
                              style: ConstentTextLabel,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icondata: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  slider_weight--;
                                });
                              },
                            ),
                            SizedBox(width: 20),
                            RoundIcon(
                              icondata: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  slider_weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colors: Colors.black,
                  ),
                ),
                Expanded(
                  child: Repeate_contanier(
                      cardWidge: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: ConstentTextLabel),
                          Text('$sliderage', style: ConstentTextLabe2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                icondata: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    sliderage--;
                                  });
                                },
                              ),
                              SizedBox(width: 20),
                              RoundIcon(
                                icondata: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    sliderage++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colors: Colors.black),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculation cal =
                  Calculation(heigh: slider_height, weight: slider_weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultfind(
                    bmiresult: cal.Calculations(),
                    final_result: cal.get_result(),
                    suggestion: cal.get_suggestion(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text('Calculate', style: ConstentTextLabe3),
              ),
              color: Colors.green,
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}



class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.icondata, this.onPress});
  final IconData icondata;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icondata,
        color: Colors.black,
      ),
      onPressed: onPress,
      elevation: 6,
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
      shape: CircleBorder(),
      fillColor: Colors.blueAccent,
    );
  }
}

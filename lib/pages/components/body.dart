import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulator_kuchenny/data/data.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}



class _BodyState extends State<Body> {
  var smg;
  int currentIndexUnit = 1;
  int currentProductIndex = 0;
  double currentWeightUnit = 0;
  String currentProductLabel = '';
  String currentGramaturaWord = 'Gramatura produktu';
  var currentGramaturaWordColor = Colors.white;
  String currentResult = '';
  String currentResultText = '0';
  String currentResultUnderText = '';
  String currentWeightUnitText = '0';
  String currentTextUnderTextResult = '';
  var _controller = TextEditingController();
  var _imageToShow = AssetImage('assets/launch_image2.png');

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height - (MediaQuery.of(context).size.height < 700 ? 60 : 100),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/background_kuchenny.png"),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: <Widget>[
                Text(
                  'Gramatura i produkt:',
                  style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.height < 700 ? 14 : 17),
                    fontFamily: 'Prompt',
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.7,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Container(
                    height: (MediaQuery.of(context).size.height < 700 ? 40 : 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.fromLTRB(5, 0, 13, 0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: DropdownButton<int?>(
                            value: currentProductIndex,
                            icon: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Icon(CupertinoIcons.chevron_down),
                            ),
                            iconSize: (MediaQuery.of(context).size.height < 700 ? 13 : 15),
                            isExpanded: true,
                            elevation: 16,
                            underline: Container(
                              height: 0,
                            ),
                            style: TextStyle(
                              fontSize: (MediaQuery.of(context).size.height < 700 ? 12 : 15),
                              fontFamily: 'Prompt',
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                            onChanged: (int? value) {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                FocusScope.of(context).unfocus();
                                currentProductIndex = value!;
                              });
                              calculation(currentIndexUnit, currentProductIndex,
                                  currentWeightUnit);
                            },
                            menuMaxHeight: 500,
                            items: [
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[0].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[0].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 0,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[1].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[1].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[2].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[2].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[3].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[3].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[4].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[4].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 4,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[5].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[5].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 5,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[6].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[6].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 6,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[7].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[7].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 7,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[8].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[8].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 8,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[9].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[9].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 9,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[10].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[10].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 10,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[11].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[11].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 11,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[12].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[12].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 12,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[13].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[13].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 13,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[14].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[14].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 14,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[15].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[15].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 15,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[16].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[16].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 16,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[17].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[17].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 17,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[18].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[18].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 18,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[19].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[19].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 19,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[20].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[20].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 20,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[21].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[21].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 21,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[22].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[22].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 22,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[23].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[23].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 23,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[24].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[24].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 24,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[25].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[25].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 25,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[26].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[26].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 26,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[27].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[27].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 27,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[28].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[28].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 28,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[29].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[29].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 29,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[30].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[30].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 30,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[31].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[31].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 31,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[32].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[32].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 32,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[33].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[33].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 33,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[34].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[34].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 34,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[35].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[35].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 35,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[36].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[36].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 36,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[37].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[37].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 37,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[38].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[38].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 38,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[39].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[39].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 39,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[40].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[40].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 40,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[41].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[41].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 41,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[42].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[42].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 42,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[43].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[43].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 43,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[44].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[44].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 44,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Text(loadProduct()[45].label),
                                    Expanded(
                                      child: Text(
                                        loadProduct()[45].type,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: (MediaQuery.of(context).size.width < 380 ? 8 : 11),
                                          fontFamily: 'Prompt',
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                value: 45,
                              ),
                            ],
                            hint: Text("Wybierz produkt")),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                  child: Container(
                    height: (MediaQuery.of(context).size.height < 700 ? 40 : 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
                      controller: _controller,
                      onChanged: (number) {
                        double numberDouble =
                        double.parse(number.replaceAll(',', '.'));
                        changeWeightUnit(numberDouble);

                        calculation(currentIndexUnit, currentProductIndex,
                            currentWeightUnit);
                      },
                      style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.height < 700 ? 12 : 15),
                        fontFamily: 'Prompt',
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Icon(CupertinoIcons.xmark),
                            ),
                            iconSize: (MediaQuery.of(context).size.width < 400 ? 13 : 15),
                            onPressed: () {
                              setState(() {
                                _controller.clear();
                                changeWeightUnit(0);
                              });
                            }
                          // changeWeightUnit(0);
                        ),
                        contentPadding:
                        const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        fillColor: Colors.white,
                        hintText: "Gramatura [g]",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      Text(
                        'Jednostka:',
                        style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.height < 700 ? 14 : 17),
                          fontFamily: 'Prompt',
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.7,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                unitButton("Szklanka", 1),
                                unitButton("Łyżka", 16),
                                unitButton("Łyżeczka", 50),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: (MediaQuery.of(context).size.height < 700 ? 10 : 30),
                  color: Colors.white60,
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        children: [
                          Text(
                            "$currentWeightUnitText" "g",
                            style: TextStyle(
                              fontSize: (MediaQuery.of(context).size.height < 700 ? 16 : 28),
                              fontFamily: 'Prompt',
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.7,
                            ),
                          ),
                          Text(
                            currentGramaturaWord,
                            style: TextStyle(
                              fontSize: (MediaQuery.of(context).size.height < 700 ? 10 : 15),
                              fontFamily: 'Prompt',
                              color: currentGramaturaWordColor,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                      child: Column(
                        children: [
                          Text(
                            loadProduct()[currentProductIndex].label,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: (MediaQuery.of(context).size.height < 700 ? 14 : 26),
                              fontFamily: 'Prompt',
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.7,
                            ),
                          ),
                          Text(
                            "Produkt",
                            style: TextStyle(
                              fontSize: (MediaQuery.of(context).size.height < 700 ? 10 : 15),
                              fontFamily: 'Prompt',
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: (MediaQuery.of(context).size.height < 700 ? 10 : 30),
                      color: Colors.white60,
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  currentResult,
                                  style: TextStyle(
                                    fontSize: (MediaQuery.of(context).size.height < 700 ? 20 : 36),
                                    fontFamily: 'Prompt',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Image(
                                  image: _imageToShow,
                                  height: (MediaQuery.of(context).size.height < 700 ? 20 : 36),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              currentTextUnderTextResult,
                              style: TextStyle(
                                fontSize: (MediaQuery.of(context).size.height < 700 ? 10 : 15),
                                fontFamily: 'Prompt',
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void changeWeightUnit(double weightUnit) {
    setState(() {
      if (weightUnit > 100000) {
        currentGramaturaWord = "Wartość maksymalna";
        currentGramaturaWordColor = Colors.deepOrange;
        currentWeightUnitText = '100000';
      } else if (weightUnit < 0) {
        currentGramaturaWordColor = Colors.deepOrange;
        currentWeightUnitText = '0';
      } else {
        currentGramaturaWord = "Gramatura produktu";
        currentGramaturaWordColor = Colors.white;
        currentWeightUnit = weightUnit;
        currentWeightUnitText = weightUnit.toStringAsFixed(
            weightUnit.truncateToDouble() == weightUnit ? 0 : 1);
      }
    });
  }

  void changeIndexUnit(int indexUnit) {
    setState(() {
      currentIndexUnit = indexUnit;
      calculation(currentIndexUnit, currentProductIndex, currentWeightUnit);
    });
  }

  void calculation(int currentIndexUnit, int currentProductIndex,
      double currentWeightUnit) {
    setState(() {
      var calculationResult = (currentWeightUnit /
          (loadProduct()[currentProductIndex].base / currentIndexUnit));
      currentResultText = '';
      currentTextUnderTextResult = 'Ilość';
      if (currentIndexUnit == 1) {
        currentResultText = calculationResult.toStringAsFixed(
            calculationResult.truncateToDouble() == calculationResult ? 0 : 1);
      } else if (currentIndexUnit == 16) {
        currentResultText = calculationResult.toStringAsFixed(
            calculationResult.truncateToDouble() == calculationResult ? 0 : 1);
      } else if (currentIndexUnit == 50) {
        currentResultText = calculationResult.toStringAsFixed(
            calculationResult.truncateToDouble() == calculationResult ? 0 : 1);
      }

      currentResult = currentResultText;
      if (currentIndexUnit == 1) {
        _imageToShow = new AssetImage('assets/glass_drawing_white.png');
      } else if (currentIndexUnit == 16) {
        _imageToShow = new AssetImage('assets/spoon_drawing_white.png');
      } else if (currentIndexUnit == 50) {
        _imageToShow = new AssetImage('assets/teaspoon_drawing_white.png');
      }

      if (calculationResult == 0) {
        currentResult = '?';
      }

      print(MediaQuery.of(context).size.width);
    });
  }

  Widget unitButton(String value, int index) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
          child: TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                changeIndexUnit(index);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color?>(
                  currentIndexUnit == index ? Colors.deepOrange : Colors.white,
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width < 380 ? 13 : 16),
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.7,
                  color:
                      currentIndexUnit == index ? Colors.white : Colors.black,
                ),
              ))),
    ));
  }
}

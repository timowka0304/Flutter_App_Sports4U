import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sport_app/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sport_app/theme/colors.dart';
import 'package:sport_app/widgets/radio_option.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Health(),
  ));
}

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  String _groupValue1 = 'none';
  String _groupValue2 = 'none';
  String _groupValue3 = 'none';
  String _groupValue4 = 'none';
  String _groupValue5 = 'none';
  late FToast fToast;
  late Timer _timer;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg5.png"),
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                left: 10,
                top: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/user_choose');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: <Widget>[
                      const Text("Оцените важность\nкаждого качества",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28),
                          textAlign: TextAlign.center),
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            height: 60.0,
                            width: 350.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.colors.secondaryOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Дыхательная функция",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          MyRadioOption<String>(
                                            value: '1',
                                            groupValue: _groupValue1,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue1 = val.toString();
                                              });
                                            },
                                            label: '1',
                                            text: "",
                                          ),
                                          MyRadioOption<String>(
                                            value: '2',
                                            groupValue: _groupValue1,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue1 = val.toString();
                                              });
                                            },
                                            label: '2',
                                            text: "",
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 60.0,
                            width: 350.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.colors.secondaryOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Иммунитет",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          MyRadioOption<String>(
                                            value: '1',
                                            groupValue: _groupValue2,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue2 = val.toString();
                                              });
                                            },
                                            label: '1',
                                            text: "",
                                          ),
                                          MyRadioOption<String>(
                                            value: '2',
                                            groupValue: _groupValue2,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue2 = val.toString();
                                              });
                                            },
                                            label: '2',
                                            text: "",
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 60.0,
                            width: 350.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.colors.secondaryOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Нервная система",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          MyRadioOption<String>(
                                            value: '1',
                                            groupValue: _groupValue3,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue3 = val.toString();
                                              });
                                            },
                                            label: '1',
                                            text: "",
                                          ),
                                          MyRadioOption<String>(
                                            value: '2',
                                            groupValue: _groupValue3,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue3 = val.toString();
                                              });
                                            },
                                            label: '2',
                                            text: "",
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 60.0,
                            width: 350.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.colors.secondaryOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Опорно-двигательный\nаппарат",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          MyRadioOption<String>(
                                            value: '1',
                                            groupValue: _groupValue4,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue4 = val.toString();
                                              });
                                            },
                                            label: '1',
                                            text: "",
                                          ),
                                          MyRadioOption<String>(
                                            value: '2',
                                            groupValue: _groupValue4,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue4 = val.toString();
                                              });
                                            },
                                            label: '2',
                                            text: "",
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 60.0,
                            width: 350.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.colors.secondaryOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Сердечно-сосудистая\nсистема",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          MyRadioOption<String>(
                                            value: '1',
                                            groupValue: _groupValue5,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue5 = val.toString();
                                              });
                                            },
                                            label: '1',
                                            text: "",
                                          ),
                                          MyRadioOption<String>(
                                            value: '2',
                                            groupValue: _groupValue5,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupValue5 = val.toString();
                                              });
                                            },
                                            label: '2',
                                            text: "",
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            child: Text("Далее",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppTheme.colors.mainOrange)),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.colors.mainOrange),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: AppTheme.colors.white))),
                              overlayColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  return states.contains(MaterialState.pressed)
                                      ? AppTheme.colors.effectOrange
                                      : null;
                                },
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if ((_groupValue1 != 'none') &&
                                    (_groupValue2 != 'none') &&
                                    (_groupValue3 != 'none') &&
                                    (_groupValue4 != 'none') &&
                                    (_groupValue5 != 'none')) {
                                  fToast.removeCustomToast();
                                  fToast.removeQueuedCustomToasts();
                                  _showLoadinWindow();
                                  //saveData();
                                  //Navigator.pushReplacementNamed(
                                  //context, '/result');
                                } else {
                                  _showToast();
                                }
                              }
                            }),
                      )
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoadinWindow() async {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          _timer = Timer(const Duration(seconds: 5), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
            backgroundColor: AppTheme.colors.mainOrange,
            title: const Text('Пожалуйста, подождите.',
                style: TextStyle(color: Colors.white)),
            content: const SingleChildScrollView(
              child: Text('Подбираем виды спорта на основе вашего выбора.',
                  style: TextStyle(color: Colors.white)),
            ),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('target:health:value_1', int.parse(_groupValue1));
    prefs.setInt('target:health:value_2', int.parse(_groupValue2));
    prefs.setInt('target:health:value_3', int.parse(_groupValue3));
    prefs.setInt('target:health:value_4', int.parse(_groupValue4));
    prefs.setInt('target:health:value_5', int.parse(_groupValue5));
    prefs.setString("target:name", "health");
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppTheme.colors.secondaryOrange,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.warning, color: Colors.white),
          SizedBox(
            width: 12.0,
          ),
          Text("Сначала нужно выбрать все параметры!",
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      positionedToastBuilder: (context, child) =>
          Positioned(bottom: 10.0, left: 0, right: 0, child: child),
      toastDuration: const Duration(seconds: 3),
    );
  }
}

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sport_app/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Result(),
  ));
}

void launchMap(String query) async {
  String querySearch = Uri.encodeComponent(query);
  String googleUrl =
      "https://www.google.com/maps/search/?api=1&query=$querySearch";

  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  }
}

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class Activity {
  String type;
  String name;
  int difference;
  late List<int> priority;

  Activity(this.type, this.name, value_1, value_2, value_3, value_4, value_5,
      this.difference) {
    priority = [value_1, value_2, value_3, value_4, value_5];
  }
}

class _ResultState extends State<Result> {
  List<Activity> listActivities = [
    Activity("health", "Боевые искусства", 2, 2, 2, 2, 2, 0),
    Activity("health", "Волейбол", 2, 1, 2, 1, 2, 0),
    Activity("health", "Плавание", 2, 2, 2, 2, 2, 0),
    Activity("health", "Футбол", 2, 1, 2, 1, 2, 0),
    Activity("health", "Хоккей", 2, 1, 2, 1, 2, 0),
    Activity("phisisc", "Боевые искусства", 2, 2, 2, 2, 2, 0),
    Activity("phisisc", "Волейбол", 1, 2, 2, 1, 1, 0),
    Activity("phisisc", "Плавание", 2, 1, 2, 1, 1, 0),
    Activity("phisisc", "Футбол", 2, 1, 2, 2, 2, 0),
    Activity("phisisc", "Хоккей", 2, 1, 2, 2, 2, 0)
  ];

  String btnLblOne = "111";
  String btnLblTwo = "2222";
  String btnLblThree = "33";

  late Timer _timer;

  var name = "name";
  var phone = "phone";
  var nameUser;
  var firstBtntext;
  var dataFireBaseType;
  var nameActivity;
  late List<int?> userValues;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    _getData();
    //getNameActivity("user:name");
  }

  Future _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nameUser = prefs.getString("user:name");
      print(nameUser);
      nameActivity = prefs.getString("target:name");
      print(nameActivity);
      List<int?> userValues = [
        prefs.getInt("target:value_1"),
        prefs.getInt("target:value_2"),
        prefs.getInt("target:value_3"),
        prefs.getInt("target:value_4"),
        prefs.getInt("target:value_5")
      ];
      print(userValues);
    });
  }

  // void _showLoadinWindow() async {
  //   await Future.delayed(const Duration(microseconds: 1));
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext builderContext) {
  //         _timer = Timer(const Duration(seconds: 5), () {
  //           Navigator.of(context, rootNavigator: true).pop();
  //         });

  //         return AlertDialog(
  //             backgroundColor: AppTheme.colors.mainOrange,
  //             title: const Text('Пожалуйста, подождите.',
  //                 style: TextStyle(color: Colors.white)),
  //             content: const SingleChildScrollView(
  //               child: Text('Подбираем виды спорта на основе вашего выбора.',
  //                   style: TextStyle(color: Colors.white)),
  //             ));

  //         // return Dialog(
  //         //   shape: RoundedRectangleBorder(
  //         //       borderRadius: BorderRadius.circular(20.0)), //this right here
  //         //   child: Container(
  //         //     height: 250,
  //         //     color: AppTheme.colors.mainOrange,
  //         //     child: Padding(
  //         //       padding: const EdgeInsets.all(10.0),
  //         //       child:
  //         //           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //         //         Column(
  //         //           crossAxisAlignment: CrossAxisAlignment.center,
  //         //           children: const [
  //         //             Text('Пожалуйста, подождите.',
  //         //                 textAlign: TextAlign.center,
  //         //                 style: TextStyle(color: Colors.white, fontSize: 24)),
  //         //             SizedBox(height: 30),
  //         //             Text('Подбираем виды спорта на основе вашего выбора.',
  //         //                 textAlign: TextAlign.center,
  //         //                 style: TextStyle(color: Colors.white, fontSize: 12)),
  //         //           ],
  //         //         )
  //         //       ]),
  //         //     ),
  //         //   ),
  //         // );
  //       }).then((val) {
  //     if (_timer.isActive) {
  //       _timer.cancel();
  //       loadinIsDone = true;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //_showLoadinWindow();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg6.png"),
                fit: BoxFit.cover,
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: <Widget>[
                    Text(
                        nameUser.substring(0) +
                            ", рекомендуем\nэти виды спорта",
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            child: Text("none",
                                style: const TextStyle(fontSize: 20)),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppTheme.colors.mainOrange),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: AppTheme.colors.mainOrange)))),
                            onPressed: () {}),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                          child:
                              Text(name, style: const TextStyle(fontSize: 20)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.colors.mainOrange),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: AppTheme.colors.mainOrange)))),
                          onPressed: () {}),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                          child:
                              Text(phone, style: const TextStyle(fontSize: 20)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.colors.mainOrange),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: AppTheme.colors.mainOrange)))),
                          onPressed: () {
                            launchMap("футбол секции рядом");
                          }),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                          child: Text("В меню",
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
                            Navigator.pushReplacementNamed(context, '/');
                          }),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

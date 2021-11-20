// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sport_app/pages/user_choose.dart';
import 'package:sport_app/theme/app_theme.dart';
import 'package:sport_app/pages/user_form.dart';
import 'package:sport_app/pages/phisics.dart';
import 'package:sport_app/pages/health.dart';
import 'package:sport_app/pages/result.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const MyApp(),
      '/user_form': (context) => const UserForm(),
      '/user_choose': (context) => const UserChoose(),
      '/phisics': (context) => const Phisics(),
      '/health': (context) => const Health(),
      '/result': (context) => const Result(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
            key: _formKey,
            child: Scaffold(
                body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        width: 300,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.contain),
                        ))),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                              child: const Text("Заполнить анкету",
                                  style: TextStyle(fontSize: 20)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppTheme.colors.mainOrange),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: AppTheme.colors.mainOrange)))),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/user_form');
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            child: const Text("Найти секцию",
                                style: TextStyle(fontSize: 20)),
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
                                          color: AppTheme.colors.mainOrange))),
                              overlayColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  return states.contains(MaterialState.pressed)
                                      ? Colors.white10
                                      : null;
                                },
                              ),
                            ),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              if (prefs.getString("user:name") != null) {
                                _btnEnabled = true;
                                print(prefs.getString('user:name'));
                              }
                              if (_formKey.currentState.validate()) {
                                if (_btnEnabled == true) {
                                  fToast.removeCustomToast();
                                  fToast.removeQueuedCustomToasts();
                                  Navigator.pushReplacementNamed(
                                      context, '/result');
                                } else {
                                  _showToast();
                                }
                              }
                            }),
                      ),
                    ],
                  ),
                ]),
              ]),
            ))));
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
          Text("Сначала нужно заполнить анкету!",
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }
}

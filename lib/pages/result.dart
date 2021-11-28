import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
    Activity("phisics", "Боевые искусства", 2, 2, 2, 2, 2, 0),
    Activity("phisics", "Волейбол", 1, 2, 2, 1, 1, 0),
    Activity("phisics", "Плавание", 2, 1, 2, 1, 1, 0),
    Activity("phisics", "Футбол", 2, 1, 2, 2, 2, 0),
    Activity("phisics", "Хоккей", 2, 1, 2, 2, 2, 0)
  ];

  var nameUser;
  var nameTarget;
  late List<int> userValues;
  late String city;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    _getData();
    //getNameActivity("user:name");
  }

  void _initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int value_1 = prefs.getInt("target:value_1")!.toInt();
    int value_2 = prefs.getInt("target:value_2")!.toInt();
    int value_3 = prefs.getInt("target:value_3")!.toInt();
    int value_4 = prefs.getInt("target:value_4")!.toInt();
    int value_5 = prefs.getInt("target:value_5")!.toInt();
    String birth = prefs.getString("user:birth")!;
    city = prefs.getString("user:city")!;
    await FirebaseFirestore.instance.collection("users").add({
      "name": nameUser,
      "birth": birth,
      "city": city,
      "target": nameTarget,
      "value_1": value_1,
      "value_2": value_2,
      "value_3": value_3,
      "value_4": value_4,
      "value_5": value_5
    });
  }

  Future _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nameUser = prefs.getString("user:name");
      nameTarget = prefs.getString("target:name");
      List<int> userValues = [
        prefs.getInt("target:value_1")!.toInt(),
        prefs.getInt("target:value_2")!.toInt(),
        prefs.getInt("target:value_3")!.toInt(),
        prefs.getInt("target:value_4")!.toInt(),
        prefs.getInt("target:value_5")!.toInt()
      ];

      for (int i = 0; i < listActivities.length; i++) {
        int dif = 0;
        if (listActivities[i].type == nameTarget) {
          for (int j = 0; j < 5; j++) {
            listActivities[i].priority[j] == userValues[j] ? dif : dif += 1;
          }
        } else {
          dif = 10;
        }
        listActivities[i].difference = dif;
      }

      listActivities.sort((a, b) => a.difference.compareTo(b.difference));
      for (int i = 0; i < listActivities.length; i++) {
        print(listActivities[i].name);
        print(listActivities[i].difference);
        print("\n");
      }
      _initFirebase();
    });
  }

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
                    const Text("Рекомендуем\nэти виды спорта",
                        style: TextStyle(
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
                            child: Text(listActivities[0].name,
                                style: const TextStyle(fontSize: 20)),
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
                              launchMap(city +
                                  listActivities[0].name +
                                  " cпортивная школа ");
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
                          child: Text(listActivities[1].name,
                              style: const TextStyle(fontSize: 20)),
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
                            launchMap(city +
                                listActivities[1].name +
                                " cпортивная школа ");
                          }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                          child: Text(listActivities[2].name,
                              style: const TextStyle(fontSize: 20)),
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
                            launchMap(city +
                                listActivities[2].name +
                                " cпортивная школа ");
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

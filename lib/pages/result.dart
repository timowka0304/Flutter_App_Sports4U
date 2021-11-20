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
  late List<int> priority;

  Activity(this.type, this.name, value_1, value_2, value_3, value_4, value_5) {
    priority = [value_1, value_2, value_3, value_4, value_5];
  }
}

class _ResultState extends State<Result> {
  var martialArtsH = Activity("health", "Боевые искусства", 2, 2, 2, 2, 2);
  var volleyballH = Activity("health", "Волейбол", 2, 1, 2, 1, 2);
  var swimmingH = Activity("health", "Плавание", 2, 2, 2, 2, 2);
  var footballH = Activity("health", "Футбол", 2, 1, 2, 1, 2);
  var hockeyH = Activity("health", "Хоккей", 2, 1, 2, 1, 2);

  var martialArtsP = Activity("phisisc", "Боевые искусства", 2, 2, 2, 2, 2);
  var volleyballP = Activity("phisisc", "Волейбол", 1, 2, 2, 1, 1);
  var swimmingP = Activity("phisisc", "Плавание", 2, 1, 2, 1, 1);
  var footballP = Activity("phisisc", "Футбол", 2, 1, 2, 2, 2);
  var hockeyP = Activity("phisisc", "Хоккей", 2, 1, 2, 2, 2);

  String btnLblOne = "111";
  String btnLblTwo = "2222";
  String btnLblThree = "33";

  var name = "name";
  var phone = "phone";
  var dataFireBaseArr;
  var dataFireBaseType;

  //void initFirebase() async {}

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    const Text("Рекомендуем эти\nвиды спорта",
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
                            child: Text(dataFireBaseType.toString(),
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

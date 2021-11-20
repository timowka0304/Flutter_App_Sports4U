import 'package:flutter/material.dart';
import 'package:sport_app/theme/app_theme.dart';
import 'package:sport_app/pages/user_form.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserChoose(),
  ));
}

class UserChoose extends StatefulWidget {
  const UserChoose({Key? key}) : super(key: key);

  @override
  _UserChooseState createState() => _UserChooseState();
}

class _UserChooseState extends State<UserChoose> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg3.png"),
                fit: BoxFit.cover,
              ),
            )),
            // Positioned(
            //   left: 10,
            //   top: 10,
            //   child: IconButton(
            //     icon: const Icon(Icons.arrow_back_ios),
            //     color: Colors.white,
            //     onPressed: () {
            //       Navigator.pushReplacementNamed(context, '/user_form');
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: <Widget>[
                    const Text("Выберите свою цель",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            child: const Text("Физическая форма",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center),
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
                                  context, '/phisics');
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
                          child: const Text("Здоровье",
                              style: TextStyle(fontSize: 18)),
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
                            Navigator.pushReplacementNamed(context, '/health');
                          }),
                    ),
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

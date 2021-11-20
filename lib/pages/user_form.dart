import 'package:flutter/material.dart';
import 'package:sport_app/theme/app_theme.dart';
import 'package:intl/intl.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserForm(),
  ));
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late FToast fToast;
  late bool stateFirstText;
  late bool stateSecondText;
  late bool stateThirdText;

  late String textForm1;
  late String textForm2;
  late String textForm3;

  TextEditingController dateFormController = TextEditingController();
  TextEditingController nameFormController = TextEditingController();
  TextEditingController cityFormController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    stateFirstText = false;
    stateSecondText = false;
    stateThirdText = false;
  }

  final _formKey = GlobalKey<FormState>();

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
                    image: AssetImage("assets/images/bg2.png"),
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
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(children: <Widget>[
                          const Text("Заполните свои\nличные данные",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 28),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.colors.secondaryOrange,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TextFormField(
                                controller: nameFormController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.white70),
                                  hintText: 'Имя Фамилия Отчество',
                                  errorStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                ),
                                style: const TextStyle(color: Colors.white),
                                enableInteractiveSelection: false,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    stateFirstText = true;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.colors.secondaryOrange,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TextFormField(
                                controller: dateFormController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.white70),
                                  hintText: 'Дата рождения',
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                ),
                                style: const TextStyle(color: Colors.white),
                                enableInteractiveSelection: false,
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          helpText: 'Дата рождения',
                                          cancelText: 'Отмена',
                                          confirmText: 'Выбрать',
                                          errorFormatText:
                                              'Введите правильную дату',
                                          errorInvalidText:
                                              'Введите правильную дату',
                                          fieldLabelText: 'Введите дату',
                                          fieldHintText: 'Месяц/день/год',
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                    primary: AppTheme
                                                        .colors.mainOrange,
                                                    onPrimary:
                                                        AppTheme.colors.white,
                                                    onSurface:
                                                        AppTheme.colors.black),
                                              ),
                                              child: child!,
                                            );
                                          },
                                          firstDate: DateTime(2003),
                                          lastDate: DateTime.now())
                                      .then((date) {
                                    if (date != null) {
                                      dateFormController.text =
                                          DateFormat('dd-MM-yyyy').format(date);
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    stateSecondText = true;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.colors.secondaryOrange,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TextFormField(
                                controller: cityFormController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.white70),
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  hintText: 'Новосибирск',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                ),
                                style: const TextStyle(color: Colors.white),
                                enableInteractiveSelection: false,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    stateThirdText = true;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 150,
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
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppTheme.colors.mainOrange),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppTheme.colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: AppTheme.colors.white))),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) {
                                      return states
                                              .contains(MaterialState.pressed)
                                          ? AppTheme.colors.effectOrange
                                          : null;
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      stateFirstText == true &&
                                      stateSecondText == true &&
                                      stateThirdText == true) {
                                    fToast.removeCustomToast();
                                    fToast.removeQueuedCustomToasts();
                                    saveData();
                                    Navigator.pushReplacementNamed(
                                        context, '/user_choose');
                                  } else {
                                    _showToast();
                                  }
                                }),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ))));
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user:name", nameFormController.text);
    prefs.setString("user:birth", dateFormController.text);
    prefs.setString("user:city", cityFormController.text);
    print(prefs.getString("user:name"));
    print(prefs.getString("user:birth"));
    print(prefs.getString("user:city"));
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
            height: 8.0,
          ),
          Text("Сначала нужно заполнить все поля!",
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

import 'package:flutter/material.dart';
import 'package:sport_app/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';

class Activity {
  String type;
  String name;
  late List<int> priority;

  Activity(this.type, this.name, value_1, value_2, value_3, value_4, value_5) {
    priority = [value_1, value_2, value_3, value_4, value_5];
  }
}

class InitT {
  var dataFireBaseArr;
  var dataFireBaseType;
  Future<void> initial() async {
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

    base();
    print_data();
  }

  void get_data() {
    var document = FirebaseFirestore.instance
        .collection('users')
        .doc("target")
        .snapshots();
    document.forEach((document) {
      dataFireBaseType = document.data()!.values.first.toString();
      print("Test1\n");
      dataFireBaseType = document.data()!.values.first.toString();
      print("Test2\n");
      dataFireBaseArr = document.data()!.values.last;
    });
    print_data();
    print_data();
  }

  void base() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    get_data();
  }

  void print_data() {
    print(dataFireBaseType);
    print(dataFireBaseArr);
  }
}

void main(List<String> args) {}

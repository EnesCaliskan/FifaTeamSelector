import 'package:flutter/material.dart';
import 'package:untitled1/project_assets/colors.dart';
import 'package:untitled1/widgets/home_screen_widgets/TeamLogoWidget.dart';
import '../model/team.dart';
import 'package:untitled1/model/TeamJSON.dart' as teamJson;
import 'dart:math';



class MainScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Team> teams = getTeams();
  Random rnd = Random();

 static List<Team> getTeams(){ // getting team data from JSON
    return teamJson.data.map<Team>(Team.fromJson).toList();
  }


  @override
  Widget build(BuildContext context) {
    var randomList1 = (teams.toList()..shuffle()).first;
    var randomList2 = (teams.toList()..shuffle()).first;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Container(
                  child: Text(
                    'Team Selector',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TeamLogo(teamName: randomList1),
                  TeamLogo(teamName: randomList2),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: ElevatedButton(
              child: Text('Roll two random teams'),
              onPressed: (){
                setState(() {
                  teams.shuffle();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}



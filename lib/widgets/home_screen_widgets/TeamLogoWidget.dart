import 'package:flutter/material.dart';
import 'package:untitled1/model/team.dart';
import 'package:untitled1/project_assets/colors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class TeamLogo extends StatefulWidget {
  TeamLogo({required this.teamName});
  Team teamName;

  @override
  State<TeamLogo> createState() => _TeamLogoState();
}

class _TeamLogoState extends State<TeamLogo> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TeamName(teamName: widget.teamName.name),
        TeamCrestImage(teamImage: widget.teamName.image),
        TeamStars(starCount: widget.teamName.stars),
        TeamStats(teamStats: widget.teamName),
      ],
    );
  }
}

class TeamStars extends StatefulWidget {
  double starCount;

  TeamStars({required this.starCount});

  @override
  State<TeamStars> createState() => _TeamStarsState();
}

class _TeamStarsState extends State<TeamStars> {
  @override
  Widget build(BuildContext context) {
    return Padding( // team stars here
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        child: SmoothStarRating(
            color: Colors.amber,
            rating:  widget.starCount,
            starCount: 5,
            isReadOnly: true,
            allowHalfRating: true,
        ),
      ),
    );
  }
}

class TeamCrestImage extends StatefulWidget {
  TeamCrestImage({required this.teamImage});
  String teamImage;

  @override
  State<TeamCrestImage> createState() => _TeamCrestImageState();
}

class _TeamCrestImageState extends State<TeamCrestImage> {
  bool selectedTeam = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedTeam = !selectedTeam;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: selectedTeam ? kActiveCardColour : Colors.transparent,
          border: Border.all(
            color: kDarkPurple,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Image(
            image: NetworkImage('${widget.teamImage}'), // team logo image
          ),
        ),
      ),
    );
  }
}

class TeamName extends StatelessWidget {
  TeamName({required this.teamName});
  String teamName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Container(
        child: Text(
          //'Galatasaray',
          teamName,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TeamStats extends StatelessWidget {
  TeamStats({required this.teamStats});

  Team teamStats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            TeamStatsNumbers(statName: 'ATT',statNumber: teamStats.att),
            TeamStatsNumbers(statName: 'MID',statNumber: teamStats.mid),
            TeamStatsNumbers(statName: 'DEF',statNumber: teamStats.def),
          ],
        ),
      ),
    );
  }
}

class TeamStatsNumbers extends StatelessWidget {
  const TeamStatsNumbers({
    Key? key, required this.statName, required this.statNumber,
  }) : super(key: key);

  final String statName;
  final int statNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Column(
          children: [
            Text(
              statName,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
              ),
            ),
            Text(
              statNumber.toString(),
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Team {
  final String name;
  final String league;
  final int att;
  final int mid;
  final int def;
  final double stars;
  final String image;

  const Team({
    required this.name,
    required this.league,
    required this.att,
    required this.mid,
    required this.def,
    required this.stars,
    required this.image,
  });

  static Team fromJson(json) => Team(
      name: json['name'],
      league: json['league'],
      att: json['att'],
      mid: json['mid'],
      def: json['def'],
      stars: json['stars'],
      image: json['image'],
  );

}


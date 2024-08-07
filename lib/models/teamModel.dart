class TeamModel {
  final String id;
  final String name;
  final String country;
  final String logo;

  TeamModel({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
  });

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'].toString(),
      name: map['name'],
      country: map['country'],
      logo: map['logo'],
    );
  }
}

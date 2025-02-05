class Cast {
  int id;
  int order;
  bool adult;
  int gender;
  int castId;
  String job;
  String name;
  String creditId;
  String character;
  double popularity;
  String department;
  String profilePath;
  String originalName;
  String knownForDepartment;

  Cast({
    required this.id,
    required this.job,
    required this.name,
    required this.order,
    required this.adult,
    required this.castId,
    required this.gender,
    required this.creditId,
    required this.character,
    required this.department,
    required this.popularity,
    required this.profilePath,
    required this.originalName,
    required this.knownForDepartment,
  });
}

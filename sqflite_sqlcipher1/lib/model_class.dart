class StudentModel {
  String name;
  int roll;
  bool isMale;
  double result;
  StudentModel({
    required this.name,
    required this.roll,
    required this.isMale,
    required this.result,
  });

  Map<String, dynamic> toJson() {
    return {
      "nameColumn": name,
      "rollColumn": roll,
      "isMaleColumn": isMale,
      "resultColumn": result,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json["nameColumn"],
      roll: json["rollColumn"],
      isMale: json["isMaleColumn"],
      result: json["resultColumn"]?.toDouble(),
    );
  }
}

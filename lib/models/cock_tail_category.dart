class CockTailCategory {
  late String name;

  CockTailCategory.fromJson(Map<String, dynamic> json) {
    name = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    return {"strCategory": name};
  }
}

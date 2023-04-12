class ModelsModel {
  final String id;
  final String root;
  final int created;

  ModelsModel({required this.id, required this.created, required this.root});

  factory ModelsModel.fromJson(Map<String, dynamic> json) {
    return ModelsModel(
        id: json["id"], created: json["created"], root: json["root"]);
  }

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot){
    return modelSnapshot.map((data) =>ModelsModel.fromJson(data) ).toList();
  }
}

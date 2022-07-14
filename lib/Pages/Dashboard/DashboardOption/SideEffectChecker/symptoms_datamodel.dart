class symptomDataModel{
  int?id;
  String?problemName;
  String?isVisible;
  symptomDataModel({
    this.id,
    this.problemName,
    this.isVisible,
  });
  factory symptomDataModel.fromJson(Map<String, dynamic> json) =>
      symptomDataModel(
        id: json['id'],
        problemName: json['problemName'],
        isVisible: json['isVisible'],
      );
}
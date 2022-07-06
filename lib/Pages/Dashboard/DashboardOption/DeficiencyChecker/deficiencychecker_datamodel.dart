class AllSymptomsrDataModel{
  int?id;
  String?problemName;
  String?isVisible;
  AllSymptomsrDataModel({
    this.id,
    this.problemName,
    this.isVisible,
  });
  factory AllSymptomsrDataModel.fromJson(Map<String, dynamic> json) =>
      AllSymptomsrDataModel(
        id: json['id'],
        problemName: json['problemName'],
        isVisible: json['isVisible'],
      );
}
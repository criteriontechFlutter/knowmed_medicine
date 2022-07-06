class InteractionCheckerDataModel{
  int?id;
  String?medicineName;
  String?description;
  InteractionCheckerDataModel({
    this.id,
    this.medicineName,
    this.description,
  });
  factory InteractionCheckerDataModel.fromJson(Map<String, dynamic> json) =>
      InteractionCheckerDataModel(
        id: json['medicineID'],
        medicineName: json['medicineName'],
        description: json['overview'],
      );
}
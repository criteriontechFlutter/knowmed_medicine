class medicineCheckerDataModel{
  int?id;
  String?medicineName;
  String?description;
  medicineCheckerDataModel({
    this.id,
    this.medicineName,
    this.description,
  });
  factory medicineCheckerDataModel.fromJson(Map<String, dynamic> json) =>
      medicineCheckerDataModel(
        id: json['medicineID'],
        medicineName: json['medicineName'],
        description: json['overview'],
      );
}
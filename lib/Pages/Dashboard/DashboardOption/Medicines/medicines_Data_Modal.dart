class MedicineDataModal{

  String? id;
  String? medicineName;
  String? medicineBrand;

  MedicineDataModal({

    this.id,
    this.medicineName,
    this.medicineBrand
});

  factory MedicineDataModal.fromJson(Map<String , dynamic >json) =>MedicineDataModal(
    id: json['id'].toString(),
    medicineName: json['medicineName'].toString(),
    medicineBrand: json['medicineBrand'].toString(),
  );
}
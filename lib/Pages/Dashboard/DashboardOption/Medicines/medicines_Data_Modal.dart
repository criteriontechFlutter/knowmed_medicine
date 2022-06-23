class MedicineDataModal {
  String? id;
  String? medicineName;
  String? medicineBrand;

  MedicineDataModal({this.id, this.medicineName, this.medicineBrand});

  MedicineDataModal.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    medicineName = json['medicineName'];
    medicineBrand = json['medicineBrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicineName'] = this.medicineName;
    data['medicineBrand'] = this.medicineBrand;
    return data;
  }
}
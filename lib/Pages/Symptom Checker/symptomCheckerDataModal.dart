class SymptomCheckerDataModal {
  int? id;
  String? regionName;
  String? organImagePath;

  SymptomCheckerDataModal({this.id, this.regionName, this.organImagePath});

  SymptomCheckerDataModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionName = json['regionName'];
    organImagePath = json['organImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regionName'] = this.regionName;
    data['organImagePath'] = this.organImagePath;
    return data;
  }
}
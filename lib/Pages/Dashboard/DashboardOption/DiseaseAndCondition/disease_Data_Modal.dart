// class DiseaseDataModal{
//
//   String? id;
//   String? problemName;
//
//   DiseaseDataModal({
//
//     this.id,
//     this.problemName,
//
// });
//
//   factory DiseaseDataModal.fromJson(Map<String , dynamic >json) =>DiseaseDataModal(
//     id: json['id'].toString(),
//     problemName: json['problemName'].toString(),
//
//   );
// }

class DiseaseDataModal {
  int? id;
  String? problemName;

  DiseaseDataModal({this.id, this.problemName});

  DiseaseDataModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    problemName = json['problemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['problemName'] = this.problemName;
    return data;
  }
}
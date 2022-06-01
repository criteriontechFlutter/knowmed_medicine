class DiseaseDataModal{

  String? id;
  String? problemName;

  DiseaseDataModal({

    this.id,
    this.problemName,

});

  factory DiseaseDataModal.fromJson(Map<String , dynamic >json) =>DiseaseDataModal(
    id: json['id'].toString(),
    problemName: json['problemName'].toString(),

  );
}
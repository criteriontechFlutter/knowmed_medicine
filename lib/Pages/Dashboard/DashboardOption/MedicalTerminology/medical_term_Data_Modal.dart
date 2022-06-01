class MedicalTerminologyDataModal{

  String? RIndex;
  String? id;
  String? treeNo;
  String? descui;
  String? term;
  String? definition;
  String? Total;

  MedicalTerminologyDataModal({

    this.RIndex,
    this.id,
    this.treeNo,
    this.descui,
    this.term,
    this.definition,
    this.Total,

});

  factory MedicalTerminologyDataModal.fromJson(Map<String , dynamic >json) =>MedicalTerminologyDataModal(
    RIndex: json['RIndex'].toString(),
    id: json['id'].toString(),
    treeNo: json['treeNo'].toString(),
    descui: json['descui'].toString(),
    term: json['term'].toString(),
    definition: json['definition'].toString(),
    Total: json['Total'].toString(),

  );
}
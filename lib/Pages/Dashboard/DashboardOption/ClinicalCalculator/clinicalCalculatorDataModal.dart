class ClinicalCalculatorDataModal{

  int? id;
  String? calculatorTitle;
  String? remark;

  ClinicalCalculatorDataModal({

    this.id,
    this.calculatorTitle,
    this.remark
});

  factory ClinicalCalculatorDataModal.fromJson(Map<String , dynamic >json) =>ClinicalCalculatorDataModal(
    id: json['id'],
    calculatorTitle: json['calculatorTitle'].toString(),
    remark: json['remark'].toString(),
  );
}
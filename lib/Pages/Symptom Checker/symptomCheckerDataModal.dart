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



//All symptoms by Alfhabet Data modal



class AllSymptomsByAlphabet {
  int? id;
  String? problemName;
  String? isVisible;

  AllSymptomsByAlphabet({this.id, this.problemName, this.isVisible});

  AllSymptomsByAlphabet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    problemName = json['problemName'];
    isVisible = json['isVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['problemName'] = this.problemName;
    data['isVisible'] = this.isVisible;
    return data;
  }
}
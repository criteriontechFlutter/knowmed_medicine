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




class SymptomRelatedBodyPartDataModal {
  String? id;
  String? problemName;
  String? isVisible;

  SymptomRelatedBodyPartDataModal(
      {this.id, this.problemName, this.isVisible});

  SymptomRelatedBodyPartDataModal.fromJson(Map<String, dynamic> json) {
    id = (json['id']??'').toString();
    problemName = json['problemName'];
    isVisible = json['isVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['problemName'] = problemName;
    data['isVisible'] = isVisible;
    return data;
  }
}


//  Suggested unlocalized problem data modal

class SuggestedUnlocalizedProblemDataModal {
  int? id;
  String? problemName;

  SuggestedUnlocalizedProblemDataModal({this.id, this.problemName});

  SuggestedUnlocalizedProblemDataModal.fromJson(Map<String, dynamic> json) {
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



// Add Any Other Disease you Suffered from DataModal

class AddAnyOtherDiseaseDataModal {
  int? id;
  String? problemName;

  AddAnyOtherDiseaseDataModal({this.id, this.problemName});

  AddAnyOtherDiseaseDataModal.fromJson(Map<String, dynamic> json) {
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
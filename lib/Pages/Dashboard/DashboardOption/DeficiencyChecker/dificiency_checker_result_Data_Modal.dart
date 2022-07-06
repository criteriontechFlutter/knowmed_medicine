
class DificiencyCheckerDataModal {
  List<Deficinecy>? deficinecy;
  List<Toxicity>? toxicity;

  DificiencyCheckerDataModal({this.deficinecy, this.toxicity});

  DificiencyCheckerDataModal.fromJson(Map json) {
    if (json['deficinecy'] != null) {
      deficinecy = <Deficinecy>[];
      json['deficinecy'].forEach((v) {
        deficinecy!.add(new Deficinecy.fromJson(v));
      });
    }
    if (json['toxicity'] != null) {
      toxicity = <Toxicity>[];
      json['toxicity'].forEach((v) {
        toxicity!.add(new Toxicity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deficinecy != null) {
      data['deficinecy'] =
          this.deficinecy!.map((v) => v.toJson()).toList();
    }
    if (this.toxicity != null) {
      data['toxicity'] =
          this.toxicity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Deficinecy {
  String? nutrient;
  String? symptom;

  Deficinecy({this.nutrient, this.symptom});

  Deficinecy.fromJson(Map<String, dynamic> json) {
    nutrient = json['nutrient'];
    symptom = json['symptom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nutrient'] = this.nutrient;
    data['symptom'] = this.symptom;
    return data;
  }
}

class Toxicity {
  String? nutrient;
  String? symptom;

  Toxicity({this.nutrient, this.symptom});

  Toxicity.fromJson(Map<String, dynamic> json) {
    nutrient = json['nutrient'];
    symptom = json['symptom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nutrient'] = this.nutrient;
    data['symptom'] = this.symptom;
    return data;
  }
}
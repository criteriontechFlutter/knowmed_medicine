
class SideEffectDataModal {
  List<EffectedMedicine>? effectedMedicine;
  List<OtherSideEffect>? otherSideEffect;

  SideEffectDataModal({this.effectedMedicine, this.otherSideEffect});

  SideEffectDataModal.fromJson(Map json) {
    if (json['effectedMedicine'] != null) {
      effectedMedicine = <EffectedMedicine>[];
      json['effectedMedicine'].forEach((v) {
        effectedMedicine!.add(new EffectedMedicine.fromJson(v));
      });
    }
    if (json['otherSideEffect'] != null) {
      otherSideEffect = <OtherSideEffect>[];
      json['otherSideEffect'].forEach((v) {
        otherSideEffect!.add(new OtherSideEffect.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.effectedMedicine != null) {
      data['effectedMedicine'] =
          this.effectedMedicine!.map((v) => v.toJson()).toList();
    }
    if (this.otherSideEffect != null) {
      data['otherSideEffect'] =
          this.otherSideEffect!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EffectedMedicine {
  String? problemName;
  String? effectedMedicine;

  EffectedMedicine({this.problemName, this.effectedMedicine});

  EffectedMedicine.fromJson(Map<String, dynamic> json) {
    problemName = json['problemName'];
    effectedMedicine = json['effectedMedicine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['problemName'] = this.problemName;
    data['effectedMedicine'] = this.effectedMedicine;
    return data;
  }
}

class OtherSideEffect {
  String? medicineName;
  String? otherSideEffect;

  OtherSideEffect({this.medicineName, this.otherSideEffect});

  OtherSideEffect.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicineName'];
    otherSideEffect = json['otherSideEffect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicineName'] = this.medicineName;
    data['otherSideEffect'] = this.otherSideEffect;
    return data;
  }
}
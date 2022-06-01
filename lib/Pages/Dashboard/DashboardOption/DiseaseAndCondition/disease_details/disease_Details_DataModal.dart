
class DiseaseDetailsDataModal {
  String? headingId;
  String? heading;
  dynamic body;
  String? reference;
  String? imagePath;

  DiseaseDetailsDataModal({this.headingId, this.heading, this.body, this.reference, this.imagePath});

  DiseaseDetailsDataModal.fromJson(Map<String, dynamic> json) {
    headingId = json['headingId'];
    heading = json['heading'];
    body = json['body'];
    imagePath = json['imagePath'];
    reference = json['reference']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headingId'] = headingId;
    data['heading'] = heading;
    data['body'] = body;
    data['imagePath'] = imagePath;
    data['reference'] = reference;
    return data;
  }
}

// Dosing data Modal

class AdultDoseBody {
  String? doseHeading;
  String? doseSubHeading;
  List<AdultDose>? adultDose;
  List<PediatricDose>? pediatricDose;

  AdultDoseBody(
      {this.doseHeading,
        this.doseSubHeading,
        this.adultDose,
        this.pediatricDose});

  AdultDoseBody.fromJson(Map<String, dynamic> json) {
    doseHeading = json['doseHeading'];
    doseSubHeading = json['doseSubHeading'];
    if (json['adultDose'] != null) {
      adultDose = <AdultDose>[];
      json['adultDose'].forEach((v) {
        adultDose!.add(new AdultDose.fromJson(v));
      });
    }

    if (json['pediatricDose'] != null) {
      pediatricDose = <PediatricDose>[];
      json['pediatricDose'].forEach((v) {
        pediatricDose!.add(PediatricDose.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doseHeading'] = this.doseHeading;
    data['doseSubHeading'] = this.doseSubHeading;
    if (this.adultDose != null) {
      data['adultDose'] = this.adultDose!.map((v) => v.toJson()).toList();
    }
    if (this.pediatricDose != null) {
      data['pediatricDose'] =
          this.pediatricDose!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}




class PediatricDose {
  String? ailment;
  String? route;
  String? dose;
  String? formName;
  String? age;
  String? weight;

  PediatricDose(
      {this.ailment,
        this.route,
        this.dose,
        this.formName,
        this.age,
        this.weight});

  PediatricDose.fromJson(Map json) {
    ailment = json['ailment'];
    route = json['route'];
    dose = json['dose'];
    formName = json['formName'];
    age = json['age'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ailment'] = this.ailment;
    data['route'] = this.route;
    data['dose'] = this.dose;
    data['formName'] = this.formName;
    data['age'] = this.age;
    data['weight'] = this.weight;
    return data;
  }
}

class AdultDose {
  String? ailment;
  String? route;
  String? dose;
  String? formName;
  String? age;
  String? weight;

  AdultDose(
      {this.ailment,
        this.route,
        this.dose,
        this.formName,
        this.age,
        this.weight});

  AdultDose.fromJson(Map<String, dynamic> json) {
    ailment = json['ailment'];
    route = json['route'];
    dose = json['dose'];
    formName = json['formName'];
    age = json['age'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ailment'] = this.ailment;
    data['route'] = this.route;
    data['dose'] = this.dose;
    data['formName'] = this.formName;
    data['age'] = this.age;
    data['weight'] = this.weight;
    return data;
  }
}


// Side Effect Data Modal


// class SideEffectBody {
//   String? sideEffects;
//   int? sideEffectTypeId;
//   String? sideEffectType;
//   String? sideEffectColor;
//   String? isWatchable;
//   String? isLifeThreatening;
//
//   SideEffectBody(
//       {this.sideEffects,
//         this.sideEffectTypeId,
//         this.sideEffectType,
//         this.sideEffectColor,
//         this.isWatchable,
//         this.isLifeThreatening});
//
//   SideEffectBody.fromJson(Map<String, dynamic> json) {
//     sideEffects = json['sideEffects'];
//     sideEffectTypeId = json['sideEffectTypeId'];
//     sideEffectType = json['sideEffectType'];
//     sideEffectColor = json['sideEffectColor'];
//     isWatchable = json['isWatchable'];
//     isLifeThreatening = json['isLifeThreatening'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sideEffects'] = this.sideEffects;
//     data['sideEffectTypeId'] = this.sideEffectTypeId;
//     data['sideEffectType'] = this.sideEffectType;
//     data['sideEffectColor'] = this.sideEffectColor;
//     data['isWatchable'] = this.isWatchable;
//     data['isLifeThreatening'] = this.isLifeThreatening;
//     return data;
//   }
// }




//Intraction Data Modal



class IntractionDataModal {
  List<InteractionWithMedicine>? interactionWithMedicine;
  List<InteractionWithMedicineGroup>? interactionWithMedicineGroup;
  List<InteractionWithNurient>? interactionWithNurient;
  List? interactionWithAddiquate;
  List? interactionWithProblem;

  IntractionDataModal(
      {this.interactionWithMedicine,
        this.interactionWithMedicineGroup,
        this.interactionWithNurient,
        this.interactionWithAddiquate,
        this.interactionWithProblem});

  IntractionDataModal.fromJson(Map<String, dynamic> json) {
    if (json['interactionWithMedicine'] != null) {
      interactionWithMedicine = <InteractionWithMedicine>[];
      json['interactionWithMedicine'].forEach((v) {
        interactionWithMedicine!.add(new InteractionWithMedicine.fromJson(v));
      });
    }
    if (json['interactionWithMedicineGroup'] != null) {
      interactionWithMedicineGroup = <InteractionWithMedicineGroup>[];
      json['interactionWithMedicineGroup'].forEach((v) {
        interactionWithMedicineGroup!
            .add(new InteractionWithMedicineGroup.fromJson(v));
      });
    }
    if (json['interactionWithNurient'] != null) {
      interactionWithNurient = <InteractionWithNurient>[];
      json['interactionWithNurient'].forEach((v) {
        interactionWithNurient!.add(new InteractionWithNurient.fromJson(v));
      });
    }
    if (json['interactionWithAddiquate'] != null) {
      interactionWithAddiquate = <Null>[];
      json['interactionWithAddiquate'].forEach((v) {
        interactionWithAddiquate!.add(v);
      });
    }
    if (json['interactionWithProblem'] != null) {
      interactionWithProblem = <Null>[];
      json['interactionWithProblem'].forEach((v) {
        interactionWithProblem!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interactionWithMedicine != null) {
      data['interactionWithMedicine'] =
          this.interactionWithMedicine!.map((v) => v.toJson()).toList();
    }
    if (this.interactionWithMedicineGroup != null) {
      data['interactionWithMedicineGroup'] =
          this.interactionWithMedicineGroup!.map((v) => v.toJson()).toList();
    }
    if (this.interactionWithNurient != null) {
      data['interactionWithNurient'] =
          this.interactionWithNurient!.map((v) => v.toJson()).toList();
    }
    if (this.interactionWithAddiquate != null) {
      data['interactionWithAddiquate'] =
          this.interactionWithAddiquate!.map((v) => v.toJson()).toList();
    }
    if (this.interactionWithProblem != null) {
      data['interactionWithProblem'] =
          this.interactionWithProblem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InteractionWithMedicine {
  String? interactionWithMedicine;
  String? isLifeThreatning;
  String? interactionNature;
  String? interactionEffect;
  String? suggestiveAction;
  String? doseModification;
  int? decreasedFrom;
  int? decreasedTo;

  InteractionWithMedicine(
      {this.interactionWithMedicine,
        this.isLifeThreatning,
        this.interactionNature,
        this.interactionEffect,
        this.suggestiveAction,
        this.doseModification,
        this.decreasedFrom,
        this.decreasedTo});

  InteractionWithMedicine.fromJson(Map<String, dynamic> json) {
    interactionWithMedicine = json['interactionWithMedicine'];
    isLifeThreatning = json['isLifeThreatning'];
    interactionNature = json['interactionNature'];
    interactionEffect = json['interactionEffect'];
    suggestiveAction = json['suggestiveAction'];
    doseModification = json['doseModification'];
    decreasedFrom = json['decreasedFrom'];
    decreasedTo = json['decreasedTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['interactionWithMedicine'] = this.interactionWithMedicine;
    data['isLifeThreatning'] = this.isLifeThreatning;
    data['interactionNature'] = this.interactionNature;
    data['interactionEffect'] = this.interactionEffect;
    data['suggestiveAction'] = this.suggestiveAction;
    data['doseModification'] = this.doseModification;
    data['decreasedFrom'] = this.decreasedFrom;
    data['decreasedTo'] = this.decreasedTo;
    return data;
  }
}

class InteractionWithMedicineGroup {
  String? interactionWithMedicineGroup;
  String? isLifeThreatning;
  String? interactionNature;
  String? interactionEffect;
  String? suggestiveAction;
  String? doseModification;
  int? decreasedFrom;
  int? decreasedTo;

  InteractionWithMedicineGroup(
      {this.interactionWithMedicineGroup,
        this.isLifeThreatning,
        this.interactionNature,
        this.interactionEffect,
        this.suggestiveAction,
        this.doseModification,
        this.decreasedFrom,
        this.decreasedTo});

  InteractionWithMedicineGroup.fromJson(Map<String, dynamic> json) {
    interactionWithMedicineGroup = json['interactionWithMedicineGroup'];
    isLifeThreatning = json['isLifeThreatning'];
    interactionNature = json['interactionNature'];
    interactionEffect = json['interactionEffect'];
    suggestiveAction = json['suggestiveAction'];
    doseModification = json['doseModification'];
    decreasedFrom = json['decreasedFrom'];
    decreasedTo = json['decreasedTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['interactionWithMedicineGroup'] = this.interactionWithMedicineGroup;
    data['isLifeThreatning'] = this.isLifeThreatning;
    data['interactionNature'] = this.interactionNature;
    data['interactionEffect'] = this.interactionEffect;
    data['suggestiveAction'] = this.suggestiveAction;
    data['doseModification'] = this.doseModification;
    data['decreasedFrom'] = this.decreasedFrom;
    data['decreasedTo'] = this.decreasedTo;
    return data;
  }
}

class InteractionWithNurient {
  String? interactionWithNutrient;
  String? isLifeThreatning;
  String? interactionNature;
  String? interactionEffect;
  String? suggestiveAction;
  String? doseModification;
  int? decreasedFrom;
  int? decreasedTo;

  InteractionWithNurient(
      {this.interactionWithNutrient,
        this.isLifeThreatning,
        this.interactionNature,
        this.interactionEffect,
        this.suggestiveAction,
        this.doseModification,
        this.decreasedFrom,
        this.decreasedTo});

  InteractionWithNurient.fromJson(Map<String, dynamic> json) {
    interactionWithNutrient = json['interactionWithNutrient'];
    isLifeThreatning = json['isLifeThreatning'];
    interactionNature = json['interactionNature'];
    interactionEffect = json['interactionEffect'];
    suggestiveAction = json['suggestiveAction'];
    doseModification = json['doseModification'];
    decreasedFrom = json['decreasedFrom'];
    decreasedTo = json['decreasedTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['interactionWithNutrient'] = this.interactionWithNutrient;
    data['isLifeThreatning'] = this.isLifeThreatning;
    data['interactionNature'] = this.interactionNature;
    data['interactionEffect'] = this.interactionEffect;
    data['suggestiveAction'] = this.suggestiveAction;
    data['doseModification'] = this.doseModification;
    data['decreasedFrom'] = this.decreasedFrom;
    data['decreasedTo'] = this.decreasedTo;
    return data;
  }
}




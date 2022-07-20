


class ClinicalFeaturesDataModal {
  String? departmentId;
  String? departmentName;
  String? inputType;
  List<Concern>? concern;

  ClinicalFeaturesDataModal(
      {this.departmentId, this.departmentName, this.inputType, this.concern});

  ClinicalFeaturesDataModal.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    inputType = json['inputType'];
    if (json['concern'] != null) {
      concern = <Concern>[];
      json['concern'].forEach((v) {
        concern!.add(new Concern.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    data['inputType'] = this.inputType;
    if (this.concern != null) {
      data['concern'] = this.concern!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Concern {
  String? stageId;
  String? stage;
  List<Data>? data;

  Concern({this.stageId, this.stage, this.data});

  Concern.fromJson(Map<String, dynamic> json) {
    stageId = json['stageId'];
    stage = json['stage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageId'] = this.stageId;
    data['stage'] = this.stage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? problemName;

  Data({this.problemName});

  Data.fromJson(Map<String, dynamic> json) {
    problemName = json['problemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['problemName'] = this.problemName;
    return data;
  }
}



//Diagnostics  Data  Modal




class DiagnosticsDataModal {
  String? departmentId;
  String? departmentName;
  String? type;
  List<Investigation>? investigation;

  DiagnosticsDataModal(
      {this.departmentId, this.departmentName, this.type, this.investigation});

  DiagnosticsDataModal.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    type = json['type'];
    if (json['investigation'] != null) {
      investigation = <Investigation>[];
      json['investigation'].forEach((v) {
        investigation!.add(new Investigation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    data['type'] = this.type;
    if (this.investigation != null) {
      data['investigation'] =
          this.investigation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Investigation {
  String? stageId;
  String? stage;
  List<DiagnosticsData>? data;

  Investigation({this.stageId, this.stage, this.data});

  Investigation.fromJson(Map<String, dynamic> json) {
    stageId = json['stageId'];
    stage = json['stage'];
    if (json['data'] != null) {
      data = <DiagnosticsData>[];
      json['data'].forEach((v) {
        data!.add(new DiagnosticsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageId'] = this.stageId;
    data['stage'] = this.stage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DiagnosticsData {
  String? testName;
  String? subTestName;
  String? propertyName;
  String? propertyValue;
  String? remarkValue;

  DiagnosticsData(
      {this.testName,
        this.subTestName,
        this.propertyName,
        this.propertyValue,
        this.remarkValue});

  DiagnosticsData.fromJson(Map<String, dynamic> json) {
    testName = json['testName'];
    subTestName = json['subTestName'];
    propertyName = json['propertyName'];
    propertyValue = json['propertyValue'];
    remarkValue = json['remarkValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['testName'] = this.testName;
    data['subTestName'] = this.subTestName;
    data['propertyName'] = this.propertyName;
    data['propertyValue'] = this.propertyValue;
    data['remarkValue'] = this.remarkValue;
    return data;
  }
}




// Treatment Data Modal



class TreatmentDataModal {
  String? subHeading;
  List<TreatmentData>? data;

  TreatmentDataModal({this.subHeading, this.data});

  TreatmentDataModal.fromJson(Map<String, dynamic> json) {
    subHeading = json['subHeading'];
    if (json['data'] != null) {
      data = <TreatmentData>[];
      json['data'].forEach((v) {
        data!.add(new TreatmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subHeading'] = this.subHeading;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TreatmentData {
  String? departmentId;
  String? departmentName;
  List<TreatmentType>? treatmentType;

  TreatmentData({this.departmentId, this.departmentName, this.treatmentType});

  TreatmentData.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['treatmentType'] != null) {
      treatmentType = <TreatmentType>[];
      json['treatmentType'].forEach((v) {
        treatmentType!.add(new TreatmentType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.treatmentType != null) {
      data['treatmentType'] =
          this.treatmentType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TreatmentType {
  String? treatmentType;

  TreatmentType({this.treatmentType});

  TreatmentType.fromJson(Map<String, dynamic> json) {
    treatmentType = json['treatmentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['treatmentType'] = this.treatmentType;
    return data;
  }
}



//  Concerns Data Modal


class ConcernsDataModal {
  String? subHeading;
  List<ConcernsData>? data;

  ConcernsDataModal({this.subHeading, this.data});

  ConcernsDataModal.fromJson(Map<String, dynamic> json) {
    subHeading = json['subHeading'];
    if (json['data'] != null) {
      data = <ConcernsData>[];
      json['data'].forEach((v) {
        data!.add(new ConcernsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subHeading'] = this.subHeading;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConcernsData {
  String? departmentId;
  String? departmentName;
  List<PrecautionType>? precautionType;

  ConcernsData({this.departmentId, this.departmentName, this.precautionType});

  ConcernsData.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['precautionType'] != null) {
      precautionType = <PrecautionType>[];
      json['precautionType'].forEach((v) {
        precautionType!.add(new PrecautionType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.precautionType != null) {
      data['precautionType'] =
          this.precautionType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrecautionType {
  String? concernType;

  PrecautionType({this.concernType});

  PrecautionType.fromJson(Map<String, dynamic> json) {
    concernType = json['concernType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['concernType'] = this.concernType;
    return data;
  }
}




//  Diet Data Modal


class DietDataModal {
  String? departmentId;
  String? departmentName;
  List<ProvisionalDiet>? provisionalDiet;

  DietDataModal({this.departmentId, this.departmentName, this.provisionalDiet});

  DietDataModal.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['provisionalDiet'] != null) {
      provisionalDiet = <ProvisionalDiet>[];
      json['provisionalDiet'].forEach((v) {
        provisionalDiet!.add(new ProvisionalDiet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.provisionalDiet != null) {
      data['provisionalDiet'] =
          this.provisionalDiet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProvisionalDiet {
  String? provisionalDiet;

  ProvisionalDiet({this.provisionalDiet});

  ProvisionalDiet.fromJson(Map<String, dynamic> json) {
    provisionalDiet = json['provisionalDiet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provisionalDiet'] = this.provisionalDiet;
    return data;
  }
}



//Related Disease Data Modal


class RelatedDiseaseDataModal {
  String? departmentId;
  String? departmentName;
  List<DifferentialDiagnosis>? differentialDiagnosis;

  RelatedDiseaseDataModal(
      {this.departmentId, this.departmentName, this.differentialDiagnosis});

  RelatedDiseaseDataModal.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['differentialDiagnosis'] != null) {
      differentialDiagnosis = <DifferentialDiagnosis>[];
      json['differentialDiagnosis'].forEach((v) {
        differentialDiagnosis!.add(new DifferentialDiagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.differentialDiagnosis != null) {
      data['differentialDiagnosis'] =
          this.differentialDiagnosis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DifferentialDiagnosis {
  String? differentialDiagnosis;

  DifferentialDiagnosis({this.differentialDiagnosis});

  DifferentialDiagnosis.fromJson(Map<String, dynamic> json) {
    differentialDiagnosis = json['differentialDiagnosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['differentialDiagnosis'] = this.differentialDiagnosis;
    return data;
  }
}


// Pathophysiology Data Modal


class PathophysiologyDataModal {
  String? departmentId;
  String? departmentName;
  List<Pathophysiology>? pathophysiology;

  PathophysiologyDataModal(
      {this.departmentId, this.departmentName, this.pathophysiology});

  PathophysiologyDataModal.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['pathophysiology'] != null) {
      pathophysiology = <Pathophysiology>[];
      json['pathophysiology'].forEach((v) {
        pathophysiology!.add(new Pathophysiology.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.pathophysiology != null) {
      data['pathophysiology'] =
          this.pathophysiology!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pathophysiology {
  String? pathophysiology;
  String? pathophysiologyAttachment;

  Pathophysiology({this.pathophysiology, this.pathophysiologyAttachment});

  Pathophysiology.fromJson(Map<String, dynamic> json) {
    pathophysiology = json['pathophysiology'];
    pathophysiologyAttachment = json['pathophysiologyAttachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pathophysiology'] = this.pathophysiology;
    data['pathophysiologyAttachment'] = this.pathophysiologyAttachment;
    return data;
  }
}




// Epidemiology Data Modal


class EpidemiologyDataModal {
  String? subHeading;
  List<EpidemiologyData>? data;

  EpidemiologyDataModal({this.subHeading, this.data});

  EpidemiologyDataModal.fromJson(Map<String, dynamic> json) {
    subHeading = json['subHeading'];
    if (json['data'] != null) {
      data = <EpidemiologyData>[];
      json['data'].forEach((v) {
        data!.add(new EpidemiologyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subHeading'] = this.subHeading;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EpidemiologyData {
  String? departmentId;
  String? departmentName;
  List<Prognosis>? prognosis;

  EpidemiologyData({this.departmentId, this.departmentName, this.prognosis});

  EpidemiologyData.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['prognosis'] != null) {
      prognosis = <Prognosis>[];
      json['prognosis'].forEach((v) {
        prognosis!.add(new Prognosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.prognosis != null) {
      data['prognosis'] = this.prognosis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prognosis {
  String? prognosis;

  Prognosis({this.prognosis});

  Prognosis.fromJson(Map<String, dynamic> json) {
    prognosis = json['prognosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prognosis'] = this.prognosis;
    return data;
  }
}












class DiseaseDetailsDataModal {
  String? headingId;
  String? heading;
  dynamic body;
  String? reference;
  String? imagePath;
  List<SubOverview>? subOverview;

  DiseaseDetailsDataModal(
      {this.headingId,
        this.heading,
        this.body,
        this.imagePath,
        this.subOverview});

  DiseaseDetailsDataModal.fromJson(Map<String, dynamic> json) {
    headingId = json['headingId'];
    heading = json['heading'];
    body = json['body'];
    imagePath = json['imagePath'];
    if (json['subOverview'] != null) {
      subOverview = <SubOverview>[];
      json['subOverview'].forEach((v) {
        subOverview!.add(new SubOverview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headingId'] = this.headingId;
    data['heading'] = this.heading;
    data['body'] = this.body;
    data['imagePath'] = this.imagePath;
    if (this.subOverview != null) {
      data['subOverview'] = this.subOverview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




class SubOverview {
  int? departmentId;
  String? departmentName;
  List<SubOverviewData>? subOverview;

  SubOverview({this.departmentId, this.departmentName, this.subOverview});

  SubOverview.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    if (json['subOverview'] != null) {
      subOverview = <SubOverviewData>[];
      json['subOverview'].forEach((v) {
        subOverview!.add(new SubOverviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    if (this.subOverview != null) {
      data['subOverview'] = this.subOverview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubOverviewData {
  String? subOverview;

  SubOverviewData({this.subOverview});

  SubOverviewData.fromJson(Map<String, dynamic> json) {
    subOverview = json['subOverview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subOverview'] = this.subOverview;
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




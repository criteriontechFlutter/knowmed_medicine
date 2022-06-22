class Autogenerated {
  String? formula;
  List<Data>? data;

  Autogenerated({this.formula, this.data});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    formula = json['formula'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['formula'] = this.formula;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? parameterID;
  String? parameterName;
  String? controlType;
  String? labelDisplay;
  String? referenceID;
  bool? isScore;
  String? parameterValue;
  String? parameterScore;
  String? parameterValueList;
  String? scoreList;

  Data(
      {this.parameterID,
        this.parameterName,
        this.controlType,
        this.labelDisplay,
        this.referenceID,
        this.isScore,
        this.parameterValue,
        this.parameterScore,
        this.parameterValueList,
        this.scoreList});

  Data.fromJson(Map<String, dynamic> json) {
    parameterID = json['parameterID'];
    parameterName = json['parameterName'];
    controlType = json['controlType'];
    labelDisplay = json['labelDisplay'];
    referenceID = json['referenceID'];
    isScore = json['isScore'];
    parameterValue = json['parameterValue'];
    parameterScore = json['parameterScore'];
    parameterValueList = json['parameterValueList'];
    scoreList = json['scoreList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parameterID'] = this.parameterID;
    data['parameterName'] = this.parameterName;
    data['controlType'] = this.controlType;
    data['labelDisplay'] = this.labelDisplay;
    data['referenceID'] = this.referenceID;
    data['isScore'] = this.isScore;
    data['parameterValue'] = this.parameterValue;
    data['parameterScore'] = this.parameterScore;
    data['parameterValueList'] = this.parameterValueList;
    data['scoreList'] = this.scoreList;
    return data;
  }
}
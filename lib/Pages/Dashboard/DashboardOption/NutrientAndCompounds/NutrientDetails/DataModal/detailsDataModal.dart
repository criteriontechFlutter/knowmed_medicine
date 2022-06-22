class NutrientDetailsDataModal {
  String? headingId;
  String? heading;
  dynamic body;
  String? imagePath;
  String? subHeading;

  NutrientDetailsDataModal(
      {this.headingId, this.heading, this.body, this.imagePath,this.subHeading});

  NutrientDetailsDataModal.fromJson(Map<String, dynamic> json) {
    headingId = json['headingId'];
    heading = json['heading'];
    body = json['body'];
    imagePath = json['imagePath'];
    subHeading = json['subHeading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headingId'] =headingId;
    data['heading'] = heading;
    data['body'] = body;
    data['imagePath'] = imagePath;
    data['subHeading'] = subHeading;
    return data;
  }
}

//RDA Data Modal


class RdaDataModal {
  String? clinicalFeatures;
  List<Rda>? rda;

  RdaDataModal({this.clinicalFeatures, this.rda});

  RdaDataModal.fromJson(Map<String, dynamic> json) {
    clinicalFeatures = json['clinicalFeatures'];
    if (json['rda'] != null) {
      rda = <Rda>[];
      json['rda'].forEach((v) {
        rda!.add(new Rda.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicalFeatures'] = this.clinicalFeatures;
    if (this.rda != null) {
      data['rda'] = this.rda!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rda {
  String? nutrientName;
  String? ageGroup;
  String? activity;
  String? age;
  String? gender;
  String? rda;
  String? toxicityLevel;
  String? deficiencyLevel;

  Rda(
      {this.nutrientName,
        this.ageGroup,
        this.activity,
        this.age,
        this.gender,
        this.rda,
        this.toxicityLevel,
        this.deficiencyLevel});

  Rda.fromJson(Map<String, dynamic> json) {
    nutrientName = json['nutrientName'];
    ageGroup = json['ageGroup'];
    activity = json['activity'];
    age = json['age'];
    gender = json['gender'];
    rda = json['rda'];
    toxicityLevel = json['toxicityLevel'];
    deficiencyLevel = json['deficiencyLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nutrientName'] = this.nutrientName;
    data['ageGroup'] = this.ageGroup;
    data['activity'] = this.activity;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['rda'] = this.rda;
    data['toxicityLevel'] = this.toxicityLevel;
    data['deficiencyLevel'] = this.deficiencyLevel;
    return data;
  }
}


// Intraction data Modal

class InteractionsDataModal {
  List<WithFood>? withFood;
  List<WithMedicine>? withMedicine;
  List<WithNutrient>? withNutrient;

  InteractionsDataModal({this.withFood, this.withMedicine, this.withNutrient});

  InteractionsDataModal.fromJson(Map<String, dynamic> json) {
    if (json['withFood'] != null) {
      withFood = <WithFood>[];
      json['withFood'].forEach((v) {
        withFood!.add(new WithFood.fromJson(v));
      });
    }
    if (json['withMedicine'] != null) {
      withMedicine = <WithMedicine>[];
      json['withMedicine'].forEach((v) {
        withMedicine!.add(new WithMedicine.fromJson(v));
      });
    }
    if (json['withNutrient'] != null) {
      withNutrient = <WithNutrient>[];
      json['withNutrient'].forEach((v) {
        withNutrient!.add(new WithNutrient.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.withFood != null) {
      data['withFood'] = this.withFood!.map((v) => v.toJson()).toList();
    }
    if (this.withMedicine != null) {
      data['withMedicine'] = this.withMedicine!.map((v) => v.toJson()).toList();
    }
    if (this.withNutrient != null) {
      data['withNutrient'] = this.withNutrient!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WithFood {
  String? name;
  String? interactionEffect;

  WithFood({this.name, this.interactionEffect});

  WithFood.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    interactionEffect = json['interactionEffect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['interactionEffect'] = this.interactionEffect;
    return data;
  }
}

class WithMedicine {
  String? name;
  String? interactionEffect;

  WithMedicine({this.name, this.interactionEffect});

  WithMedicine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    interactionEffect = json['interactionEffect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['interactionEffect'] = this.interactionEffect;
    return data;
  }
}


class WithNutrient {
  String? name;
  String? interactionEffect;

  WithNutrient({this.name, this.interactionEffect});

  WithNutrient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    interactionEffect = json['interactionEffect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['interactionEffect'] = this.interactionEffect;
    return data;
  }
}
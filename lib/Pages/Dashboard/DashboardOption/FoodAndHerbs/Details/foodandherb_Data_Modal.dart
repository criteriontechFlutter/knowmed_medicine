
class FoodAndHerbDetailsDataModal {
  List<WeightList>? weightList;
  List<NutrientPercentageDetails>? nutrientPercentageDetails;
  List<TopNutrients>? topNutrients;
  List<NutrientCategoryDetails>? nutrientCategoryDetails;

  FoodAndHerbDetailsDataModal(
      {this.weightList,
        this.nutrientPercentageDetails,
        this.topNutrients,
        this.nutrientCategoryDetails});

  FoodAndHerbDetailsDataModal.fromJson(Map<String, dynamic> json) {
    if (json['weightList'] != null) {
      weightList = <WeightList>[];
      json['weightList'].forEach((v) {
        weightList!.add(new WeightList.fromJson(v));
      });
    }
    if (json['nutrientPercentageDetails'] != null) {
      nutrientPercentageDetails = <NutrientPercentageDetails>[];
      json['nutrientPercentageDetails'].forEach((v) {
        nutrientPercentageDetails!
            .add(new NutrientPercentageDetails.fromJson(v));
      });
    }
    if (json['topNutrients'] != null) {
      topNutrients = <TopNutrients>[];
      json['topNutrients'].forEach((v) {
        topNutrients!.add(new TopNutrients.fromJson(v));
      });
    }
    if (json['nutrientCategoryDetails'] != null) {
      nutrientCategoryDetails = <NutrientCategoryDetails>[];
      json['nutrientCategoryDetails'].forEach((v) {
        nutrientCategoryDetails!.add(new NutrientCategoryDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weightList != null) {
      data['weightList'] = this.weightList!.map((v) => v.toJson()).toList();
    }
    if (this.nutrientPercentageDetails != null) {
      data['nutrientPercentageDetails'] =
          this.nutrientPercentageDetails!.map((v) => v.toJson()).toList();
    }
    if (this.topNutrients != null) {
      data['topNutrients'] = this.topNutrients!.map((v) => v.toJson()).toList();
    }
    if (this.nutrientCategoryDetails != null) {
      data['nutrientCategoryDetails'] =
          this.nutrientCategoryDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeightList {
  int? id;
  String? name;

  WeightList({this.id, this.name});

  WeightList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class NutrientPercentageDetails {
  int? id;
  String? foodName;
  double? calories;
  double? caloriesInPercentage;
  double? fatInPercentage;
  double? carbsInPercentage;
  double? proteinInPercentage;
  double? fatValue;
  double? carbsValue;
  double? proteinValue;
  String? foodCategory;

  NutrientPercentageDetails(
      {this.id,
        this.foodName,
        this.calories,
        this.caloriesInPercentage,
        this.fatInPercentage,
        this.carbsInPercentage,
        this.proteinInPercentage,
        this.fatValue,
        this.carbsValue,
        this.proteinValue,
        this.foodCategory});

  NutrientPercentageDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodName = json['foodName'];
    calories = json['calories'];
    caloriesInPercentage = json['caloriesInPercentage'];
    fatInPercentage = json['fatInPercentage'];
    carbsInPercentage = json['carbsInPercentage'];
    proteinInPercentage = json['proteinInPercentage'];
    fatValue = json['fatValue'];
    carbsValue = json['carbsValue'];
    proteinValue = json['proteinValue'];
    foodCategory = json['foodCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodName'] = this.foodName;
    data['calories'] = this.calories;
    data['caloriesInPercentage'] = this.caloriesInPercentage;
    data['fatInPercentage'] = this.fatInPercentage;
    data['carbsInPercentage'] = this.carbsInPercentage;
    data['proteinInPercentage'] = this.proteinInPercentage;
    data['fatValue'] = this.fatValue;
    data['carbsValue'] = this.carbsValue;
    data['proteinValue'] = this.proteinValue;
    data['foodCategory'] = this.foodCategory;
    return data;
  }
}

class TopNutrients {
  String? nutrientName;
  double? nutrientPercentage;

  TopNutrients({this.nutrientName, this.nutrientPercentage});

  TopNutrients.fromJson(Map<String, dynamic> json) {
    nutrientName = json['nutrientName'];
    nutrientPercentage = json['nutrientPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nutrientName'] = this.nutrientName;
    data['nutrientPercentage'] = this.nutrientPercentage;
    return data;
  }
}

class NutrientCategoryDetails {
  int? nutrientCategoryId;
  String? nutrientCategory;
  List<CategoryDetails>? categoryDetails;

  NutrientCategoryDetails(
      {this.nutrientCategoryId, this.nutrientCategory, this.categoryDetails});

  NutrientCategoryDetails.fromJson(Map<String, dynamic> json) {
    nutrientCategoryId = json['nutrientCategoryId'];
    nutrientCategory = json['nutrientCategory'];
    if (json['categoryDetails'] != null) {
      categoryDetails = <CategoryDetails>[];
      json['categoryDetails'].forEach((v) {
        categoryDetails!.add(new CategoryDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nutrientCategoryId'] = this.nutrientCategoryId;
    data['nutrientCategory'] = this.nutrientCategory;
    if (this.categoryDetails != null) {
      data['categoryDetails'] =
          this.categoryDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryDetails {
  String? nutrientName;
  String? amount;
  String? dailyValue;
  String? nutrientCategoryId;

  CategoryDetails(
      {this.nutrientName,
        this.amount,
        this.dailyValue,
        this.nutrientCategoryId});

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    nutrientName = json['nutrientName'];
    amount = json['amount'];
    dailyValue = json['dailyValue'];
    nutrientCategoryId = json['nutrientCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nutrientName'] = this.nutrientName;
    data['amount'] = this.amount;
    data['dailyValue'] = this.dailyValue;
    data['nutrientCategoryId'] = this.nutrientCategoryId;
    return data;
  }
}




class DropDownDetailsDataModal {
  int? rIndex;
  int? foodId;
  String? foodName;
  int? nutrientValue;
  String? groupName;
  String? unit;
  int? total;

  DropDownDetailsDataModal(
      {
        this.rIndex,
        this.foodId,
        this.foodName,
        this.nutrientValue,
        this.groupName,
        this.unit,
        this.total
      });

  DropDownDetailsDataModal.fromJson(Map<String, dynamic> json) {
    rIndex = json['rIndex'];
    foodId = json['foodId'];
    foodName = json['foodName'];
    nutrientValue = json['nutrientValue'];
    groupName = json['groupName'];
    unit = json['unit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rIndex'] = this.rIndex;
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    data['nutrientValue'] = this.nutrientValue;
    data['groupName'] = this.groupName;
    data['unit'] = this.unit;
    data['total'] = this.total;
    return data;
  }
}
// class NutrientDataModal{
//
//   String? id;
//   String? nutrientName;
//   String? nutrientCategoryId;
//
//   NutrientDataModal({
//
//     this.id,
//     this.nutrientName,
//     this.nutrientCategoryId
// });
//
//   factory NutrientDataModal.fromJson(Map<String , dynamic >json) =>NutrientDataModal(
//     id: json['id'].toString(),
//     nutrientName: json['nutrientName'].toString(),
//     nutrientCategoryId: json['nutrientCategoryId'].toString(),
//   );
// }

class NutrientDataModal {
  int? id;
  String? nutrientName;
  int? nutrientCategoryId;

  NutrientDataModal({this.id, this.nutrientName, this.nutrientCategoryId});

  NutrientDataModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nutrientName = json['nutrientName'];
    nutrientCategoryId = json['nutrientCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nutrientName'] = this.nutrientName;
    data['nutrientCategoryId'] = this.nutrientCategoryId;
    return data;
  }
}
class NutrientDataModal{

  String? id;
  String? nutrientName;
  String? nutrientCategoryId;

  NutrientDataModal({

    this.id,
    this.nutrientName,
    this.nutrientCategoryId
});

  factory NutrientDataModal.fromJson(Map<String , dynamic >json) =>NutrientDataModal(
    id: json['id'].toString(),
    nutrientName: json['nutrientName'].toString(),
    nutrientCategoryId: json['nutrientCategoryId'].toString(),
  );
}
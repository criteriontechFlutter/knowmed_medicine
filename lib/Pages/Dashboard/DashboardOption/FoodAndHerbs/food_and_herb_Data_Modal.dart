class FoodAndHerbDataModal{

  String? id;
  String? foodName;
  String? groupname;

  FoodAndHerbDataModal({

    this.id,
    this.foodName,
    this.groupname
});

  factory FoodAndHerbDataModal.fromJson(Map<String , dynamic >json) =>FoodAndHerbDataModal(
    id: json['id'].toString(),
    foodName: json['foodName'].toString(),
    groupname: json['groupname'].toString(),
  );
}
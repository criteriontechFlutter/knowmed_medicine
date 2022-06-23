// class FoodAndHerbDataModal{
//
//   String? id;
//   String? foodName;
//   String? groupname;
//
//   FoodAndHerbDataModal({
//
//     this.id,
//     this.foodName,
//     this.groupname
// });
//
//   factory FoodAndHerbDataModal.fromJson(Map<String , dynamic >json) =>FoodAndHerbDataModal(
//     id: json['id'].toString(),
//     foodName: json['foodName'].toString(),
//     groupname: json['groupname'].toString(),
//   );
// }

class FoodAndHerbDataModal {
  int? id;
  String? foodName;
  String? groupname;

  FoodAndHerbDataModal({this.id, this.foodName, this.groupname});

  FoodAndHerbDataModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodName = json['foodName'];
    groupname = json['groupname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodName'] = this.foodName;
    data['groupname'] = this.groupname;
    return data;
  }
}
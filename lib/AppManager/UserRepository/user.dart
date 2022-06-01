


class User {
  int? id;
  String? firstName;
  String? lastName;
  String? emailId;
  String? mobileNo;
  String? country;
  String? zipCode;
  int? occupationId;
  String? age;
  String? gender;
  String? heightInFeet;
  String? heightInInch;
  String? weight;
  String? packageName;
  String? token;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.emailId,
        this.mobileNo,
        this.country,
        this.zipCode,
        this.occupationId,
        this.age,
        this.gender,
        this.heightInFeet,
        this.heightInInch,
        this.weight,
        this.packageName,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    mobileNo = json['mobileNo'];
    country = json['country'].toString();
    zipCode = json['zipCode'];
    occupationId = json['occupationId'];
    age = json['age'].toString();
    gender = json['gender'].toString();
    heightInFeet = json['heightInFeet'].toString();
    heightInInch = json['heightInInch'].toString();
    weight = json['weight'].toString();
    packageName = json['packageName'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailId'] = this.emailId;
    data['mobileNo'] = this.mobileNo;
    data['country'] = this.country;
    data['zipCode'] = this.zipCode;
    data['occupationId'] = this.occupationId;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['heightInFeet'] = this.heightInFeet;
    data['heightInInch'] = this.heightInInch;
    data['weight'] = this.weight;
    data['packageName'] = this.packageName;
    data['token'] = this.token;
    return data;
  }
}
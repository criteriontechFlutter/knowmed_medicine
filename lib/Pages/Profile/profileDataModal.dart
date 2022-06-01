class ProfileDataModal{

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
  int? weight;
  String? packageName;
  int? countryId;
  int? stateId;
  int? cityId;
  int? occupationId1;
  int? profilePath;

  ProfileDataModal({

    this.id,
    this.firstName,
    this.lastName,
    this.emailId,
    this.mobileNo,

});

  factory ProfileDataModal .fromJson(Map<String, dynamic > json) => ProfileDataModal(
  id:json['id'],
    firstName:json['firstName'],
    lastName:json['lastName'],
    emailId:json['emailId'],
    mobileNo:json['mobileNo'],
  );
}
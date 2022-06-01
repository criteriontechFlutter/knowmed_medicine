import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Profile/profileDataModal.dart';

class ProfileController extends GetxController{

  Rx<TextEditingController> nameC =  TextEditingController().obs;
  Rx<TextEditingController> emailC =  TextEditingController().obs;
  Rx<TextEditingController> mobileC =  TextEditingController().obs;



  List profileDataList=[].obs;

  List <ProfileDataModal> get getProfileDataList => List <ProfileDataModal>.from(
      profileDataList.map((element) => ProfileDataModal.fromJson(element)));

  set updateProfileDataList(List val){
    profileDataList =val;
    update();
  }

  // String  = '';
  // String get getLoader=>loader;
  // set updateLoader(String val){
  //   loader=val;
  //   update();
  // }


}
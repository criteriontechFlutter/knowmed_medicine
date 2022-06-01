import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Profile/profileController.dart';

import '../../AppManager/AlertDialogue.dart';

class ProfileModal {

  ProfileController controller = Get.put(ProfileController());
  App app = App();
  RawData rawData = RawData();
  UserData user = Get.put(UserData());

  profileData(context)async{

    var body={
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/getProfileDetails', body, context);


    if(data['responseCode']==1){
        controller.updateProfileDataList=data['responseValue'];
        controller.nameC.value.text= controller.getProfileDataList[0].firstName.toString();
        controller.emailC.value.text= controller.getProfileDataList[0].emailId.toString();
        controller.mobileC.value.text= controller.getProfileDataList[0].mobileNo.toString();
        print(controller.mobileC.toString());

      }
      else{
        alertToast(context, data['responseMessage']);
      }
  }


  onUpdateProfile(context)async{

    var body={
      "age":UserData().getUserData.age.toString(),
        // "cityId":"5",
        // "countryId":UserData().getUserData.country.toString(),
        "firstName":controller.nameC.value.text.toString(),
        "gender":UserData().getUserData.gender.toString(),
      "heightInFeet":UserData().getUserData.heightInFeet.toString(),
        "heightInInch":UserData().getUserData.heightInInch.toString(),
        // "stateId":"3",""
          "userId":UserData().getUserData.id.toString(),
        "weight":UserData().getUserData.weight.toString()

    };

    var data=await rawData.api('Knowmed/updateUserProfile', body, context,token: true);


    if(data['responseCode']==1){
      print(controller.nameC.toString());
      alertToast(context, 'Updated Succesfully');
    }
    else{
      alertToast(context, data['responseMessage']);
    }



  }



}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/Pages/Registration/otp_module.dart';
import 'package:knowmed/Pages/Registration/registration_Controller.dart';
import 'package:flutter/material.dart';
import '../../AppManager/AlertDialogue.dart';
import '../../AppManager/appUtils.dart';
import '../../AppManager/progress_dialogue.dart';
import '../../AppManager/raw_api.dart';
import '../Login/login_page_view.dart';

class RegistrationModal{

  RegistrationController controller=Get.put(RegistrationController());
  App app = App();
  RawData rawData=RawData();
  UserData user = Get.put(UserData());
  
  
  userRegistration(context, int i)async{
    ProgressDialogue().show(context, loadingText: 'Verifying OTP');
    var body;
    if(i==1){
       body={
        "mobileNo":controller.mobileC.value.text.toString(),
        "countryId":"+91"
      };
    }
    else{
      body={
        "mobileNo":controller.mobileC.value.text.toString(),
        "emailId":controller.emailC.value.text.toString(),
        "countryId":"+91"
      };
    }

    var data=await rawData.api('Knowmed/generateOTP', body, context,token: true);
    ProgressDialogue().hide();
    print('loooooooooooooooooooooooooool'+data.toString());

    if(data['responseCode']==1){
      if(data['responseMessage']=="Success"){
        await showOTPModule(context);
      }

    }
    else{
      Navigator.pop(context);
      // if(data['responseMessage']=="Mobile No Already Registered With Us !!"){
      //  app.replaceNavigate(context, LoginPageView());
      // }

    }
  }



  userVarification(context)async{

    var body={
      "otp":controller.otpController.value.text.toString(),
      "firstName":controller.nameC.value.text.toString(),
      "emailId":controller.emailC.value.text.toString(),
      "mobileNo":controller.mobileC.value.text.toString(),
      "phoneCode":"+91"
    };

    var data=await rawData.api('Knowmed/userRegistration', body, context,token: true);
    print('zzzzzzzzzzzzzzz'+data.toString());
    if(data['responseCode']==1){
      if(data['responseMessage']=="Success"){

         app.replaceNavigate(context, const LoginPageView());
      }
      else{
        alertToast(context, data['responseValue']);
      }
    }
    else{
      alertToast(context, 'Invalid Otp');

    }
  }


}
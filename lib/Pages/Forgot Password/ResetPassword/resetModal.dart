import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Forgot%20Password/ResetPassword/resetController.dart';
import 'package:flutter/material.dart';
import '../../../AppManager/AlertDialogue.dart';
import '../../Login/login_page_view.dart';

class ResetModal {
  ResetController controller = Get.put(ResetController());
  App app = App();
  RawData rawData = RawData();
  UserData user = Get.put(UserData());

  
  onUpdatePassWord(context)async{
    
    var body={
      "otp":controller.otpC.value.text.toString(),
      "mobileOREmail":controller.mobileNum.toString(),
      "password":controller.newPassC.value.text.toString(),
      "confirmPassword":controller.confirmPassC.value.text.toString(),

    };
    
    var data=await rawData.api('Knowmed/updateNewPassword', body, context);
    print('kkkkkkkkkkkkkk'+data.toString());

    if(data['responseCode']==1) {
      // alertToast(context, data['responseMessage']);
      Navigator.pop(context);
      //app.replaceNavigate(context, const LoginPageView());
    }else{
        alertToast(context, data['responseValue']);
      }
    }

    
    
  }

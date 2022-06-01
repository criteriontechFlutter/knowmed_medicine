import 'package:get/get.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import '../../AppManager/AlertDialogue.dart';
import '../../AppManager/appUtils.dart';

import '../Dashboard/DashboardView.dart';
import 'login_Controller.dart';
import 'login_page_view.dart';

class LoginModal{
  LoginController controller = Get.put(LoginController());
  App app = App();
  RawData rawData=RawData();
  UserData user = Get.put(UserData());

  onPressedLogin(context)async{
    if(controller.formKey.value.currentState!.validate()){
      await userLogin(context);
    }
  }

  userLogin(context)async{

    var body={
        "appType":"KD",
        "deviceId":"fe5055232e2b9f3a",
        "deviceTypeId":"1",
        "password":controller.passwordC.value.text.toString(),
        "userId":controller.idC.value.text.toString()

    };
    print(body.toString());
    var data =await rawData.api('Knowmed/checkUserLogin', body, context);
    print('ffffffffffffffffffff'+data.toString());

    if(data['responseCode']==1){
      if(data['responseMessage']=="Success"){
        UserData().addUserData(data['responseValue'][0]);
        alertToast(context, data['responseMessage']);
        app.replaceNavigate(context, const DashboardView());
      }
      else{
        alertToast(context, data['responseValue']);
      }
    }
  }

  userLogout(context)async{

    var body={
      "appType":"KD",
      "deviceId":"fe5055232e2b9f3a",
      "deviceTypeId":"1",
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/logout', body, context,token: true);
    print(data.toString()+'rrrrrrrrrrr');
    if(data['responseCode']==1){
        await   UserData().removeUserData();
        await  Get.offAll(const LoginPageView());
      }
      else{
        alertToast(context, data['responseValue']);
      }
    }

  }

import 'package:get/get.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/ChangePassword/changePasswordController.dart';
import 'package:knowmed/Pages/Login/login_page_view.dart';

import '../../AppManager/AlertDialogue.dart';

class ChangePassModal {
  changePassController controller = Get.put(changePassController());
  App app = App();
  RawData rawData = RawData();
  
  onUpdatePassWord(context)async{
    
    var body={
      "userId":UserData().getUserData.id.toString(),
      "oldPassword":controller.oldPassC.value.text.toString(),
      "newPassword":controller.newPassC.value.text.toString(),

    };
    
    var data=await rawData.api('Knowmed/changePassword', body, context);
    print('n'+data.toString());

    if(data['responseCode']==1) {
      app.replaceNavigate(context, const LoginPageView());
    }else{
        alertToast(context, data['responseValue']);
      }
    }

    
    
  }

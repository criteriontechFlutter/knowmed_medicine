import 'package:get/get.dart';
import '../../AppManager/AlertDialogue.dart';
import '../../AppManager/UserRepository/user_data.dart';
import '../../AppManager/appUtils.dart';
import '../../AppManager/raw_api.dart';
import 'ResetPassword/reserPassView.dart';
import 'forgetController.dart';

class ForgetModal {
  ForgetController controller = Get.put(ForgetController());
  App app = App();
  RawData rawData = RawData();
  UserData user = Get.put(UserData());



  onForget(context)async {

    var body={
      "mobileOREmail":controller.mobileC.value.text.toString()
    };

    var data=await rawData.api('Knowmed/generateOTPForForgotPassword', body, context,token: true);
    print('jjjjjjjjjjjj'+data.toString());

    if(data['responseCode']==1){
      if(data['responseMessage']=="Success"){
        // alertToast(context, data['responseMessage']);
        app.replaceNavigate(context,  ResetPassword(mobileNumber:controller.mobileC.value.text.toString(),));
      }
      else{
        alertToast(context, data['responseValue']);
      }
    }
  }
}
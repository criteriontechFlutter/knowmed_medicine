import 'package:get/get.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/Pages/Dashboard/DashboardView.dart';

import 'feedbackController.dart';

class FeedbackModal{

  FeedbackController controller=Get.put(FeedbackController());
  UserData userData=UserData();
  RawData rawData=RawData();
  App app=App();

  onFeedbackDropdown(context)async{
    var body={
      "userId":UserData().getUserData.id.toString()
    };
    var data=await rawData.api('Knowmed/getAllModule', body, context,token: true);
    if(data['responseCode']==1){
      print('++++++'+data.toString());
      controller.updateFeedbackModuleList=data['responseValue'];
    }else{
      alertToast(context, data['responseValue']);
    }

  }

  onSubmitFeedback(context)async{
    var body={
      "moduleId":controller.getModule.toString(),
      "remark":controller.remarksC.value.text.toString(),
      "suggestionType":controller.getCache.toString(),
      "userId":UserData().getUserData.id.toString()
    };
    var data=await rawData.api('Knowmed/feedbackSuggestion', body, context,token: true);
    if(data['responseCode']==1){
      print('++++++'+data.toString());
      alertToast(context, 'Submitted Succesfully');
      app.replaceNavigate(context, DashboardView());
    }else{
      alertToast(context, data['responseValue']);
    }

  }
}
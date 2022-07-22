import 'package:get/get.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_Controller.dart';

class DiseaseModal{

  int i = 0;
  List alphabets = [];

  DiseaseController controller=Get.put(DiseaseController());

  UserData userData=UserData();
  RawData rawData=RawData();






  getLetters(){
    for(i = 65;i<=90;i++){
      alphabets.add(String.fromCharCode(i));
    }

  }




  diseaseListByAlphabetAndFiltter(context, {
    bool getAllData=false,
    bool removeAlphabet=false,
  })async{
    controller.updateShowNoData=false;
    var body={
      "userId": UserData().getUserData.id.toString(),
      "alphabet": getAllData?"":controller.alpha.toString(),
    };

    if(removeAlphabet){
      body.remove('alphabet');
    }
    print('qqqqqqqqqqqq'+controller.diseaseId.toString());

    print(body);
    var data=await rawData.api('Knowmed/getAllDiseaseByAlphabet', body, context,token: true);
    controller.updateShowNoData=true;
    if(data['responseCode']==1){
      print('kkkkkkkkkkkkkkkkkkk'+data.toString());
      controller.updateDiseaseAlphabet=data['responseValue'];
    }
    //controller.update();
  }


}
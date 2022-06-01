import 'package:get/get.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/NutrientAndCompounds/nutrient_and_compound_Controller.dart';


class NutrientModal{

  int i = 0;
  List alphabets = [];

  NutrientController controller=Get.put(NutrientController());

  UserData userData=UserData();
  RawData rawData=RawData();
  
  nutrientFilter(context)async {

    var body={
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/getAllNutrientCategory', body, context,token: true);
    print('fffffffffffffffffffff'+data.toString());
    controller.updateFilterList=data['responseValue'];
    print('groupId: '+ controller.getNutrientCategoryId.toString());

    //print("Alphabets are: " + alphabets.toString());
  }

  getLetters(){
    for(i = 65;i<=90;i++){
      alphabets.add(String.fromCharCode(i));
    }

  }



  nutrientByAlphabetAndFiltter(context, {
    bool getAllData=false,
    bool removeAlphabet=false,
  })async{
    controller.updateShowNoData=false;
    var body={
      "alphabet": getAllData?"":controller.alpha.toString(),
      "userId": UserData().getUserData.id.toString(),
      "nutrientCategoryId": controller.getNutrientCategoryId.toString(),
    };

    if(removeAlphabet){
      body.remove('alphabet');
    }
    print('qqqqqqqqqqqq'+controller.nutrientId.toString());

    print(body);
    var data=await rawData.api('Knowmed/getAllNutrientByAlphabet', body, context,token: true);
    controller.updateShowNoData=true;
    if(data['responseCode']==1){
      print('kkkkkkkkkkkkkkkkkkk'+data.toString());
      controller.updateNutrientAlphabet=data['responseValue'];
    }
    //controller.update();
  }


}
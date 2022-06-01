import 'package:get/get.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/food_And_Herb_Controller.dart';


class FoodAndHerbModal{

  int i = 0;
  List alphabets = [];

  FoodAndHerbController controller=Get.put(FoodAndHerbController());

  UserData userData=UserData();
  RawData rawData=RawData();
  
  medicineFilter(context)async {

    var body={
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/getAllFoodCategory', body, context,token: true);
    print('fffffffffffffffffffff'+data.toString());
    controller.updateFilterList=data['responseValue'];
    print('groupId: '+ controller.getFoodCategoryId.toString());

    //print("Alphabets are: " + alphabets.toString());
  }

  getLetters(){
    for(i = 65;i<=90;i++){
      alphabets.add(String.fromCharCode(i));
    }

  }



  medicineByAplphabetAndFiltter(context, {
    bool getAllData=false,
    bool removeAlphabet=false,
  })async{
    controller.updateShowNoData=false;
    var body={
      "alphabet": getAllData?"":controller.alpha.toString(),
      "userId": UserData().getUserData.id.toString(),
      "foodCategoryId": controller.getFoodCategoryId.toString(),
    };

    if(removeAlphabet){
      body.remove('alphabet');
    }
    print('qqqqqqqqqqqq'+controller.foodCategoryId.toString());

    print(body);
    var data=await rawData.api('Knowmed/getAllFoodByAlphabet', body, context,token: true);
    controller.updateShowNoData=true;
    if(data['responseCode']==1){
      print('kkkkkkkkkkkkkkkkkkk'+data.toString());
      controller.updateFoodAlphabet=data['responseValue'];
    }
    //controller.update();
  }


}
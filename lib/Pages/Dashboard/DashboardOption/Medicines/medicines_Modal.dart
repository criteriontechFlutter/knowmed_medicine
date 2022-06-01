import 'package:get/get.dart';
import 'package:knowmed/AppManager/raw_api.dart';
import 'package:knowmed/AppManager/UserRepository/user_data.dart';
import 'medicines_Controller.dart';

class MedicineModal{

  int i = 0;
  List alphabets = [];

  MedicineController controller=Get.put(MedicineController());

  UserData userData=UserData();
  RawData rawData=RawData();
  
  medicineFilter(context)async {

    var body={
      "userId":UserData().getUserData.id.toString(),
    };

    var data=await rawData.api('Knowmed/getAllMedicineGroup', body, context,token: true);
    print('fffffffffffffffffffff'+data.toString());
    controller.updateFilterList=data['responseValue'];
    print('groupId: '+ controller.getMedicineGroupId.toString());

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
      "medicineGroupId": controller.getMedicineGroupId.toString(),
    };

    if(removeAlphabet){
      body.remove('alphabet');
    }
    print('qqqqqqqqqqqq'+controller.medicineGroupId.toString());

    print(body);
    var data=await rawData.api('Knowmed/getAllMedicineByAlphabet', body, context,token: true);
    controller.updateShowNoData=true;
    if(data['responseCode']==1){
      print('kkkkkkkkkkkkkkkkkkk'+data.toString());
      controller.updateMedicineAlphabet=data['responseValue'];
    }
    //controller.update();
  }


}
import 'package:get/get.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_DataModal.dart';



class DiseaseDetailsController extends GetxController{

  List diseaseDetailsList=[].obs;
  List subOverview=[].obs;

  List <DiseaseDetailsDataModal> get getMedicineDetailsList => List <DiseaseDetailsDataModal>.from(
      diseaseDetailsList.map((element) => DiseaseDetailsDataModal.fromJson(element)));

  set updateDiseaseDetailsList(List val){
    diseaseDetailsList =val;
    subOverview =val.isEmpty?[]:val[0]['subOverview'];
    update();
  }



  RxBool showNoData=false.obs;
  bool get getShowNoData=>(showNoData.value);
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/AppManager/my_text_field_2.dart';
import 'package:knowmed/AppManager/widget/searchable_text_field.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DoseCalculator/doseCalculatorController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DoseCalculator/doseCalculatorModal.dart';
import '../../../../AppManager/coloured_safe_area.dart';

class DoseCalculatorPageView extends StatefulWidget {
  const DoseCalculatorPageView({Key? key}) : super(key: key);

  @override
  _DoseCalculatorPageViewState createState() => _DoseCalculatorPageViewState();
}

class _DoseCalculatorPageViewState extends State<DoseCalculatorPageView>{


  DoseCalculatorModal modal=DoseCalculatorModal();

  @override
  void initState(){
    super.initState();
    get();
  }

  get() async{
    await modal.doseUnitList(context);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<DoseCalculatorController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Dose Calculator',
                  style: MyTextTheme().largeSCB.copyWith(
                      color: AppColor().text_blue
                  )
              ),
              backgroundColor: AppColor().grey_header,
            ),
        body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GetBuilder(
                    init:DoseCalculatorController(),
                    builder: (_) {
                      return Column(
                        children: [

                          Expanded(
                            child:  doseCalculatorPart(context),),

                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColor().orange,
                                AppColor().orange
                              ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft:Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: MyButton(
                                color: AppColor().white,
                                title: 'Calculate',
                                onPress: ()async{
                                  await modal.doseCalculate(context);
                                },

                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ),
            ]
        )
        )
        )
    );
  }
}
doseCalculatorPart(context){
  DoseCalculatorModal modal=DoseCalculatorModal();
  return GetBuilder(
    init: DoseCalculatorController(),
    builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Medicine Name',
                style: MyTextTheme().mediumPCB,),
              SizedBox(height: 10,),

              SearchedTextField(
                controller:modal.controller.medicineC.value,
                searchedList:modal.controller.getAllMedicineList,
                onTap: (){
                  modal.controller.update();
                },
                showSearchedList:modal.controller.medicineC.value.text!='',
                searchParam: 'medicineName',

                onTapSearchedData: (val){
                  if(val!=null ){
                    print(val.toString());
                    modal.controller.medicineId=val['id'];
                    modal.controller.onTapTest(val);
                    modal.controller.updateAllMedicineList=[];
                    //print(modal.controller.testID.value.toString());
                    //FocusManager.instance.primaryFocus?.unfocus();
                    modal.controller.update();
                  }
                },
                onChanged: (val) async {
                  print('this is value'+val.toString());



                  if(  modal.controller.medicineId==0 &&val.toString().isNotEmpty) {
                   await modal.getAllMedicine(context);

                  }
                  else{
                    if(  modal.controller.getAllMedicineList.isEmpty && val.toString().isNotEmpty){
                      modal.controller.medicineId=0;
                      modal.controller.update();
                    }
                    modal.controller.updateAllMedicineList=[];
                    modal.controller.update();
                  }
                  modal.controller.update();
                },
              ),

              SizedBox(height: 15,),
              Text('Symptoms',
                style: MyTextTheme().mediumPCB,),
              SizedBox(height: 10,),
              MyTextField2(
                controller:modal.controller.symptomC.value,
                searchedList:modal.controller.getAllSymptomList,
                onTap: (){
                  modal.controller.update();
                },
                showSearchedList:modal.controller.symptomC.value.text!='',
                searchParam: 'problemName',

                onTapSearchedData: (val){
                  if(val!=null ){
                    print(val.toString());
                    modal.controller.onTapSymptom(val);
                    modal.controller.problemId=val['id'];
                    //print(modal.controller.testID.value.toString());
                    //FocusManager.instance.primaryFocus?.unfocus();
                    modal.controller.update();
                  }
                },
                onChanged: (val) async {
                  print('this is value'+val.toString());




                  if(  modal.controller.problemId==0 &&val.toString().isNotEmpty) {
                    await modal.getAllSymptom(context);

                  }
                  else{
                    if(  modal.controller.getAllMedicineList.isEmpty && val.toString().isNotEmpty){
                      modal.controller.problemId=0;
                      modal.controller.update();
                    }
                    modal.controller.updateAllSymptomList=[];
                    modal.controller.update();
                  }
                  modal.controller.update();
                },
              ),
              SizedBox(height: 15,),
              Text('Age',
                style: MyTextTheme().mediumPCB,),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyTextField2(
                      controller: modal.controller.ageC.value,
                      validator: (value){
                        print('faheem'+value.toString());
                        if(value!.length==0)
                        {
                          return 'Field must not be empty.';
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: MyCustomSD(
                        //menuMode: false,
                        listToSearch: modal.controller.unitDoseList,
                        valFrom: 'name',
                        hideSearch: true,
                        height: 100,
                        onChanged: (val){
                          if(val!=null){
                            modal.controller.ageUnitId=val['id'];
                          }

                        }
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Text('Weight(kg)',
                style: MyTextTheme().mediumPCB,),
              SizedBox(height: 10,),
              MyTextField2(
                controller: modal.controller.weightC.value,
                validator: (value){
                  if(value!.length==0)
                  {
                    return 'Field must not be empty.';
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(),


            ],
          ),
        ),
      );
    }
  );
}
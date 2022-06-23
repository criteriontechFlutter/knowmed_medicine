
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/AppManager/my_text_field_2.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/interactionCheckerController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/InteractionChecker/interactionCheckerModal.dart';
import 'package:lottie/lottie.dart';
import '../../../../AppManager/coloured_safe_area.dart';

class InteractionCheckerPageView extends StatefulWidget {
  const InteractionCheckerPageView({Key? key}) : super(key: key);

  @override
  _InteractionCheckerPageViewState createState() => _InteractionCheckerPageViewState();
}

class _InteractionCheckerPageViewState extends State<InteractionCheckerPageView>{


  InteractionCheckerModal modal=InteractionCheckerModal();

  @override
  void initState(){
    super.initState();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<InteractionCheckerController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Interaction Checker',
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
                    init:InteractionCheckerController(),
                    builder: (_) {
                      return Column(
                        children: [

                          Expanded(
                            child:  interactionCheckerPart(context),),

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
                                color: AppColor().brownText,
                                title: 'Check Interaction',
                                onPress: ()async{
                                  await modal.checkInteraction(context);
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
interactionCheckerPart(context){
  InteractionCheckerModal modal=InteractionCheckerModal();
  return GetBuilder(
    init: InteractionCheckerController(),
    builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter a drug, OTC or herbal supplement',
                style: MyTextTheme().smallGCN,),
              const SizedBox(height: 10,),

              MyTextField2(
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
                    modal.controller.medicineId=val['medicineID'];
                    modal.controller.onTapTest(val);
                    //print(modal.controller.testID.value.toString());
                    //FocusManager.instance.primaryFocus?.unfocus();
                    modal.controller.update();
                  }
                },
                onChanged: (val) async {
                  print('this is value'+val.toString());
                  if(val.toString().isNotEmpty) {
                   await modal.getAllMedicine(context);

                  }
                  else{
                    modal.controller.updateAllMedicineList=[];
                    modal.controller.update();
                  }
                  modal.controller.update();
                },
              ),
              SizedBox(height: 15,),
              Container(
                // height: 270,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 10),
                        height: 400,
                        decoration: BoxDecoration(
                          color: AppColor().white,
                          border:
                          Border.all(
                              color: AppColor().greyLight
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft:Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),

                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Selected medicines',
                                      style: MyTextTheme().smallBCB,),
                                    Expanded(child: Container()),
                                    Container(
                                        padding: const EdgeInsets.only(left: 20,right: 20),
                                        width: 110,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: AppColor().greyLight,
                                            border:
                                            Border.all(
                                                color: AppColor().greyLight
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                      child:Container(
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                    children: [
                                                      const Icon(Icons.close,
                                                        size: 15,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text('Clear all',
                                                        style: MyTextTheme().smallBCN,),
                                                    ]
                                                )
                                              ]
                                          )
                                      ),


                                    )

                                  ],
                                ),
                                const SizedBox(height: 2),
                                Divider(color: AppColor().greyLight),
                                const SizedBox(height: 10),

                              ]
                          )
                      ),

                    ]
                ),
              ),

              
            ],
          ),
        ),
      );
    }
  );
}
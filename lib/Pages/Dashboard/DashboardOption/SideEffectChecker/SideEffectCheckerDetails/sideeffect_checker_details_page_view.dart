
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideEffectCheckerController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideeffectCheckerModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideeffect_Data_Modal.dart';


class SideEffectCheckerDetailsPageView extends StatefulWidget {
  const SideEffectCheckerDetailsPageView({Key? key}) : super(key: key);

  @override
  _SideEffectCheckerDetailsPageViewState createState() => _SideEffectCheckerDetailsPageViewState();
}

class _SideEffectCheckerDetailsPageViewState extends State<SideEffectCheckerDetailsPageView>{


  //SideEffectCheckerModal modal=SideEffectCheckerModal();

  @override
  void initState(){
    super.initState();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<SideeffectCheckerController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Side Effect Checker Result',
                  style: MyTextTheme().largeSCB.copyWith(
                      color: AppColor().text_blue
                  )
              ),
              backgroundColor: AppColor().grey_header,
            ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: GetBuilder(
                  init:SideeffectCheckerController(),
                  builder: (_) {
                    return sideeffectCheckerPart(context);
                  }
                ),
              ),
            ],
          ),
        )
        )
        )
    );
  }
}
sideeffectCheckerPart(context){
  SideeffectCheckerModal modal=SideeffectCheckerModal();

  return GetBuilder(
    init: SideeffectCheckerController(),
    builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                             padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                             child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Result',
                        style: MyTextTheme().mediumBCB,),

                    ]
                       )
                     ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Problem',style: MyTextTheme().smallGCN,),
                          Text('Medicine',style: MyTextTheme().smallGCN),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Divider(color: AppColor().greyLight),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                         child: ListView.builder(
                           physics: const NeverScrollableScrollPhysics(),
                              itemCount: (modal.controller.getMedicineDetailsList.effectedMedicine??[]).length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                EffectedMedicine effectedMedicineData= modal.controller.getMedicineDetailsList.effectedMedicine![index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(child: Text(effectedMedicineData.problemName.toString(),style: MyTextTheme().smallBCN)),
                                      Expanded(child: Text(effectedMedicineData.effectedMedicine.toString(),style: MyTextTheme().smallBCN)),

                                    ],
                                  ),
                                );
                              }
                          )
                       /* child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Text(effectedMedicineData.effectedMedicine![0].problemName.toString(),style: MyTextTheme().smallBCN)),
                            Expanded(child: Text(effectedMedicineData.effectedMedicine![0].effectedMedicine.toString(),style: MyTextTheme().smallBCN)),

                          ],
                        ),*/
                      ),
                      const SizedBox(height: 15,),
                      Container(
                          padding: const EdgeInsets.only(left: 10,top: 60,right: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Other Side Effects',
                                  style: MyTextTheme().mediumBCB,),

                              ]
                          )
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Medicine',style: MyTextTheme().smallGCN,),
                          Text('Side Effects',style: MyTextTheme().smallGCN),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Divider(color: AppColor().greyLight),
                      const SizedBox(height: 10),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: (modal.controller.getMedicineDetailsList.otherSideEffect??[]).length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                OtherSideEffect otherSideEffect= modal.controller.getMedicineDetailsList.otherSideEffect![index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(child: Text(otherSideEffect.medicineName.toString(),style: MyTextTheme().mediumBCB)),
                                      Expanded(child: Text(otherSideEffect.otherSideEffect.toString(),style: MyTextTheme().smallBCN)),

                                    ],

                                  ),

                                );
                              }
                          )
                        /* child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Text(effectedMedicineData.effectedMedicine![0].problemName.toString(),style: MyTextTheme().smallBCN)),
                            Expanded(child: Text(effectedMedicineData.effectedMedicine![0].effectedMedicine.toString(),style: MyTextTheme().smallBCN)),

                          ],
                        ),*/
                      ),


                    ]
                )
            ),
          ],
        ),
      );
    }
  );
}
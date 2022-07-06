
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/deficiencyCheckerController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/deficiencyCheckerModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/dificiency_checker_result_Data_Modal.dart';


class DeficiencyCheckerDetailsPageView extends StatefulWidget {
  const DeficiencyCheckerDetailsPageView({Key? key}) : super(key: key);

  @override
  _DeficiencyCheckerDetailsPageViewState createState() => _DeficiencyCheckerDetailsPageViewState();
}

class _DeficiencyCheckerDetailsPageViewState extends State<DeficiencyCheckerDetailsPageView>{


  //SideEffectCheckerModal modal=SideEffectCheckerModal();

  @override
  void initState(){
    super.initState();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<DificiencyCheckerController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Deficiency Checker',
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
                  init:DificiencyCheckerController(),
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
  DificiencyCheckerModal modal=DificiencyCheckerModal();

  return GetBuilder(
    init: DificiencyCheckerController(),
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
                      Text('Deficiency',
                              style: MyTextTheme().largeSCB.copyWith(
                              color: AppColor().text_blue
                          ),
                      ),

                    ]
                       )
                     ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Nutrient',style: MyTextTheme().smallGCN,),
                          Text('Symptom',style: MyTextTheme().smallGCN),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Divider(color: AppColor().greyLight),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                         child: ListView.builder(
                           physics: const NeverScrollableScrollPhysics(),
                              itemCount: (modal.controller.getDeficiencyDetailsList.deficinecy??[]).length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                Deficinecy effectedMedicineData= modal.controller.getDeficiencyDetailsList.deficinecy![index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(child: Text(effectedMedicineData.nutrient.toString(),style: MyTextTheme().smallBCB)),
                                      Expanded(child: Text('',style: MyTextTheme().smallBCB)),
                                      Expanded(child: Text(effectedMedicineData.symptom.toString(),style: MyTextTheme().smallBCN)),

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
                                Text('Toxicity',
                                  style: MyTextTheme().largeSCB.copyWith(
                                      color: AppColor().text_blue
                                  ),
                                ),

                              ]
                          )
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Nutrient',style: MyTextTheme().smallGCN,),
                          Text('Symptom',style: MyTextTheme().smallGCN),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Divider(color: AppColor().greyLight),
                      const SizedBox(height: 10),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: (modal.controller.getDeficiencyDetailsList.toxicity??[]).length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                Toxicity toxicity= modal.controller.getDeficiencyDetailsList.toxicity![index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(child: Text(toxicity.nutrient.toString(),style: MyTextTheme().smallBCB)),
                                      Expanded(child: Text('',style: MyTextTheme().smallBCB)),
                                      Expanded(child: Text(toxicity.symptom.toString(),style: MyTextTheme().smallBCN)),

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
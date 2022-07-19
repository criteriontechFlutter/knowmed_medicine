
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
  DificiencyCheckerModal modal=DificiencyCheckerModal();

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

  String cache='Deficiency';

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

            body: GetBuilder(
            init: DificiencyCheckerController(),
            builder: (_) {
            return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            cache="Deficiency";
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                                color: cache == "Deficiency"?Colors.blue:Colors.white,
                                borderRadius:  BorderRadius.only(topLeft:Radius.circular(5),bottomLeft: Radius.circular(5)),
                                border: Border.all(color:cache=="Deficiency"?AppColor().blue:Colors.grey)
                            ),
                            child: Text('Deficiency',style: cache=="Deficiency"?MyTextTheme().mediumWCN:MyTextTheme().mediumBCN,textAlign: TextAlign.center)),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            cache="Toxicity";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color:  cache == "Toxicity"?Colors.blue:Colors.white,
                            border: Border.all(color: cache=="Toxicity"?AppColor().blue:AppColor().grey),
                            borderRadius: const BorderRadius.only(topRight:Radius.circular(5),bottomRight: Radius.circular(5)),
                          ),
                          child: Text('Toxicity',style: cache=="Toxicity"?MyTextTheme().mediumWCN:MyTextTheme().mediumBCN,textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             Expanded(child:

             cache == "Deficiency"?Container(
               //height: MediaQuery.of(context).size.height,
                 margin: const EdgeInsets.fromLTRB(10,0,10,10),
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
                       const SizedBox(height: 10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text('Nutrient',style: MyTextTheme().mediumBCB,),
                           Text('Symptom',style: MyTextTheme().mediumBCB),
                         ],
                       ),
                       const SizedBox(height: 2),
                       Divider(color: AppColor().greyLight),
                       const SizedBox(height: 10),

                       Expanded(
                         child: Padding(
                             padding: const EdgeInsets.fromLTRB(20,0,20,10),

                             child: ListView.builder(
                                 itemCount: (modal.controller.getDeficiencyDetailsList.deficinecy??[]).length,
                                 itemBuilder: (BuildContext context, int index) {
                                   Deficinecy effectedMedicineData= modal.controller.getDeficiencyDetailsList.deficinecy![index];
                                   return Padding(
                                     padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         Text(effectedMedicineData.nutrient.toString(),style: MyTextTheme().smallBCB),
                                         Text('',style: MyTextTheme().smallBCB),
                                         Text(effectedMedicineData.symptom.toString(),style: MyTextTheme().smallBCN),

                                       ],
                                     ),
                                   );
                                 }
                             )
                         ),
                       ),

                     ]
                 )
             ):Container(
                 margin: const EdgeInsets.fromLTRB(10,0,10,10),
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
                       const SizedBox(height: 10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text('Nutrient',style: MyTextTheme().mediumBCB,),
                           Text('Symptom',style: MyTextTheme().mediumBCB),
                         ],
                       ),
                       const SizedBox(height: 2),
                       Divider(color: AppColor().greyLight),
                       const SizedBox(height: 10),

                       Expanded(
                         child: Padding(
                             padding: const EdgeInsets.fromLTRB(20,0,20,10),

                             child: ListView.builder(
                                 itemCount: (modal.controller.getDeficiencyDetailsList.toxicity??[]).length,
                                 shrinkWrap: true,
                                 itemBuilder: (BuildContext context, int index) {
                                   Toxicity toxicity= modal.controller.getDeficiencyDetailsList.toxicity![index];
                                   return Padding(
                                     padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         Text(toxicity.nutrient.toString(),style: MyTextTheme().smallBCB),
                                         Text('',style: MyTextTheme().smallBCB),
                                         Text(toxicity.symptom.toString(),style: MyTextTheme().smallBCN),

                                       ],

                                     ),

                                   );
                                 }
                             )
                         ),
                       ),

                     ]
                 )
             )
             )


            ],
            );
    }
            )

        )
        )
    );
  }
}

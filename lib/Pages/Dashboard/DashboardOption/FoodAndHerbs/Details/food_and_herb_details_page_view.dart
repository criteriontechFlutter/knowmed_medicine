
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/AppManager/my_text_field_2.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/Details/foodAndHerbController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/Details/foodAndHerbDetailsModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/Details/foodandherb_Data_Modal.dart';




class FoodAndHerbDetailsPageView extends StatefulWidget {

  final int index;

  const FoodAndHerbDetailsPageView({Key? key, required this.index}) : super(key: key);


  @override
  _FoodAndHerbDetailsPageViewState createState() => _FoodAndHerbDetailsPageViewState();
}

class _FoodAndHerbDetailsPageViewState extends State<FoodAndHerbDetailsPageView>{

  FoodHerbDetailsModal modal= FoodHerbDetailsModal();


  @override
  void initState() {
    super.initState();
    get();


  }


  @override
  get() async {
    await modal.getFoodAndHerbDetails(context,widget.index);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Food Nutrition Details',
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
                padding: const EdgeInsets.all(10),
                child: GetBuilder(
                  init:FoodAndHerbDetailController(),
                  builder: (_) {
                    return nutrientDetailsPart(context);
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
nutrientDetailsPart(context){
  FoodHerbDetailsModal modal=FoodHerbDetailsModal();

  return GetBuilder(
    init: FoodAndHerbDetailController(),
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
                            // padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                             child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                        child: Text('Acanthopanax sessiliflorum,roots',
                          style: MyTextTheme().largeBCB,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text('Natural Food',
                          style: MyTextTheme().smallGCN,),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColor().bgOrange,
                          border:
                          Border.all(
                              color: AppColor().greyLight
                          ),
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                        ),

                        child:Container(
                           // padding: const EdgeInsets.only(left: 100),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Image(image: AssetImage('assets/ic_serving.png'),
                                            fit:BoxFit.cover,
                                            width: 25,
                                            height: 25,
                                          )
                                        ),
                                        SizedBox(width: 10,),
                                        Text('Serving size',
                                          style: MyTextTheme().smallOCB,
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: MyTextField2(
                                            //controller: modal.controller.ageC.value,
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
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: MyTextField2(
                                            //controller: modal.controller.ageC.value,
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
                                        SizedBox(width: 10,),

                                      ]
                                  )
                                ]
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                        child: Text('Amount per serving',
                          style: MyTextTheme().smallGCN,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text('Calories 24.78',
                          style: MyTextTheme().mediumBCB,),
                      ),

                    ]
                       )
                     ),
                      const SizedBox(height: 15,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor().greyLight,
                          borderRadius: const BorderRadius.only(
                            topLeft:Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child:Container(
                           child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                               Row(
                               children: [
                                 Expanded(child: Container()),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10,right: 10),
                                   child: Text('% Daily Value',
                                     style: MyTextTheme().mediumBCB,),
                                 ),
                               ]
                               )
                           ]
                           )
                        )
                      ),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                         child: ListView.builder(
                           physics: const NeverScrollableScrollPhysics(),
                              itemCount:modal.controller.getMedicineDetailsList.isEmpty? 0: (modal.controller.getMedicineDetailsList[0].topNutrients??[]).length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                TopNutrients topnutrient= modal.controller.getMedicineDetailsList[0].topNutrients![index];
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(topnutrient.nutrientName.toString(),style: MyTextTheme().mediumBCB),
                                      Expanded(child: Container()),
                                      Text(topnutrient.nutrientPercentage.toString(),style: MyTextTheme().mediumBCB),

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
                      const SizedBox(height: 10,),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor().blue_two,
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child:Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,right: 20),
                                            child: Text('Fat',
                                              style: MyTextTheme().mediumBluetexttwo,),
                                          ),
                                          Expanded(child: Container()),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,right: 20),
                                            child: Text('0.22',
                                              style: MyTextTheme().mediumBluetexttwo,),
                                          ),
                                        ]
                                    )
                                  ]
                              )
                          )
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                        child: Text('Daily values are based on 2000 calorie diet',
                          style: MyTextTheme().smallGCN,),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor().grey_box,
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child:Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,right: 10),
                                            child: Text('Nutrition facts & analysis per serving',
                                              style: MyTextTheme().mediumBCB,),
                                          ),
                                        ]
                                    )
                                  ]
                              )
                          )
                      ),
                      const SizedBox(height: 15,),
                     /* Padding(
                        padding: const EdgeInsets.fromLTRB(12,10,12,8),
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
                      ),*/

                    ]
                )
            ),
          ],
        ),
      );
    }
  );
}
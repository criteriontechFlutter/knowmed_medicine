
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/common_widgets.dart';
import 'package:knowmed/Pages/Symptom%20Checker/Widget/select_body_part_widget.dart';
import 'package:knowmed/Pages/Symptom%20Checker/Widget/sideAnimationWidget.dart';
import 'package:knowmed/Pages/Symptom%20Checker/symptomCheckerController.dart';

import '../../AppManager/coloured_safe_area.dart';
import '../../AppManager/my_text_field_2.dart';
import 'symptomCheckerDataModal.dart';
import 'symptomCheckerModal.dart';

class MealPlan extends StatefulWidget {
  const MealPlan({Key? key}) : super(key: key);

  @override
  State<MealPlan> createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {

  SymptomCheckerModal modal=SymptomCheckerModal();





  PageController controller = PageController();

BodyPart selectedBodyPart =BodyPart.notSelected;
  // @override
  // void initState() {
  //   super.initState();
  // }


  @override
  void initState() {
    super.initState();
    get();
  }
  get()async{await modal.onSymptomsClick(context);
    await modal.onAddAnyOtherDisease(context);
  }
int count =0;
  @override
  Widget build(BuildContext context) {


    List<Widget> list = <Widget>[
      Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SelectBodyPartWidget(
              selectedBodyPart: selectedBodyPart,
              onTapBodyPart: (BodyPart val,String id) async {
                print(val.toString());
                print('nkjghdfhgkjhfgk'+id.toString());
                print('nkjghdfhgkjhfgk'+modal.controller.getBodyOrganRegionList.length.toString());
                selectedBodyPart=val;
                setState(() {

                });
                modal.controller.updateSelectedId=id.toString();

                await modal.onClickAnimation(context);

              },
            ),
          ),
          SideAnimationPart(selectedBodyPart: selectedBodyPart,onTapBodyPart: (val,id){
          },),
        ],
      ),
      allSymptomsWidget(),
      suggestedUnlocalizedProblemWidget(),
      // heightWidget(),
      // weightWidget(),
      // activityWidget(),
      // problemWidget()
    ];
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: AppColor().white,
        appBar: AppBar(
          backgroundColor: AppColor().greyLight,
          title: Text('Symptom Checker',style: MyTextTheme().largeBCB,),
        ),
        body: GetBuilder(
            init:SymptomCheckerController(),
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    pageSnapping: true,
                    itemCount:list.length ,
                    itemBuilder: (BuildContext context, int index) {
                      return list[count];
                    },
                   physics: const NeverScrollableScrollPhysics(),
                   // scrollDirection: Axis.horizontal,
                    //  physics: BouncingScrollPhysics(),
                    controller: controller,
                    onPageChanged: (num) {
                      setState(() {
                        count=num;
                        print(num.toString());
                        //_curr = num;
                      });
                    },
                  ),
                ),


              ],
            );
          }
        ),
        floatingActionButton: GetBuilder(
          init: SymptomCheckerController(),
          builder: (_) {
            return Visibility(
              visible: modal.controller.getSelectSymptomId!='',
              child: FloatingActionButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () async {
                    if(count<=list.length){
                      setState(() {
                        count++;
                      });
                    }
                    print('faheem');
                    if(count==1){
                      modal.controller.update();
                    }
                    else if(count==2){


                      await modal.onSuggestedProblem(context);
                      // await modal.onSuggestedProblem(context);
                      modal.controller.update();
                    }
                  }),
            );
          }
        ),
      ),
    );
  }







  allSymptomsWidget() {
    return CommonWidgets().showNoData(
      title: 'Medicine List Data Not Found',
      show: (modal.controller.getShowNoData &&
          modal.controller.getAllSymptomsList.isEmpty),
      loaderTitle: 'Loading Medicine List',
      showLoader: (!modal.controller.getShowNoData &&
          modal.controller.getAllSymptomsList.isNotEmpty),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder(
          init: SymptomCheckerController(),
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10, top: 5),
                  child: Text("Symptoms related to selected body part.",
                      style: MyTextTheme().mediumBCB),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Wrap(
                          children: List.generate(
                              modal.controller.getAllSymptomsList.length,
                                  (index) {
                                    SuggestedUnlocalizedProblemDataModal symptomsData=modal.controller.getAllSymptomsList[index];
                                return Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        modal.onBodyPartSymptomsTap(index);
                                      });

                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: modal.controller.onTapBodyPartSymptomsId.contains(modal.controller.getAllSymptomsList[index].id)?Colors.lightGreen:Colors.yellow.shade50,
                                          borderRadius: BorderRadius.circular(5),
                                          boxShadow:  [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 2,
                                              blurStyle: BlurStyle.solid,
                                              offset: Offset(1.0,1.0),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          symptomsData.problemName.toString(),
                                          style: MyTextTheme()
                                              .smallBCN
                                              .copyWith(fontSize: 12),
                                        )),
                                  ),
                                );
                                  },

                              growable: true)),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 15),
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.fromLTRB(6, 6, 10, 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor().grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_backspace_outlined,
                              color: AppColor().grey),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Back",
                            style: MyTextTheme().smallGCN,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

              ],
            );
          }
        ),
      ),
    );
  }

  suggestedUnlocalizedProblemWidget() {
    return GetBuilder(
      init: SymptomCheckerController(),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                child: Text("Suggested Unlocalized Problems",
                    style: MyTextTheme().mediumBCB),
              ),
              MyTextField2(
                hintText: "Search & add problems",
                controller: modal.controller.searchC.value,
                suffixIcon:
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, color: Colors.grey, size: 25),
                ),
                onChanged: (val){
                  setState(() {

                  });
                },

              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 7 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    padding: const EdgeInsets.only(top: 15, left: 1, right: 5),
                    itemCount: modal.controller.getSuggestedProblemList.length,
                    itemBuilder: (BuildContext ctx, index) {
                     SuggestedUnlocalizedProblemDataModal allProblems=modal.controller.getSuggestedProblemList[index];
                      return InkWell(
                        onTap: (){
                          setState(() {
                            modal.onSuggestProblemTap(index);
                            modal.controller.searchC.value.clear();
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: modal.controller.unlocalizedProblemId.contains(allProblems.id)?Colors.lightGreen:Colors.yellow.shade50,
                             // color: Colors.yellow.shade50,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.solid,
                                  offset: Offset(1.0,1.0),
                                ),
                              ],
                            ),
                            child: Text(
                              allProblems.problemName.toString(),
                              style:
                              MyTextTheme().smallBCN.copyWith(fontSize: 12),
                            )),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Text("Add any other disease you suffered from",
                    style: MyTextTheme().mediumBCB),
              ),
              MyTextField2(
                hintText: "Search disease",
                suffixIcon:
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, color: Colors.grey, size: 25),
                ),
                controller: modal.controller.diseaseSearchC.value,
                onChanged: (val){
                  setState(() {

                  });
                },
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 7 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    padding: const EdgeInsets.only(top: 15, left: 1, right: 5),
                    itemCount: modal.controller.getAddOtherDiseaseList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      AddAnyOtherDiseaseDataModal diseaseData =modal.controller.getAddOtherDiseaseList[index];
                      return InkWell(
                        onTap: (){
                          setState(() {
                            modal.onTapDisease(index);
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: modal.controller.diseaseSufferedId.contains(diseaseData.id)?Colors.lightGreen:Colors.yellow.shade50,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow:  [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.solid,
                                  offset: Offset(1.0,1.0),)
                              ],
                            ),
                            child: Text(
                              diseaseData.problemName.toString(),
                              style:
                              MyTextTheme().smallBCN.copyWith(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            )),
                      );
                    }),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 15),
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.fromLTRB(6, 6, 10, 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColor().grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_backspace_outlined,
                            color: AppColor().grey),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Back",
                          style: MyTextTheme().smallGCN,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,)
            ],
          ),
        );
      }
    );
  }



  weightWidget() {
    return Column(
      children: [
        Text(
          'What`s current Weight?',
          style: MyTextTheme().largeBCB,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: Text(
            'Your weight determine how much you should consume ',
            textAlign: TextAlign.center,
            style: MyTextTheme().largeBCN,
          ),
        ),
        const SizedBox(
          height: 70,
        ),
       // const Weight(),
        // Container(
        //   width: 60,
        //   decoration: const BoxDecoration(color: Colors.white),
        //   child: NumberPicker(
        //     value: 65,
        //     minValue: 0,
        //     decoration:
        //         BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        //     itemCount: 5,
        //     maxValue: 500,
        //     onChanged: (value) => setState(() => 65 == value),
        //   ),
        // ),
        const SizedBox(
          height: 30,
        ),
        const MyButton(
          width: 80,
          title: 'kg',
          color: Colors.green,
        )
      ],
    );
  }

  activityWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'How active are you ?',
          style: MyTextTheme().largeBCB,
        ),
        Text(
          'Based on your lifestyle,we can access your daily calorie requirements.',
          textAlign: TextAlign.center,
          style: MyTextTheme().largeBCN,
        ),
        const SizedBox(
          height: 20,
        ),
        // Column(
        //   children: List.generate(_mealPlanModel.controller.activeList.length, (index) {
        //     bool isSelected=_mealPlanModel.controller.selectActivityItem==_mealPlanModel.controller.activeList[index].name;
        //     return Padding(
        //       padding: const EdgeInsets.fromLTRB(0,0,0,10),
        //       child: InkWell(
        //         onTap: (){
        //           _mealPlanModel.controller.selectActivityItem=_mealPlanModel.controller.activeList[index].name;
        //           setState(() {
        //           });
        //         },
        //         child: Container(
        //           margin: const EdgeInsets.only(left: 10.0,right: 10.0),
        //           decoration: BoxDecoration(
        //             color: isSelected? Colors.green.shade800: Colors.white,
        //             borderRadius: BorderRadius.circular(5),
        //           ),
        //           child: Row(
        //             children: [
        //               Center(child: Image.asset("assets/"+ _mealPlanModel.controller.activeList[index].name.toString()+".png",height: 50,width: 50,)),
        //               Padding(
        //                 padding: const EdgeInsets.all(15.0),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       _mealPlanModel.controller.activeList[index].name.toString(),
        //                       style: MyTextTheme().mediumBCB.copyWith(
        //                           color: isSelected? Colors.white: Colors.black
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(top: 8.0),
        //                       child: Text(
        //                         _mealPlanModel.controller.activeList[index].description.toString(),
        //                         style: MyTextTheme().mediumBCN.copyWith(
        //                             color: isSelected? Colors.white: Colors.black
        //                         ),
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   }),
        // )
      ],
    );
  }
  problemWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Do you have any Problem ?',
          style: MyTextTheme().largeBCB,
        ),
        Text(
          'Based on your problem we will recommend what to eat and what not eat ',
          textAlign: TextAlign.center,
          style: MyTextTheme().largeBCN,
        ),
        const SizedBox(
          height: 20,
        ),
        // Column(
        //     children:[
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: MyCustomSD(
        //             decoration: BoxDecoration(
        //                 color: AppColor.white
        //             ),
        //             label: "Select Problems ",
        //             prefixIcon: Icons.local_activity,
        //             initialValue: const [
        //               {
        //                 'parameter': 'Id',
        //                 'value': 'problemName'
        //               }
        //             ],
        //             // labelStyle: MyTextTheme().mediumWCB,
        //             labelStyle: const TextStyle(
        //                 color: Colors.grey),
        //             primaryColor: Colors.grey,
        //             height: 150,
        //             backgroundColor:
        //             Colors.transparent,
        //             borderColor: Colors.grey,
        //             listToSearch: _mealPlanModel
        //                 .controller.knowMedProblemList,
        //             valFrom: 'problemName',
        //             onChanged: (val) {
        //               if (val != null) {
        //                 // callingCodeDetail.write(
        //                 //     "CountryCode", val);
        //                 // modal.controller.updateSelectedCallingId = val['Id'];
        //                 // // modal.controller.userIdC.text=callingCodeDetail.read("CountryCode")['CountryName'].toString();
        //               }
        //             }),
        //       ),
        //     ]
        // )
      ],
    );
  }
}

// class ageNumberPicker extends StatefulWidget {
//
//   @override
//   State<StatefulWidget> createState()=>_ageNumberPickerState();
//   }



// class _ageNumberPickerState extends State<ageNumberPicker> {
//
//   //final MealPlanModel _mealPlanModel=MealPlanModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           width: 60,
//           decoration: const BoxDecoration(color: Colors.white),
//           // child: NumberPicker(
//           //   value: _mealPlanModel.controller.age,
//           //   minValue: 0,
//           //   decoration:
//           //   BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//           //   itemCount: 5,
//           //   maxValue: 100,
//           //   onChanged: (value) => setState(() => _mealPlanModel.controller.age = value),
//           // ),
//         ),
//
//         // const MyButton(
//         //   width: 80,
//         //   title: 'Years',
//         //   color: Colors.green,
//         // )
//         //Text('Current value: $_currentValue'),
//       ],
//     );
//   }
// }

// class _heightNumberPicker extends StatefulWidget {
//
//   @override
//   State<StatefulWidget> createState() =>_heightNumberPickerState();
//   }
//
//
//
// class _heightNumberPickerState extends State<_heightNumberPicker> {
//
//   //final MealPlanModel _mealPlanModel=MealPlanModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           width: 60,
//           decoration: const BoxDecoration(color: Colors.white),
//           // child: NumberPicker(
//           //   value:  _mealPlanModel.controller.height,
//           //   minValue: 0,
//           //   decoration:
//           //   BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//           //   itemCount: 5,
//           //   maxValue: 500,
//           //   onChanged: (value) => setState(() => _mealPlanModel.controller.height = value),
//           // ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         const MyButton(
//           width: 80,
//           title: 'cm',
//           color: Colors.green,
//         )
//         //Text('Current value: $_currentValue'),
//       ],
//     );
//   }
// }


// class Weight extends StatefulWidget {
//   const Weight({Key? key}) : super(key: key);
//
//   @override
//   State<Weight> createState() => _WeightState();
// }
//
// class _WeightState extends State<Weight> {
//   //int _currentWeight = 170;
//   //final MealPlanModel _mealPlanModel=MealPlanModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//         width: 60,
//         decoration: const BoxDecoration(color: Colors.white),
//         // child: NumberPicker(
//         //   value: _mealPlanModel.controller.weight,
//         //   minValue: 0,
//         //   decoration:
//         //   BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//         //   itemCount: 5,
//         //   maxValue: 500,
//         //   onChanged: (value) => setState(() => _mealPlanModel.controller.weight = value),
//         // ),
//       );
//   }
// }





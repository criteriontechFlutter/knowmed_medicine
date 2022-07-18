
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideEffectCheckerController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/SideEffectChecker/sideeffectCheckerModal.dart';



class SideeffectCheckerPageView extends StatefulWidget {
  const SideeffectCheckerPageView({Key? key}) : super(key: key);

  @override
  _SideeffectCheckerPageViewState createState() => _SideeffectCheckerPageViewState();
}

class _SideeffectCheckerPageViewState extends State<SideeffectCheckerPageView>{


  SideeffectCheckerModal modal=SideeffectCheckerModal();

  bool noData = true;
 get()async{
   await modal.getMedicinesData(context);
   await modal.getAllSymptom(context);
 }


  @override
  void initState(){
    super.initState();
    get();
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
      color: Colors.grey,
        child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Side Effect Checker',
                  style: MyTextTheme().largeSCB.copyWith(
                      color: AppColor().text_blue
                  )
              ),
              backgroundColor: AppColor().grey_header,
            ),
        body: Column(
          children: [
            AnimatedContainer(duration: Duration(seconds: 4),
            height: 200,
            color: Colors.lightGreen,
            ),
          ],
        ),
        // body: Column(
        //     children: [
        //       Expanded(
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: GetBuilder(
        //             init:SideeffectCheckerController(),
        //             builder: (_) {
        //               return Stack(
        //                 children: [
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Expanded(child: Padding(
        //                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        //                         child: Container(
        //                           width:double.infinity,
        //                          // height: 200,
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(10),
        //                             border: Border.all(color: Colors.grey.shade300)
        //                           ),
        //
        //                           child: Column(
        //                             children: [
        //                               Padding(
        //                                 padding: const EdgeInsets.all(8.0),
        //                                 child: SizedBox(
        //                                   height:40,
        //                                   child: TextField(
        //                                     decoration:  InputDecoration(
        //                                         contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        //                                         enabled: true,
        //                                         enabledBorder:  OutlineInputBorder(
        //                                             borderSide: BorderSide(color: Colors.grey.shade300),
        //                                             borderRadius: const BorderRadius.all(Radius.circular(10))
        //                                         ),
        //                                         focusedBorder:  OutlineInputBorder(
        //                                             borderRadius: const BorderRadius.all(Radius.circular(10)),
        //                                             borderSide: BorderSide(color: Colors.grey.shade300)
        //                                         ),
        //                                         hintText: "Search Medicine",
        //                                         hintStyle: TextStyle(color: Colors.grey.shade400)
        //                                     ),
        //                                     controller: modal.controller.medicineC.value,
        //                                     onChanged: (val){
        //                                       setState((){});
        //                                     },
        //                                   ),
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: const EdgeInsets.fromLTRB(8,8,8,0),
        //                                 child: Row(
        //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     Text("Selected Medicines",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
        //                                     InkWell(
        //                                       child: Container(
        //                                         child: Row(
        //                                           children: [
        //                                             Icon(CupertinoIcons.clear_circled,color: Colors.grey.shade400,size: 20,),
        //                                             Padding(
        //                                               padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //                                               child: Text("Clear all",style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
        //                                             )
        //                                           ],
        //                                         ),
        //                                         //width: MediaQuery.of(context).size.width * 0.2,
        //                                         width: 100,
        //                                         decoration: BoxDecoration(
        //                                           border: Border.all(color: Colors.grey.shade300),
        //                                           borderRadius: BorderRadius.circular(5),
        //                                           color: Colors.grey.shade200
        //                                         ),
        //                                         padding: EdgeInsets.all(4),
        //                                       ),
        //                                       onTap: (){
        //                                         setState((){
        //                                           modal.controller.addedMedicine.clear();
        //                                         });
        //                                       },
        //                                     )
        //                                   ],
        //                                 ),
        //                               ),
        //                               Divider(thickness: 1,color: Colors.grey.shade300,),
        //                               Expanded(
        //                                 child: ListView.separated(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),shrinkWrap: true,itemBuilder: (BuildContext context, int index){
        //                                   return Container(
        //                                     padding: EdgeInsets.all(10),
        //                                     decoration: BoxDecoration(
        //                                       borderRadius: BorderRadius.circular(10),
        //                                       border: Border.all(color: Colors.grey.shade300)
        //                                     ),
        //                                     child: Column(
        //                                       children: [
        //                                         Row(
        //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                           children: [
        //                                             Flexible(child: Text(modal.controller.addedMedicine[index].toString(),style: TextStyle(color: Colors.indigo.shade700,fontWeight: FontWeight.bold),overflow: TextOverflow.fade,)),
        //                                             InkWell(onTap: (){
        //                                               setState((){
        //                                                 modal.controller.addedMedicine.remove(modal.controller.addedMedicine[index]);
        //                                               });
        //                                             },child: Icon(Icons.delete,size: 20,color: Colors.grey.shade500,)),
        //                                           ],
        //                                         ),
        //                                         SizedBox(height: 10,),
        //                                        // Text(modal.controller.addedDescription[index].toString(),overflow: TextOverflow.clip,),
        //                                       ],
        //                                     ),
        //                                   );
        //                                 },
        //                                     separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 15,),
        //                                     itemCount: modal.controller.addedMedicine.length),
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),),
        //                       Expanded(child: Padding(
        //                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        //                         child: Container(
        //                           width:double.infinity,
        //                          // height: 200,
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(10),
        //                               border: Border.all(color: Colors.grey.shade300)
        //                           ),
        //
        //                           child: Column(
        //                             children: [
        //                               Padding(
        //                                 padding: const EdgeInsets.all(8.0),
        //                                 child: SizedBox(
        //                                   height:40,
        //                                   child: TextField(
        //                                     decoration:  InputDecoration(
        //                                         contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        //                                         enabled: true,
        //                                         enabledBorder:  OutlineInputBorder(
        //                                             borderSide: BorderSide(color: Colors.grey.shade300),
        //                                             borderRadius: const BorderRadius.all(Radius.circular(10))
        //                                         ),
        //                                         focusedBorder:  OutlineInputBorder(
        //                                             borderRadius: const BorderRadius.all(Radius.circular(10)),
        //                                             borderSide: BorderSide(color: Colors.grey.shade300)
        //                                         ),
        //                                         hintText: "Search Symptoms",
        //                                         hintStyle: TextStyle(color: Colors.grey.shade400)
        //                                     ),
        //                                     controller: modal.controller.symptomC.value,
        //                                     onChanged: (val){
        //                                       setState((){});
        //                                     },
        //                                   ),
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: const EdgeInsets.fromLTRB(8,8,8,0),
        //                                 child: Row(
        //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     Text("Selected Symptoms",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
        //                                     InkWell(
        //                                       child: Container(
        //                                         child: Row(
        //                                           children: [
        //                                             Icon(CupertinoIcons.clear_circled,color: Colors.grey.shade400,size: 20,),
        //                                             Padding(
        //                                               padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //                                               child: Text("Clear all",style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
        //                                             )
        //                                           ],
        //                                         ),
        //                                         //width: MediaQuery.of(context).size.width * 0.2,
        //                                         width: 100,
        //                                         decoration: BoxDecoration(
        //                                             border: Border.all(color: Colors.grey.shade300),
        //                                             borderRadius: BorderRadius.circular(5),
        //                                             color: Colors.grey.shade200
        //                                         ),
        //                                         padding: EdgeInsets.all(4),
        //                                       ),
        //                                       onTap: (){
        //                                         setState((){
        //                                           modal.controller.addedSymptoms.clear();
        //                                         });
        //                                       },
        //                                     )
        //                                   ],
        //                                 ),
        //                               ),
        //                               Divider(thickness: 1,color: Colors.grey.shade300,),
        //                               Expanded(
        //                                 child: ListView.separated(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),shrinkWrap: true,itemBuilder: (BuildContext context, int index){
        //                                   return Container(
        //                                     padding: EdgeInsets.all(10),
        //                                     decoration: BoxDecoration(
        //                                         borderRadius: BorderRadius.circular(10),
        //                                         border: Border.all(color: Colors.grey.shade300)
        //                                     ),
        //                                     child: Column(
        //                                       children: [
        //                                         Row(
        //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                           children: [
        //                                             Flexible(child: Text(modal.controller.addedSymptoms[index].toString(),style: TextStyle(color: Colors.indigo.shade700,fontWeight: FontWeight.bold),overflow: TextOverflow.fade,)),
        //                                             InkWell(onTap: (){
        //                                               setState((){
        //                                                 modal.controller.addedSymptoms.remove(modal.controller.addedSymptoms[index]);
        //                                               });
        //                                             },child: Icon(Icons.delete,size: 20,color: Colors.grey.shade500,)),
        //                                           ],
        //                                         ),
        //                                         SizedBox(height: 10,),
        //                                         // Text(modal.controller.addedDescription[index].toString(),overflow: TextOverflow.clip,),
        //                                       ],
        //                                     ),
        //                                   );
        //                                 },
        //                                     separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 15,),
        //                                     itemCount: modal.controller.addedSymptoms.length),
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),),
        //
        //                       // Expanded(
        //                       //   child:  interactionCheckerPart(context),),
        //                       Container(
        //                         height: 40,
        //                         decoration: BoxDecoration(
        //                           gradient: LinearGradient(colors: [
        //                             AppColor().red,
        //                             AppColor().red
        //                           ],
        //                               begin: Alignment.bottomLeft,
        //                               end: Alignment.centerRight
        //                           ),
        //                           borderRadius: const BorderRadius.only(
        //                             topLeft:Radius.circular(10),
        //                             bottomLeft: Radius.circular(10),
        //                             bottomRight: Radius.circular(10),
        //                             topRight: Radius.circular(10),
        //                           ),
        //                         ),
        //                         child: Center(
        //                           child: MyButton(
        //                             color: AppColor().brownText,
        //                             title: 'Check Side Effects',
        //                             onPress: ()async{
        //                               await modal.checkSideeffect(context);
        //                             },
        //
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Column(
        //                     children: [
        //                       SizedBox(height: 65,),
        //                       Column(
        //                         children: [
        //                           AnimatedContainer(
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(15),
        //                               //color: Colors.blueGrey.shade200,
        //                               color: AppColor().white,
        //                               border:
        //                               Border.all(
        //                                   color: AppColor().greyLight
        //                               ),
        //                             ),
        //                             height: modal.controller.medicineC.value.text == "" ? 0 : MediaQuery.of(context).size.height * 0.7,
        //                             duration: const Duration(milliseconds: 280),
        //                             child: (modal.controller.getMedicineCheckerData.isEmpty == true)
        //                                 ? Container(
        //                               width: 310,
        //                               //height:100,
        //                               child: const Center(
        //                                 child: Text(
        //                                   "Please wait...",
        //                                   textAlign: TextAlign.center,
        //                                   style: TextStyle(
        //                                       fontSize: 20,
        //                                       fontWeight: FontWeight.bold,
        //                                       color: Colors.black),
        //                                 ),
        //                               ),
        //                             )
        //                                 : ListView.separated(
        //                                 itemBuilder: (BuildContext context, int index) {
        //                                   return InkWell(
        //                                     onTap: () {
        //                                       noData = true;
        //                                       setState(() {
        //                                         modal.controller.medicineName = modal.controller.getMedicineCheckerData[index].medicineName.toString();
        //                                         //setting the controller name to cityname
        //                                         //model.controller.searchC.value.text = model.controller.getInteractionCheckerData[index].medicineName.toString();
        //                                         if(modal.controller.addedMedicine.contains(modal.controller.getMedicineCheckerData[index].medicineName.toString())){
        //                                           alertToast(context, "Medicine already selected");
        //                                         }
        //                                         else{
        //                                           modal.controller.addedMedicine.add(modal.controller.getMedicineCheckerData[index].medicineName.toString());
        //                                           //modal.controller.addedDescription.add(modal.controller.getInteractionCheckerData[index].description.toString());
        //                                           modal.controller.addedMedicineId.add(modal.controller.getMedicineCheckerData[index].id);
        //                                           print("id: ------------------"+modal.controller.addedMedicineId.toString());
        //                                         }
        //
        //                                         modal.controller.update();
        //                                         modal.controller.medicineC.value.clear();
        //                                         //adding the city name to cityName String
        //                                       });
        //
        //                                     },
        //                                     child: Container(
        //                                       decoration: const BoxDecoration(
        //                                         color: Colors.white,
        //                                         borderRadius:
        //                                         const BorderRadius.all(Radius.circular(10)),
        //                                       ),
        //                                       child: Padding(
        //                                         padding: const EdgeInsets.all(13),
        //                                         child: Text(
        //                                           modal.controller.getMedicineCheckerData[index].medicineName.toString(),
        //                                           style: const TextStyle(
        //                                               fontSize: 15,
        //                                               fontWeight: FontWeight.w400),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   );
        //                                 },
        //                                 separatorBuilder:
        //                                     (BuildContext context, int index) => const Divider(
        //                                         color: Colors.grey,
        //                                       thickness: 1,
        //                                     ),
        //                                 itemCount: modal.controller.getMedicineCheckerData.length),
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                   Column(
        //                     children: [
        //
        //                       SizedBox(height: 380,),
        //                       Column(
        //                         children: [
        //                           AnimatedContainer(
        //                               decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(15),
        //                               //color: Colors.blueGrey.shade200,
        //                               color: AppColor().white,
        //                               border:
        //                               Border.all(
        //                                   color: AppColor().greyLight
        //                               ),
        //                             ),
        //                             height: modal.controller.symptomC.value.text == "" ? 0 : MediaQuery.of(context).size.height * 0.7,
        //                             duration: const Duration(milliseconds: 280),
        //                             child: (modal.controller.getSymptomCheckerData.isEmpty == true)
        //                                 ? Container(
        //                               width: 310,
        //                               //height:100,
        //                               child: const Center(
        //                                 child: Text(
        //                                   "Please wait...",
        //                                   textAlign: TextAlign.center,
        //                                   style: TextStyle(
        //                                       fontSize: 20,
        //                                       fontWeight: FontWeight.bold,
        //                                       color: Colors.black),
        //                                 ),
        //                               ),
        //                             )
        //                                 : ListView.separated(
        //                                 itemBuilder: (BuildContext context, int index) {
        //                                   return InkWell(
        //                                     onTap: () {
        //                                       noData = true;
        //                                       setState(() {
        //                                         modal.controller.SymptomName = modal.controller.getSymptomCheckerData[index].problemName.toString();
        //                                         //setting the controller name to cityname
        //                                         //model.controller.searchC.value.text = model.controller.getInteractionCheckerData[index].medicineName.toString();
        //                                         if(modal.controller.addedSymptoms.contains(modal.controller.getSymptomCheckerData[index].problemName.toString())){
        //                                           alertToast(context, "Symptom already selected");
        //                                         }
        //                                         else{
        //                                           modal.controller.addedSymptoms.add(modal.controller.getSymptomCheckerData[index].problemName.toString());
        //                                           //modal.controller.addedDescription.add(modal.controller.getInteractionCheckerData[index].description.toString());
        //                                           modal.controller.addedSymptomId.add(modal.controller.getSymptomCheckerData[index].id);
        //                                           print("id: ------------------"+modal.controller.addedSymptomId.toString());
        //                                         }
        //
        //                                         modal.controller.update();
        //                                         modal.controller.symptomC.value.clear();
        //                                         //adding the city name to cityName String
        //                                       });
        //
        //                                     },
        //                                     child: Container(
        //                                       decoration: const BoxDecoration(
        //                                         color: Colors.white,
        //                                         borderRadius:
        //                                         const BorderRadius.all(Radius.circular(10)),
        //                                       ),
        //                                       child: Padding(
        //                                         padding: const EdgeInsets.all(13),
        //                                         child: Text(
        //                                           modal.controller.getSymptomCheckerData[index].problemName.toString(),
        //                                           style: const TextStyle(
        //                                               fontSize: 15,
        //                                               fontWeight: FontWeight.w400),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   );
        //                                 },
        //                                 separatorBuilder:
        //                                     (BuildContext context, int index) => const Divider(
        //                                   color: Colors.grey,
        //                                   thickness: 1,
        //                                 ),
        //                                 itemCount: modal.controller.getSymptomCheckerData.length),
        //                           ),
        //                           Container(color: Colors.amber,height:240,child: Text("flutter")),
        //                         ],
        //                       ),
        //
        //                     ],
        //                   ),
        //
        //                 ],
        //               );
        //             }
        //           ),
        //         ),
        //       ),
        //     ]
        // )
        )
        )
    );
  }
}

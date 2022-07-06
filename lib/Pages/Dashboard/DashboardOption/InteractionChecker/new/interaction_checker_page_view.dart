
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'interactionCheckerController.dart';
import 'interactionCheckerModal.dart';


class InteractionCheckerPageView extends StatefulWidget {
  const InteractionCheckerPageView({Key? key}) : super(key: key);

  @override
  _InteractionCheckerPageViewState createState() => _InteractionCheckerPageViewState();
}

class _InteractionCheckerPageViewState extends State<InteractionCheckerPageView>{


  InteractionCheckerModal modal=InteractionCheckerModal();

  bool noData = true;
 get()async{
   await modal.getInteractionsData(context);
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
    Get.delete<InteractionCheckerController>();
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
                      return Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Enter a drug, OTC or herbal supplement',
                                style: MyTextTheme().smallGCN,),
                              SizedBox(height: 10,),
                              SizedBox(
                                height:40,
                                child: TextField(
                                  decoration:  InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                                      enabled: true,
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade300),
                                          borderRadius: const BorderRadius.all(Radius.circular(10))
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide(color: Colors.grey.shade300)
                                      ),
                                      hintText: "Search Medicine",
                                      hintStyle: TextStyle(color: Colors.grey.shade400)
                                  ),
                                  controller: modal.controller.searchC.value,
                                  onChanged: (val){
                                    setState((){});
                                  },
                                ),
                              ),
                              Expanded(child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width:double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey.shade300)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,8,8,0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Selected Medicines",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                                            InkWell(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Icon(CupertinoIcons.clear_circled,color: Colors.grey.shade400,size: 20,),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                      child: Text("Clear all",style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                                                    )
                                                  ],
                                                ),
                                                //width: MediaQuery.of(context).size.width * 0.2,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey.shade300),
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.grey.shade200
                                                ),
                                                padding: EdgeInsets.all(4),
                                              ),
                                              onTap: (){
                                                setState((){
                                                  modal.controller.addedMedicine.clear();
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 1,color: Colors.grey.shade300,),
                                      Expanded(
                                        child: ListView.separated(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),shrinkWrap: true,itemBuilder: (BuildContext context, int index){
                                          return Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: Colors.grey.shade300)
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Flexible(child: Text(modal.controller.addedMedicine[index].toString(),style: TextStyle(color: Colors.indigo.shade700,fontWeight: FontWeight.bold),overflow: TextOverflow.fade,)),
                                                    InkWell(onTap: (){
                                                      setState((){
                                                        modal.controller.addedMedicine.remove(modal.controller.addedMedicine[index]);
                                                      });
                                                    },child: Icon(Icons.delete,size: 20,color: Colors.grey.shade500,)),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                               // Text(modal.controller.addedDescription[index].toString(),overflow: TextOverflow.clip,),
                                              ],
                                            ),
                                          );
                                        },
                                            separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 15,),
                                            itemCount: modal.controller.addedMedicine.length),
                                      )
                                    ],
                                  ),
                                ),
                              ),),

                              // Expanded(
                              //   child:  interactionCheckerPart(context),),

                              Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Colors.orange,
                                    Colors.orange
                                  ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.centerRight
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft:Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: MyButton(
                                    color: Colors.orangeAccent,
                                    title: 'Check Interaction',
                                    onPress: ()async{
                                      await modal.checkInteraction(context);
                                    },

                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 65,),
                              Column(
                                children: [
                                  AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      //color: Colors.blueGrey.shade200,
                                      color: AppColor().white,
                                      border:
                                      Border.all(
                                          color: AppColor().greyLight
                                      ),
                                    ),
                                    height: modal.controller.searchC.value.text == "" ? 0 : MediaQuery.of(context).size.height * 0.7,
                                    duration: const Duration(milliseconds: 280),
                                    child: (modal.controller.getInteractionCheckerData.isEmpty == true)
                                        ? Container(
                                      width: 310,
                                      child: const Center(
                                        child: Text(
                                          "Please wait...",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                        : ListView.separated(
                                        itemBuilder: (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              noData = true;
                                              setState(() {
                                                modal.controller.medicineName = modal.controller.getInteractionCheckerData[index].medicineName.toString();
                                                //setting the controller name to cityname
                                                //model.controller.searchC.value.text = model.controller.getInteractionCheckerData[index].medicineName.toString();
                                                if(modal.controller.addedMedicine.contains(modal.controller.getInteractionCheckerData[index].medicineName.toString())){
                                                  alertToast(context, "Medicine already selected");
                                                }
                                                else{
                                                  modal.controller.addedMedicine.add(modal.controller.getInteractionCheckerData[index].medicineName.toString());
                                                  //modal.controller.addedDescription.add(modal.controller.getInteractionCheckerData[index].description.toString());
                                                  modal.controller.addedMedicineId.add(modal.controller.getInteractionCheckerData[index].id);
                                                  print("id: ------------------"+modal.controller.addedMedicineId.toString());
                                                }

                                                modal.controller.update();
                                                modal.controller.searchC.value.clear();
                                                //adding the city name to cityName String
                                              });

                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                const BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Text(
                                                  modal.controller.getInteractionCheckerData[index].medicineName.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) => const Divider(
                                                color: Colors.grey,
                                              thickness: 1,
                                            ),
                                        itemCount: modal.controller.getInteractionCheckerData.length),
                                  ),
                                ],
                              ),
                            ],
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
  List medicineAdded = [];
  bool noData = true;
  return GetBuilder(
    init: InteractionCheckerController(),
    builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // SizedBox(height: 10,),
              // SizedBox(height: 40,),
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: TextField(
              //     controller: modal.controller.searchC.value,
              //     onChanged: (val){
              //       //setState((){});
              //     },
              //   ),
              // ),
              // AnimatedContainer(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     color: Colors.blueGrey.shade200,
              //   ),
              //   height: modal.controller.searchC.value.text == "" ? 0 : 170,
              //   duration: Duration(milliseconds: 280),
              //   child: (modal.controller.getInteractionCheckerData.isEmpty == true)
              //       ? Container(
              //     width: 310,
              //     child: const Center(
              //       child: Text(
              //         "No Data Found",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //     ),
              //   )
              //       : ListView.separated(
              //       itemBuilder: (BuildContext context, int index) {
              //         return InkWell(
              //           onTap: () {
              //             noData = true;
              //             // setState(() {
              //             //
              //             //   //adding the city name to cityName String
              //             //
              //             // });
              //             modal.controller.medicineName = modal.controller.getInteractionCheckerData[index].medicineName.toString();
              //             //setting the controller name to cityname
              //             //model.controller.searchC.value.text = model.controller.getInteractionCheckerData[index].medicineName.toString();
              //             modal.controller.addedMedicine.add(modal.controller.getInteractionCheckerData[index].medicineName.toString());
              //             modal.controller.update();
              //             modal.controller.searchC.value.clear();
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius:
              //               BorderRadius.all(Radius.circular(10)),
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.all(13),
              //               child: Text(
              //                 modal.controller.getInteractionCheckerData[index].medicineName.toString(),
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //       separatorBuilder:
              //           (BuildContext context, int index) => SizedBox(
              //         height: 5,
              //       ),
              //       itemCount: modal.controller.getInteractionCheckerData.length),
              // ),
              // MyTextField2(
              //   controller:modal.controller.medicineC.value,
              //   searchedList:modal.controller.getAllMedicineList,
              //   onTap: (){
              //     modal.controller.update();
              //   },
              //   showSearchedList:modal.controller.medicineC.value.text!='',
              //   searchParam: 'medicineName',
              //
              //   onTapSearchedData: (val){
              //     if(val!=null ){
              //       print(val.toString());
              //       modal.controller.medicineId=val['medicineID'];
              //       modal.controller.onTapTest(val);
              //       //print(modal.controller.testID.value.toString());
              //       //FocusManager.instance.primaryFocus?.unfocus();
              //       modal.controller.update();
              //     }
              //   },
              //   onChanged: (val) async {
              //     print('this is value'+val.toString());
              //     if(val.toString().isNotEmpty) {
              //      await modal.getInteractionsData(context);
              //
              //     }
              //     else{
              //       modal.controller.updateAllMedicineList=[];
              //       modal.controller.update();
              //     }
              //     modal.controller.update();
              //   },
              // ),
              const SizedBox(height: 15,),
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
                          color: Colors.white,
                          border:
                          Border.all(
                              color: Colors.grey.shade300
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
                                            color: Colors.grey.shade300,
                                            border:
                                            Border.all(
                                                color: Colors.grey.shade300
                                            ),
                                            borderRadius: const BorderRadius.all(const Radius.circular(10))
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
                                                      const SizedBox(width: 5,),
                                                      Text('Clear all',
                                                        style: MyTextTheme().smallBCN,),
                                                    ]
                                                ),
                                              ]
                                          )
                                      ),


                                    )

                                  ],
                                ),
                                const SizedBox(height: 2),
                                Divider(color: Colors.grey.shade300),
                                const SizedBox(height: 10),
                                const SizedBox(
                                  height: 20,
                                ),
                              /*  Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: Text(
                                                      medicineAdded[index].toString(),
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ),
                                                 /* InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          //for deleting the cities from the list
                                                          if (medicineAdded
                                                              .contains(medicineAdded[index])) {
                                                            medicineAdded
                                                                .remove(medicineAdded[index]);
                                                            print("list after deleting: " +
                                                                medicineAdded.toString());
                                                          }
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color: Colors.red,
                                                      ))*/
                                                ],
                                              ),
                                            ));
                                      },
                                      separatorBuilder: (BuildContext context, int index) =>
                                          SizedBox(
                                            height: 10,
                                          ),
                                      itemCount: medicineAdded.length),
                                )*/
                                //Text(modal.controller.addedMedicine.length.toString())

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
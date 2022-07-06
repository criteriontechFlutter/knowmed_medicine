
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/AlertDialogue.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/deficiencyCheckerController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DeficiencyChecker/deficiencyCheckerModal.dart';


class DeficencyCheckerPageView extends StatefulWidget {
  const DeficencyCheckerPageView({Key? key}) : super(key: key);

  @override
  _DeficencyCheckerPageViewState createState() => _DeficencyCheckerPageViewState();
}

class _DeficencyCheckerPageViewState extends State<DeficencyCheckerPageView>{


  DificiencyCheckerModal modal=DificiencyCheckerModal();

  bool noData = true;
 get()async{
   await modal.getSymptomsData(context);
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
    Get.delete<DificiencyCheckerController>();
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
              title: Text('Deficiency Checker',
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
                    init:DificiencyCheckerController(),
                    builder: (_) {
                      return Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                      hintText: "Search and add symptoms",
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
                                            Text("Selected Problems",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
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
                                                  modal.controller.addedSymptom.clear();
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
                                                    Flexible(child: Text(modal.controller.addedSymptom[index].toString(),style: TextStyle(color: Colors.indigo.shade700,fontWeight: FontWeight.bold),overflow: TextOverflow.fade,)),
                                                    InkWell(onTap: (){
                                                      setState((){
                                                        modal.controller.addedSymptom.remove(modal.controller.addedSymptom[index]);
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
                                            itemCount: modal.controller.addedSymptom.length),
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
                                    Colors.red,
                                    Colors.red
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
                                    color: Colors.red,
                                    title: 'Check Deficiency',
                                    onPress: ()async{
                                      await modal.checkDeficiency(context);
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
                                    child: (modal.controller.getSymptomCheckerData.isEmpty == true)
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
                                                modal.controller.symptomName = modal.controller.getSymptomCheckerData[index].problemName.toString();
                                                //setting the controller name to cityname
                                                //model.controller.searchC.value.text = model.controller.getInteractionCheckerData[index].medicineName.toString();
                                                if(modal.controller.addedSymptom.contains(modal.controller.getSymptomCheckerData[index].problemName.toString())){
                                                  alertToast(context, "Symptom already selected");
                                                }
                                                else{
                                                  modal.controller.addedSymptom.add(modal.controller.getSymptomCheckerData[index].problemName.toString());
                                                  //modal.controller.addedDescription.add(modal.controller.getInteractionCheckerData[index].description.toString());
                                                  modal.controller.addedSymptomId.add(modal.controller.getSymptomCheckerData[index].id);
                                                  print("id: ------------------"+modal.controller.addedSymptomId.toString());
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
                                                  modal.controller.getSymptomCheckerData[index].problemName.toString(),
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
                                        itemCount: modal.controller.getSymptomCheckerData.length),
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

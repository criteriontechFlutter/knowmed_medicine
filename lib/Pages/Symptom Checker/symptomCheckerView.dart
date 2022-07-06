import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/MyTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/Pages/Symptom%20Checker/animation.dart';
import 'package:knowmed/Widgets/NavigationDrawerWidget.dart';

import '../../AppManager/appUtils.dart';
import 'symptomCheckerController.dart';
import 'symptomCheckerModal.dart';

class SymptomCheckerView extends StatefulWidget {
  const SymptomCheckerView({Key? key}) : super(key: key);

  @override
  State<SymptomCheckerView> createState() => _SymptomCheckerViewState();
}

class _SymptomCheckerViewState extends State<SymptomCheckerView> {

  SymptomCheckerModal modal=SymptomCheckerModal();

  String cache='Metric';
  String gender="male";

  @override
  void dispose() {
    Get.delete<SymptomCheckerController>();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
      child: ColoredSafeArea(
        child: Scaffold(
          drawer: NavigationDrawerWidget(),
          backgroundColor: AppColor().white,
          appBar: AppBar(
            backgroundColor: AppColor().grey_header,
            title: Text("Symptom Checker",style: MyTextTheme().largeWCB.copyWith(color: Colors.indigo.shade900)),
          ),
          body: GetBuilder(
            init:SymptomCheckerController(),
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                            CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColor().blue,
                              child: Text((index+1).toString()),
                          ),
                              Visibility(
                                visible:index == 4?false:true,
                                child: Container(
                                  height: 5,width: 35,
                                  decoration: BoxDecoration(
                                    color: AppColor().green
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Expanded(flex: 9,child:SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8),
                          child: Divider(
                            color: AppColor().greyLight,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Align(child: Text('Age*',style: MyTextTheme().smallBCB,),alignment: Alignment.topLeft,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: MyTextField2(
                                  controller:modal.controller.ageC.value,
                                  keyboardType: TextInputType.number,

                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: MyCustomSD(
                                  menuMode: false,
                                  height: 100,
                                  listToSearch: modal.controller.abc,
                                  valFrom: 'name',
                                  hideSearch: true,
                                  onChanged: (value) {
                                    if(value!=null){
                                      modal.controller.updateModule=value['id'];
                                      print('faheem'+ modal.controller.module.toString());

                                    }
                                  },

                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,bottom: 8),
                          child: Align(child: Text('Gender*',style: MyTextTheme().smallBCB,),alignment: Alignment.topLeft,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      gender='male';
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: AppColor().grey)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 12,
                                                backgroundColor: gender=='male'?AppColor().blue:AppColor().grey ,
                                                child:  Icon(Icons.check,color: gender=="male"?AppColor().white:AppColor().grey,size: 18,),
                                              ),
                                              const SizedBox(width: 5,),
                                              Text('Male',style: MyTextTheme().smallBCN,),
                                            ],
                                          ),
                                          const SizedBox(width: 70,),
                                          Icon(Icons.male_outlined,color: AppColor().blue,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  gender="female";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColor().grey)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundColor: gender=='male'?AppColor().grey:AppColor().blue,
                                            child: Icon(Icons.check,color: gender=="male"?AppColor().grey:AppColor().white,size: 18,),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text('Female',style: MyTextTheme().smallBCN,),
                                        ],
                                      ),
                                      const SizedBox(width: 70,),
                                      Icon(Icons.female_sharp,color: AppColor().blue,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],),

                        Padding(
                          padding: const EdgeInsets.only(right: 15,top: 12,bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,),
                                child: Text("Optional",style: MyTextTheme().mediumBCN,),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        cache="Metric";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: cache == "Metric"?Colors.orange:Colors.white,
                                        borderRadius:  const BorderRadius.only(topLeft:Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        border: Border.all(color: AppColor().grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5,),
                                        child: Text("Metric",style: MyTextTheme().smallBCN,),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        cache="Imperial";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: cache=="Imperial"?Colors.orange:Colors.white,
                                        borderRadius:  const BorderRadius.only(topRight:Radius.circular(5),bottomRight: Radius.circular(5)),
                                        border: Border.all(color: AppColor().grey),

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5,),
                                        child: Text("Imperial",style: MyTextTheme().smallBCN,),
                                      ),
                                    ),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                        Align(child: Padding(
                          padding: const EdgeInsets.only(left: 8,bottom: 5),
                          child: Text("Height",style: MyTextTheme().smallBCB,),
                        ),alignment: Alignment.topLeft,),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: cache=="Metric"?MyTextField2(
                              hintText: "cm",
                              controller: modal.controller.heightC.value,
                              keyboardType: TextInputType.number,
                            ):Row(
                              children: [
                                Expanded(child: MyTextField2(
                                  hintText: "fit",
                                  controller: modal.controller.fitC.value,
                                  keyboardType: TextInputType.number,
                                )),
                                const SizedBox(width: 10,),
                                Expanded(child: MyTextField2(
                                  hintText: "inch",
                                  controller: modal.controller.inchC.value,
                                  keyboardType: TextInputType.number,
                                )),
                              ],
                            )
                        ),
                        Align(child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                          child: Text("Weight*",style: MyTextTheme().smallBCB,),
                        ),alignment: Alignment.topLeft,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cache=="Metric"?MyTextField2(
                            hintText: "kg",
                            controller: modal.controller.kgC.value,
                            keyboardType: TextInputType.number,
                            onChanged: (val)async{
                              await modal.controller.metricFormula(context);
                            },
                          ): MyTextField2(
                            hintText: "lbs",
                            controller: modal.controller.lbsC.value,
                            keyboardType: TextInputType.number,
                            onChanged: (val)async{
                              await modal.controller.imperialFormula(context);
                            },
                          ),
                        ),
                        Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Person_icon_BLACK-01.svg/451px-Person_icon_BLACK-01.svg.png',scale: 11,),
                        const Icon(Icons.keyboard_arrow_down),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,8,0),
                          child: Row(
                            children: [
                              Expanded(
                                flex:4,
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: AppColor().blue
                                  ),
                                ),
                              ),
                              Container(
                                height: 13,width: 1,
                                color: Colors.blue,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: AppColor().green
                                  ),
                                ),
                              ),
                              Container(
                                height: 13,width: 1,
                                color: Colors.green,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: AppColor().orange
                                  ),
                                ),
                              ),
                              Container(
                                height: 13,width: 1,
                                color: Colors.orange,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: AppColor().red
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex:5,
                                child: Text("18.5",style:MyTextTheme().smallBCN,textAlign: TextAlign.end,),
                              ),

                              Expanded(
                                flex: 2,
                                child:Text("25",style:MyTextTheme().smallBCN,textAlign: TextAlign.end,)
                              ),

                              Expanded(
                                flex: 2,
                                child: Text("30",style:MyTextTheme().smallBCN,textAlign: TextAlign.end,)
                              ),
                              Container(
                                height: 13,width: 1,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: AppColor().white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 15,width: 15,
                                    decoration: BoxDecoration(
                                        color: AppColor().blue
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                   Text('Underweight',style: MyTextTheme().smallBCN,)
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 15,width: 15,
                                    decoration: BoxDecoration(
                                        color: AppColor().green
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                   Text('Normal',style: MyTextTheme().smallBCN)
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 15,width: 15,
                                    decoration: BoxDecoration(
                                        color: AppColor().orange
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  Text('Overweight',style: MyTextTheme().smallBCN)
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 15,width: 15,
                                    decoration: BoxDecoration(
                                        color: AppColor().red
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  Text('Obese',style: MyTextTheme().smallBCN)
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),








                        Text("BMI: "+modal.controller.bmi.toStringAsFixed(3),style: MyTextTheme().mediumBCB),



                      ],
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Divider(
                      thickness: 1,
                      color: AppColor().greyLight,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,8,15,8),
                    child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  AppColor().grey,
                                  AppColor().grey
                                ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.centerRight
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft:Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: MyButton(
                                  color: AppColor().white,
                                  title: 'Clear',
                                  onPress: ()async{
                                    //await modal.onPressedLogin(context);

                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                  AppColor().red,
                                  AppColor().red
                                ],
                                    // begin: Alignment.bottomLeft,
                                    // end: Alignment.centerRight
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft:Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: MyButton(
                                  color: AppColor().white,
                                  title: 'Proceed',
                                  onPress: ()async{
                                    await showAlert(context,);
                                  },


                                  //onPress: onPressedRegistration,
                                ),
                              ),
                            ),
                          ),

                        ]
                    ),
                  )

                ],
              );
            }
          ),
        ),
      ),
    );
  }
}


showAlert(BuildContext context) {

  //RegistrationModal modal=RegistrationModal();
  //RegistrationModal modal=RegistrationModal();
  // set up the AlertDialog

  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, snapshot) {
            return AlertDialog(
              // contentPadding: EdgeInsets.zero,
              // actionsPadding: EdgeInsets.zero,
              // buttonPadding: EdgeInsets.zero,
              // insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),

              backgroundColor: AppColor().white,
              title: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            //modal.controller.otpController.value.clear();
                            Navigator.pop(context);
                          },
                          child: Icon((Icons.close),color: AppColor().black,size: 25,)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child:Image.asset("assets/anim_image.png",scale: 8,color: AppColor().orange,),
                      ),

                     Divider(
                       thickness: 5,
                       color: AppColor().red,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 20.0,bottom: 10,left: 10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Do you have symptom related related to ',style: MyTextTheme().smallBCN,),
                           Text('Specific body part?',style: MyTextTheme().smallBCB,),
                           const SizedBox(height: 10,),
                           Row(
                             children: [
                               Container(
                                   width:60,
                                   decoration: BoxDecoration(
                                     color:Colors.blue,
                                     borderRadius: BorderRadius.circular(20)

                                   ),
                                   child:  MyButton(title:'Yes',
                                     onPress: (){
                                       App().navigate(context, const MealPlan());
                                     },
                                   )),
                               Padding(
                                 padding: const EdgeInsets.only(left: 12.0,),
                                 child: Container(
                                     width:60,
                                     decoration: BoxDecoration(
                                       color:Colors.red,
                                       borderRadius: BorderRadius.circular(20)

                                     ),
                                     child:  MyButton(title: 'No',
                                     onPress: (){
                                       Navigator.pop(context);
                                     },)),
                               ),
                             ],
                           ),





                         ],
                       ),
                     ),

                    ],
                  ),
                ),


              ],
            ),
              // content: Text("This is my message."),
            );
          }
      );
    },
  );
}
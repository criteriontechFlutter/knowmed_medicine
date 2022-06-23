


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/Button.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/MedicalTerminology/medical_term_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/MedicalTerminology/medical_terminology_Modal.dart';
import 'package:knowmed/Pages/Forgot%20Password/forgetModal.dart';
import 'package:knowmed/Pages/Registration/registration_Controller.dart';



MedicalTermView(BuildContext context,MedicalTerminologyDataModal medicineData) {

  ForgetModal modal=ForgetModal();
  final int index;
  MedicalTermModal medical_Modal=MedicalTermModal();


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
              title:GetBuilder(
                  init: RegistrationController(),
                  builder: (_) {
                   // MedicalTerminologyDataModal medicineData= medical_Modal.controller.getMedicalTermAlphabet[widget.index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(medicineData.term.toString(),style: MyTextTheme().mediumBCB,),
                             // Text('Abdominal Cavity',style: MyTextTheme().mediumBCB,),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Icon((Icons.close),color: AppColor().black,size: 25,)),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           // height: 200,
                            width: 250,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child:Text('Meaning',
                                    style: MyTextTheme().smallBLCB,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child:Text(medicineData.definition.toString(),
                                    style: MyTextTheme().smallBCN,),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(1,8,8,8,),
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              AppColor().greyLight,
                                              AppColor().greyLight
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
                                              color: AppColor().black,
                                              title: 'Close',
                                             onPress: ()async{
                                               Navigator.pop(context);

                                             },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                      ],

                    );
                  }
              ),
              // content: Text("This is my message."),

            );
          }
      );
    },
  );
}


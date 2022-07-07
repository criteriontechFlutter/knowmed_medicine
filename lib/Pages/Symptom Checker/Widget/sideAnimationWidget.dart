import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/Pages/Symptom%20Checker/Widget/select_body_part_widget.dart';
import 'package:knowmed/Pages/Symptom%20Checker/symptomCheckerController.dart';
import 'package:knowmed/Pages/Symptom%20Checker/symptomCheckerModal.dart';

class SideAnimationPart extends StatefulWidget {
  final BodyPart selectedBodyPart;
  final Function(BodyPart val,String id) onTapBodyPart;

  const SideAnimationPart({Key? key, required this.selectedBodyPart, required this.onTapBodyPart}) : super(key: key);

  @override
  State<SideAnimationPart> createState() => _SideAnimationPartState();
}

class _SideAnimationPartState extends State<SideAnimationPart> {

  SymptomCheckerModal modal=SymptomCheckerModal();
  @override
  void dispose() {
    super.dispose();
    Get.delete<SymptomCheckerController>();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   get();
  // }
  // get()async{
  //   await modal.onClickAnimation(context);
  // }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SymptomCheckerController(),
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: modal.controller.getBodyOrganRegionList.length,
            itemBuilder: (BuildContext context, int index){
             // SymptomCheckerDataModal organImage=modal.controller.getBodyOrganRegionList[index];
              return AnimatedPositioned(

                  left: widget.selectedBodyPart!=BodyPart.notSelected?60:-300,top:200,
                  child:  Column(
                    children: [
                      (modal.controller.getBodyOrganRegionList[index]['organImagePath']!=null&&modal.controller.getBodyOrganRegionList[index]['organImagePath']!='')? Image.asset("assets/symptoms_image/${ modal.controller.getBodyOrganRegionList[index]['organImagePath'].toString()}.png",scale: 3,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const SizedBox();
                        },):const SizedBox(),
                      const SizedBox(height: 5,),


                    ],
                  ), duration:const Duration(milliseconds: 500));
            });
      }
    );
  }


}

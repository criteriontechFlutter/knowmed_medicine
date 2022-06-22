import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:knowmed/AppManager/MyTextField.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Feedback/feedbackController.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Feedback/feedbackModal.dart';

import '../../../../AppManager/Button.dart';
import '../../../../AppManager/MtTextTheme.dart';
import '../../../../AppManager/appColors.dart';
import '../../../../AppManager/coloured_safe_area.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {

  FeedbackModal modal = FeedbackModal();

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    await modal.onFeedbackDropdown(context);
  }


  @override
  void dispose() {
    Get.delete<FeedbackController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: AppColor().white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: AppColor().grey,)),
          title: Text('Feeedback',
              style: MyTextTheme().largeSCB.copyWith(
                  color: AppColor().text_blue
              )
          ),
          backgroundColor: AppColor().grey_header,
        ),
        body: GetBuilder(
            init: FeedbackController(),
            builder: (_) {
              return Column(
                  children: [
              Expanded(
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              border: Border.all(color: AppColor().grey),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Column(
              children: [
              Expanded(
              child: ListView(
              children: [
              Text('We Would Be happy to know any suggesstion from your side',style:MyTextTheme().smallBCN,),
              const SizedBox(height: 10,),
              Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,5),
              child: Text('Feedback Type',style:MyTextTheme().mediumBCN,),
              ),
              InkWell(
              onTap: (){
              setState(() {
              modal.controller.updateCache = "Suggestion";
              });

              },
              child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              border: Border.all(color: modal.controller.cache.value == "Suggestion"?AppColor().green:AppColor().grey),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Suggestion',style: (modal.controller.cache.value == "Suggestion")?MyTextTheme().smallBCB:MyTextTheme().smallPCB.copyWith(color: AppColor().grey)),
              (modal.controller.cache.value == "Suggestion")?CircleAvatar(
              radius: 12,
              backgroundColor: AppColor().green,
              child: Icon(Icons.check,color: Colors.white,size: 15,),
              ):CircleAvatar(
              radius: 12,
              backgroundColor: AppColor().greyLight,
              )
              ],
              ),
              ),
              ),
              const SizedBox(height: 8,),
              InkWell(
              onTap: (){
              setState(() {
              modal.controller.updateCache = "Some correction in app content";
              });
              },
              child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              border: Border.all(color: modal.controller.cache.value =="Some correction in app content"?AppColor().green:AppColor().grey),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Some correction in app content',style: modal.controller.cache.value == "Some correction in app content"?MyTextTheme().smallBCB:MyTextTheme().smallPCB.copyWith(color: AppColor().grey),),
              (modal.controller.cache.value == "Some correction in app content")?CircleAvatar(
              radius: 12,
              backgroundColor: AppColor().green,
              child: Icon(Icons.check,size: 13,color: AppColor().white,),
              ):CircleAvatar(
              radius: 12,
              backgroundColor: AppColor().greyLight,
              )
              ],
              ),
              ),
              ),
              const SizedBox(height: 8,),
              InkWell(
              onTap: (){
              setState(() {
              modal.controller.updateCache = "Complaint";
              });

              },
              child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              border: Border.all(color: modal.controller.getCache =="Complaint"?AppColor().green:AppColor().grey),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Complaint',style: (modal.controller.getCache == "Complaint")?MyTextTheme().smallBCB:MyTextTheme().smallPCB.copyWith(color: AppColor().grey)),
              modal.controller.getCache == "Complaint"?CircleAvatar(
              radius: 12,
              backgroundColor: AppColor().green,
              child: Icon(Icons.check,size: 13,color: AppColor().white,),
              ):CircleAvatar(
              radius: 12,
              backgroundColor: AppColor().greyLight,
              )
              ],
              ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,8),
              child: Text('Module',style: MyTextTheme().mediumBCN,),
              ),
              MyCustomSD(
              hideSearch: true,
              height: 150,
              listToSearch: modal.controller.feedbackModuleList,
              valFrom: 'moduleName',
              onChanged: (val)async{
              if(val!=null){
              print('pressed');
              modal.controller.updateModule=val['id'];
              await modal.onFeedbackDropdown(context);
              print('faheem'+ modal.controller.module.toString());

              }}),
              Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,8),
              child: Text('Remarks',style: MyTextTheme().mediumBCN,),
              ),
              MyTextField2(
              controller: modal.controller.remarksC.value,
              keyboardType: TextInputType.multiline,
              maxLine: 10,
              ),

              ],
              ),
              ),
              Container(
              height: 40,
              decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
              AppColor().orange,
              AppColor().orange
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
              color: AppColor().white,
              title: 'Calculate',
              onPress: ()async{
              await modal.onSubmitFeedback(context);
              },

              ),
              ),
              ),
              ],
              )
              ),
              ),
              ),

              ],
              );
            }
        ),
      ),
    );
  }
}

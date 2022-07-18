
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/MyTextField.dart';
import 'package:knowmed/AppManager/aimation_util.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/common_widgets.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/AppManager/plugin/autoAnimated/src/list.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_Controller.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_View.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Widget/right_corner_list_view.dart';
import '../../../../AppManager/coloured_safe_area.dart';
import '../../../../Widgets/NavigationDrawerWidget.dart';
import '../Widget/widgetAlphabet.dart';


class DiseaseListPageView extends StatefulWidget {
  const DiseaseListPageView({Key? key}) : super(key: key);

  @override
  _DiseaseListPageViewState createState() => _DiseaseListPageViewState();
}

class _DiseaseListPageViewState extends State<DiseaseListPageView> {
  DiseaseModal modal=DiseaseModal();
  bool isVisible= true;
  bool isExpand = false;

  bool _toggle = true;
  void _doToggle() => setState(() => _toggle = !_toggle);


  @override
  get() async{
    modal.controller.updateAlphabet="A";
    await modal.getLetters();
    await modal.diseaseListByAlphabetAndFiltter(context,);
  }

  @override
  void initState(){
    get();
    super.initState();

  }
  @override
  void dispose() {
    Get.delete<DiseaseController>();
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
            elevation: 0,
            title: Stack(children: [
              GestureDetector(
            onTap: _doToggle,
            child: SizedBox(
                height: kToolbarHeight * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Disease Details",style: MyTextTheme().largeWCB.copyWith(color: Colors.indigo.shade900)),
                     Icon(
                       Icons.search,color: Colors.indigo.shade900,
                       size: 24.0,
                     ),

                  ],
                )),
              ),
              AnimatedContainer(
            width: _toggle ? 0 : MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(_toggle ? MediaQuery.of(context).size.width : -25, 0, 0),
            duration: const Duration(seconds: 1),
            height: kToolbarHeight * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1,
                color: Colors.grey[600]!,
              ),
            ),
            child: MyTextField2(
              controller: modal.controller.searchC.value,
              onChanged: (val){
                setState(() {


                });
              },
              hintText: 'hatfgdf tyhfhhf',
              //textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  prefixIcon: AnimatedOpacity(
                      duration: const Duration(milliseconds:100 ),
                      opacity: _toggle ? 0 : 1,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back,color: Colors.grey,),
                        onPressed: _doToggle,
                      )),
                  border: InputBorder.none),
            ),
              )
            ]),
          ),

          body: GetBuilder(
            init:DiseaseController(),
            builder: (_) {
              return Column(
              children: [

                Expanded(
                  child: AlphabetWidget(
                    isVisible: modal.controller.alpha=="A-Z",
                    onTapAlphabet: (String alphabet){
                      setState(() {
                        modal.controller.alpha = alphabet;
                        modal.diseaseListByAlphabetAndFiltter(context);
                        print("alphabet: "+ modal.controller.alpha.toString());
                      });
                    },
                    onPressSymptom: (Map val) async{
                      if(val!=null){
                        modal.controller.updateDiseaseId=val["id"];

                        if(val["id"]==0){
                          modal.controller.updateAlphabet="A";
                          await modal.diseaseListByAlphabetAndFiltter(context,);
                        }
                        else{
                          await modal.diseaseListByAlphabetAndFiltter(context,removeAlphabet: true);
                        }

                      }
                    },
                    rightCornerList: CommonWidgets().showNoData(
                      title: 'Medicine List Data Not Found',
                      show: (modal.controller.getShowNoData &&
                          modal.controller.getDiseaseAlphabet.isEmpty),
                      loaderTitle: 'Loading Medicine List',
                      showLoader: (!modal.controller.getShowNoData &&
                          modal.controller.getDiseaseAlphabet.isEmpty),
                      child: RightCornerLIstView(
                        onTap: (DiseaseDataModal val,int index){
                          App().navigate(context, DiseaseDetails(
                            index: index,
                          )
                          );
                        },
                        dataList: modal.controller.getDiseaseAlphabet,
                        parameter: "problemName",
                      ),
                    ),
                    selectedAlphabet: modal.controller.alpha,
                    filterList: modal.controller.getFilterList,
                  ),
                ),

                // Expanded(
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 2,
                //         child: SingleChildScrollView(
                //           reverse:  modal.controller.alpha!=0&& modal.controller.alpha=='A-Z',
                //           child: Column(
                //             children: [
                //               // Container(
                //               //   height:200,
                //               //   color: Colors.blueGrey,
                //               // )
                //               Container(
                //                 color: Colors.grey,
                //                 child: ListView.builder(
                //                   physics: const NeverScrollableScrollPhysics(),
                //                     itemBuilder: (BuildContext context, int index){
                //                   return Column(
                //                     children: [
                //                       InkWell(
                //                         child: Container(
                //                             decoration: BoxDecoration(
                //
                //                               color:(modal.alphabets[index]==modal.controller.alpha)?
                //                               Colors.indigo:Colors.grey.shade100
                //
                //                             ),
                //                             child: Padding(
                //                               padding: const EdgeInsets.fromLTRB(0,8,0,8),
                //                               child: Center(
                //                                   child: Text(modal.alphabets[index],style:modal.alphabets[index]==modal.controller.alpha?MyTextTheme().mediumWCB:MyTextTheme().mediumBCB,)),
                //                             )),
                //                         onTap: (){
                //                           setState(() {
                //                             modal.controller.alpha = modal.alphabets[index];
                //                             modal.diseaseListByAlphabetAndFiltter(context);
                //                             print("alphabet: "+ modal.controller.alpha.toString());
                //                           });
                //                         },
                //                       ),
                //                     ],
                //                   );
                //                 },
                //                 itemCount:modal.alphabets.length,
                //                 shrinkWrap: true,),
                //               ),
                //               Visibility(
                //                 visible: modal.controller.alpha=="A-Z",
                //                 child: Container(
                //                   height: 30,
                //                   decoration: const BoxDecoration(
                //                       color: Colors.indigo
                //                   ),
                //                   child: Center(child: Text('A - Z',style: MyTextTheme().mediumWCB,)),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         flex: 8,
                //         child: Column(
                //           children: [
                //             Container(
                //              // height: 20,
                //               decoration: BoxDecoration(
                //                 //borderRadius: BorderRadius.circular(10),
                //                 border:Border.all(color: Colors.grey)
                //               ),
                //               child: Center(
                //                   child: Row(
                //                     children: [
                //                       Padding(
                //                         padding: const EdgeInsets.fromLTRB(15,7,0,7),
                //                         child: Text(modal.controller.alpha.toString(),style: MyTextTheme().mediumBCB,),
                //                       )
                //                     ],
                //                   )),
                //             ),
                //             Expanded(
                //
                //               child: CommonWidgets().showNoData(
                //                 title: 'Disease List Data Not Found',
                //                 show: (modal.controller.getShowNoData &&
                //                     modal.controller.getDiseaseAlphabet.isEmpty),
                //                 loaderTitle: 'Loading Disease List',
                //                 showLoader: (!modal.controller.getShowNoData &&
                //                     modal.controller.getDiseaseAlphabet.isEmpty),
                //                 child: Padding(
                //                   padding: const EdgeInsets.fromLTRB(8,0,0,10),
                //                   child: LiveList(
                //                     showItemInterval: Duration(milliseconds: 10),
                //                     showItemDuration: Duration(milliseconds: 200),
                //                     padding: EdgeInsets.all(0),
                //                     reAnimateOnVisibility: true,
                //                     scrollDirection: Axis.vertical,
                //                     itemBuilder: animationItemBuilder(
                //                           (index) {
                //                             DiseaseDataModal diseaseData=modal.controller.getDiseaseAlphabet[index];
                //                             return   InkWell(
                //                               onTap: (){
                //                                 App().navigate(context, DiseaseDetails(
                //                                   index: index,
                //                                 ));
                //                               },
                //                               child: Container(
                //                                 // height: 25,
                //                                 child: Padding(
                //                                   padding: const EdgeInsets.fromLTRB(4,8,4,4),
                //                                   child: Text(diseaseData.problemName.toString(),style: MyTextTheme().smallPCN.copyWith(color: Colors.indigo),),
                //                                 ),
                //                               ),
                //                             );
                //                           },
                //
                //                     ),
                //                      itemCount: modal.controller.getDiseaseAlphabet.length,
                //                     shrinkWrap: true,
                //                   ),
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ]);
            }
          ),
        )));
  }
}

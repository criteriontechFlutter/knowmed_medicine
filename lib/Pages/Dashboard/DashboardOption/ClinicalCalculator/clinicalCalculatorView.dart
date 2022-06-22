import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/ClinicalCalculator/clinicalCalculatorModal.dart';
import 'package:knowmed/Widgets/NavigationDrawerWidget.dart';

import '../../../../AppManager/MyTextField.dart';
import '../../../../AppManager/aimation_util.dart';
import '../../../../AppManager/common_widgets.dart';
import '../../../../AppManager/plugin/autoAnimated/src/list.dart';
import 'CalculatorDetails/detailsView.dart';
import 'clinicalCalculatorController.dart';
import 'clinicalCalculatorDataModal.dart';

class ClinicalCalculator extends StatefulWidget {
  const ClinicalCalculator({Key? key}) : super(key: key);

  @override
  State<ClinicalCalculator> createState() => _ClinicalCalculatorState();
}

class _ClinicalCalculatorState extends State<ClinicalCalculator> {

  ClinicalCalculatorModal modal=ClinicalCalculatorModal();

  bool isVisible= true;
  bool isExpand = false;

  bool _toggle = true;
  void _doToggle() => setState(() => _toggle = !_toggle);


  @override
  get() async{
    modal.controller.updateAlphabet="A";
    await modal.getLetters();
    await modal.onDropdown(context);
    await modal.onCalculator(context);
  }

  @override
  void initState(){
    get();
    super.initState();
  }

  @override
  void dispose() {
   Get.delete<ClinicalCalculatorController>();
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
                            Text("Clinical Calculator",style: MyTextTheme().largeWCB.copyWith(color: Colors.indigo.shade900)),
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
                  init:ClinicalCalculatorController(),
                  builder: (_) {
                    return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12,10,12,8),
                            child: MyCustomSD(
                              menuMode: false,
                              listToSearch: modal.controller.filterList,
                              valFrom: 'specialityName',
                              onChanged: (val)async {

                                if(val!=null){
                                  modal.controller.updateMedicineGroupId=val["id"];

                                  if(val["id"]==0){
                                    modal.controller.updateAlphabet="A";
                                    await modal.onCalculator(context,);
                                  }
                                  else{
                                    await modal.onCalculator(context,removeAlphabet: true);
                                  }

                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SingleChildScrollView(
                                    reverse:  modal.controller.alpha!=0&& modal.controller.alpha=='A-Z',
                                    child: Column(
                                      children: [
                                        // Container(
                                        //   height:200,
                                        //   color: Colors.blueGrey,
                                        // )
                                        Container(
                                          color: Colors.grey,
                                          child: ListView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index){
                                              return Column(
                                                children: [
                                                  InkWell(
                                                    child: Container(
                                                        decoration: BoxDecoration(

                                                            color:(modal.alphabets[index]==modal.controller.alpha)?
                                                           Colors.indigo:Colors.grey.shade100

                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.fromLTRB(0,8,0,8),
                                                          child: Center(
                                                              child: Text(modal.alphabets[index],style:modal.alphabets[index]==modal.controller.alpha?MyTextTheme().mediumWCB:MyTextTheme().mediumBCB,)),
                                                        )),
                                                    onTap: (){
                                                      setState(() {
                                                        modal.controller.alpha = modal.alphabets[index];
                                                       modal.onCalculator(context);
                                                        print("alphabet: "+ modal.controller.alpha.toString());
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                            itemCount:modal.alphabets.length,
                                            shrinkWrap: true,),
                                        ),
                                        Visibility(
                                          visible: modal.controller.alpha=="A-Z",
                                          child: Container(
                                            height: 30,
                                            decoration: const BoxDecoration(
                                                color: Colors.indigo
                                            ),
                                            child: Center(child: Text('A - Z',style: MyTextTheme().mediumWCB,)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    children: [
                                      Container(
                                        // height: 20,
                                        decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.circular(10),
                                            border:Border.all(color: AppColor().grey_header)
                                        ),
                                        child: Center(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(15,7,0,7),
                                                  child: Text(modal.controller.alpha.toString(),style: MyTextTheme().mediumBCB,),
                                                )
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                        child: CommonWidgets().showNoData(
                                          title: 'Medicine List Data Not Found',
                                          show: (modal.controller.getShowNoData &&
                                              modal.controller.getClinicalCalculatorList.isEmpty),
                                          loaderTitle: 'Loading Medicine List',
                                          showLoader: (!modal.controller.getShowNoData &&
                                              modal.controller.getClinicalCalculatorList.isEmpty),
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(8,0,0,10),
                                            child:
                                            LiveList(
                                              showItemInterval: Duration(milliseconds: 10),
                                              showItemDuration: Duration(milliseconds: 200),
                                              padding: EdgeInsets.all(0),
                                              reAnimateOnVisibility: true,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: animationItemBuilder(
                                                    (index) {
                                                  ClinicalCalculatorDataModal detailsData=modal.controller.getClinicalCalculatorList[index];
                                                  return   Padding(
                                                    padding: const EdgeInsets.fromLTRB(0,4,6,4),
                                                    child: InkWell(
                                                      onTap: ()async{
                                                       // await modal.onCalculator(context);
                                                        App().navigate(context, const CalculatorDetails());
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: AppColor().greyLight),
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(detailsData.calculatorTitle.toString(),style: MyTextTheme().mediumBCB.copyWith(color: Colors.indigo.shade900),),

                                                              Visibility(
                                                                visible: detailsData.remark.toString()!='',
                                                                  child: Column(
                                                                children: [
                                                                  SizedBox(height: 10,),
                                                                  Text(detailsData.remark.toString(),style: MyTextTheme().smallBCN),
                                                                ],
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },

                                              ),
                                              itemCount: modal.controller.getClinicalCalculatorList.length,
                                              shrinkWrap: true,
                                            ),
                                          ),
                                       ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ]);
                  }
              ),
            )));
  }
}

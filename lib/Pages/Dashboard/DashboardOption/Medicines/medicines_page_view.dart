
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/MyTextField2.dart';
import 'package:knowmed/AppManager/aimation_util.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/common_widgets.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';
import 'package:knowmed/AppManager/plugin/autoAnimated/src/list.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Medicines/medicines_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Medicines/medicines_Modal.dart';
import 'package:knowmed/Pages/DiseaseAndCondition/disease.dart';
import '../../../../AppManager/coloured_safe_area.dart';
import '../../../../Widgets/NavigationDrawerWidget.dart';
import 'medicine_Details/medicine_Details_View.dart';
import 'medicines_Controller.dart';

class MedicinesPageView extends StatefulWidget {
  const MedicinesPageView({Key? key}) : super(key: key);

  @override
  _MedicinesPageViewState createState() => _MedicinesPageViewState();
}

class _MedicinesPageViewState extends State<MedicinesPageView> {
  List<Disease> disease = allDisease;
  MedicineModal modal=MedicineModal();
  bool isVisible= true;
  bool isExpand = false;

  bool _toggle = true;
  void _doToggle() => setState(() => _toggle = !_toggle);


  @override
  get() async{
    modal.controller.updateAlphabet="A";
    await modal.getLetters();
   await modal.medicineFilter(context);
    await modal.medicineByAplphabetAndFiltter(context,);
  }

  @override
  void initState(){
    get();
    super.initState();

  }
  @override
  void dispose() {
    Get.delete<MedicineController>();
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
                    Text("Medicine Details",style: MyTextTheme().largeWCB.copyWith(color: Colors.indigo.shade900)),
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

          // appBar: AppBar(
          //   actions: [
          //     AnimSearchBar(
          //       width: 360,
          //       textController: _searchC,
          //       prefixIcon: Icon(Icons.search,color: Colors.black),
          //       suffixIcon: Icon(Icons.search,color: Colors.black,),closeSearchOnSuffixTap: true,
          //       onSuffixTap: () {
          //         setState(() {
          //           _searchC.clear();
          //         });
          //       },
          //     ),
          //     // IconButton(
          //     //     onPressed: (){
          //     //       setState(() {
          //     //         isVisible =! isVisible;
          //     //       });
          //     //
          //     //       print('pressed');
          //     //     },
          //     //     icon: const Icon(Icons.search,color: Colors.indigo,size: 30,))
          //   ],
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       AnimatedContainer(
          //         duration: Duration(milliseconds: 600),
          //         width: isVisible == false?0:250,
          //         child: Text('Medicine Details',
          //             style: MyTextTheme()
          //                 .mediumSCB
          //                 .copyWith(color: AppColor().text_blue)),
          //       ),
          //       AnimatedContainer(duration: Duration(milliseconds: 600),
          //         width: isVisible == true?0:250,
          //         color: Colors.blue,
          //         height: 30,
          //       )
          //     ],
          //   ),
          //
          //   backgroundColor: AppColor().grey_header,
          // ),
          body: GetBuilder(
            init:MedicineController(),
            builder: (_) {
              return Column(
              children: [
               // Container(
               //   color: AppColor().greyLight,
               //   child: Row(
               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
               //     children: [
               //     Visibility(
               //       child: Row(
               //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
               //         children: const [
               //           SizedBox(width: 10,),
               //           Icon(Icons.arrow_back_ios),
               //           SizedBox(width: 20,),
               //           Text('Medicine Details'),
               //         ],
               //       ),
               //     ),
               //       Padding(
               //         padding: const EdgeInsets.only(left: 15.0,right: 15),
               //         child: AnimSearchBarCustom(
               //           rtl: true,
               //           width: MediaQuery.of(context).size.width,
               //           textController: modal.controller.searchC.value,
               //           suffixIcon: Icon(Icons.close,color: Colors.black,),
               //            closeSearchOnSuffixTap: true,
               //           animationDurationInMilli: 1000,
               //           prefixIcon: Icon(Icons.search,color: Colors.black,),
               //           onSuffixTap: () {
               //             print("hereeeeeeeeeeeee");
               //             setState(() {
               //               modal.controller.searchC.value.clear();
               //             });
               //           },
               //         ),
               //       ),
               //     ],
               //   ),
               // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12,10,12,8),
              child: MyCustomSD(
                menuMode: false,
                                   //height: 300,
                  listToSearch: modal.controller.filterList,
                  valFrom: 'groupName',
                onChanged: (val)async {
                  //print(val["id"].toString());
                //  await modal.medicineFilter(context,val["id"].toString());
                  //await modal.medicineFilter(context);

                  if(val!=null){
                    modal.controller.updateMedicineGroupId=val["id"];

                    if(val["id"]==0){
                      modal.controller.updateAlphabet="A";
                      await modal.medicineByAplphabetAndFiltter(context,);
                    }
                    else{
                      await modal.medicineByAplphabetAndFiltter(context,removeAlphabet: true);
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
                                            modal.medicineByAplphabetAndFiltter(context);
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
                                border:Border.all(color: Colors.grey)
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
                                    modal.controller.getMedicineAlphabet.isEmpty),
                                loaderTitle: 'Loading Medicine List',
                                showLoader: (!modal.controller.getShowNoData &&
                                    modal.controller.getMedicineAlphabet.isEmpty),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8,0,0,10),
                                  child: LiveList(
                                    showItemInterval: Duration(milliseconds: 10),
                                    showItemDuration: Duration(milliseconds: 200),
                                    padding: EdgeInsets.all(0),
                                    reAnimateOnVisibility: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: animationItemBuilder(
                                          (index) {
                                            MedicineDataModal medicineData=modal.controller.getMedicineAlphabet[index];
                                            return   InkWell(
                                              onTap: (){
                                                App().navigate(context, MedicineDetails(
                                                  index: index,
                                                ));
                                              },
                                              child: Container(
                                                // height: 25,
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(4,8,4,4),
                                                  child: Text(medicineData.medicineName.toString(),style: MyTextTheme().smallPCN.copyWith(color: Colors.indigo),),
                                                ),
                                              ),
                                            );
                                          },

                                    ),
                                     itemCount: modal.controller.getMedicineAlphabet.length,
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

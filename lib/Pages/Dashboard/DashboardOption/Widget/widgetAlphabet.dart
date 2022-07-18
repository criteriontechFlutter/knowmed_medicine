import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/my_custom_sd.dart';


class AlphabetWidget extends StatelessWidget {

  final String? filterParameter;
  final String selectedAlphabet;
  final Widget rightCornerList;
  final List? filterList;
  final Function(String alphabet) onTapAlphabet;
  final Function(Map val) onPressSymptom;
  final bool isVisible;

  const AlphabetWidget({Key? key,
    this.filterParameter,
    required this.selectedAlphabet,
    required this.rightCornerList,
    required this.onTapAlphabet,
    this.filterList,
    required this.onPressSymptom, required this.isVisible,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          filterList==null? Container(): Padding(
            padding: const EdgeInsets.fromLTRB(12,10,12,8),
            child: MyCustomSD(
                menuMode: false,
                //height: 300,
                listToSearch: filterList??[],
                valFrom: filterParameter??'groupName',
                onChanged: (val)async {
                  if(val!=null){
                    onPressSymptom(val);
                  }

                }
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    reverse:selectedAlphabet=='A-Z',
                    child: Column(
                      children: [

                        Container(
                          color: Colors.grey,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index){
                              String alphabet=String.fromCharCode(index+65);
                              return Column(
                                  children: [
                                    InkWell(
                                      child: Container(
                                          decoration: BoxDecoration(

                                            color:(alphabet==selectedAlphabet)?
                                            Colors.indigo:Colors.grey.shade100

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0,8,0,8),
                                            child: Center(
                                                child: Text(alphabet,style:alphabet==selectedAlphabet?MyTextTheme().mediumWCB:MyTextTheme().mediumBCB,)),
                                          )),
                                      onTap: (){
                                        onTapAlphabet(alphabet);
                                      },

                                    ),
                                  ]
                              );
                            },
                            itemCount: 26,
                            shrinkWrap: true,),
                        ),
                        Visibility(
                          visible: isVisible,//modal.controller.alpha=="A-Z",
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
                                   child: Text(selectedAlphabet.toString(),style: MyTextTheme().mediumBCB,),
                                )
                              ],
                            )),
                      ),
                      Expanded(child: rightCornerList)
                      // Expanded(
                      //
                      //   // child:
                      //   // CommonWidgets().showNoData(
                      //   //   title: 'Medicine List Data Not Found',
                      //   //   show: (modal.controller.getShowNoData &&
                      //   //       modal.controller.getMedicineAlphabet.isEmpty),
                      //   //   loaderTitle: 'Loading Medicine List',
                      //   //   showLoader: (!modal.controller.getShowNoData &&
                      //   //       modal.controller.getMedicineAlphabet.isEmpty),
                      //   child: Padding(
                      //     padding: const EdgeInsets.fromLTRB(8,0,0,10),
                      //     child: LiveList(
                      //       showItemInterval: Duration(milliseconds: 10),
                      //       showItemDuration: Duration(milliseconds: 200),
                      //       padding: EdgeInsets.all(0),
                      //       reAnimateOnVisibility: true,
                      //       scrollDirection: Axis.vertical,
                      //       itemBuilder: animationItemBuilder(
                      //             (index) {
                      //           MedicineDataModal medicineData=medicines[index];
                      //           return   InkWell(
                      //             onTap: (){
                      //               App().navigate(context, MedicineDetails(
                      //                 index: index,
                      //               ));
                      //             },
                      //             child: Container(
                      //               // height: 25,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.fromLTRB(4,8,4,4),
                      //                 child: Text(medicineData.medicineName.toString(),style: MyTextTheme().smallPCN.copyWith(color: Colors.indigo),),
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //
                      //       ),
                      //       itemCount: medicines.length,
                      //       shrinkWrap: true,
                      //     ),
                      //   ),
                      //   //),
                      // )
                    ],
                  ),
                )
              ],
            ),
          )
        ]);
  }
}

// import 'package:flutter/material.dart';
//
// import '../../../../../AppManager/MtTextTheme.dart';
// import '../../../../../AppManager/appColors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/hex_color_extention.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_and_condition_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_Controller.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_DataModal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/DiseaseAndCondition/disease_details/disease_Details_Modal.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../AppManager/MtTextTheme.dart';
import '../../../../../AppManager/appColors.dart';
import '../../../../../AppManager/coloured_safe_area.dart';

class DiseaseDetails extends StatefulWidget {
  final int index;

  const DiseaseDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<DiseaseDetails> createState() => _DiseaseDetailsState();
}

class _DiseaseDetailsState extends State<DiseaseDetails> {
  //ScrollController _controller = ScrollController();
  ItemScrollController _scrollController1 = ItemScrollController();

  DiseaseDetailsModal modal = DiseaseDetailsModal();
  DiseaseModal disease_Modal = DiseaseModal();

  var justifyText = TextAlign.justify;
  @override
  bool showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  get() async {
    await modal.diseaseDetails(context, widget.index);
  }

  void _scrollToTop() {
    _scrollController1.scrollTo(
        index: 0, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
      child: ColoredSafeArea(
        child: Scaffold(
          backgroundColor: AppColor().white,
          appBar: AppBar(
            // actions: [
            //   IconButton(
            //       onPressed: (){
            //         print('pressed');
            //       },
            //       icon: const Icon(Icons.search,color: Colors.indigo,size: 30,))
            // ],
            title: Text('Disease Details',
                style: MyTextTheme()
                    .mediumSCB
                    .copyWith(color: AppColor().text_blue)),
            backgroundColor: AppColor().grey_header,
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.grey.withOpacity(0.1),
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 40,
              color: AppColor().blue,
            ),
            onPressed: () {
              _scrollToTop();
            },
          ),
          body: GetBuilder(
              init: DiseaseDetailsController(),
              builder: (_) {
                return ScrollablePositionedList.builder(
                    itemScrollController: _scrollController1,
                    //controller:  _controller,
                    itemCount: modal.controller.getMedicineDetailsList.length,
                    itemBuilder: (context, index3) {
                      DiseaseDetailsDataModal modaldata =
                          modal.controller.getMedicineDetailsList[index3];
                      DiseaseDataModal medicineData = disease_Modal
                          .controller.getDiseaseAlphabet[widget.index];
                      return Column(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          index3 == 0
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                    4,
                                                    0,
                                                    0,
                                                    2,
                                                  ),
                                                  child: Text(
                                                    medicineData.problemName
                                                        .toString(),
                                                    style:
                                                        MyTextTheme().mediumBCB,
                                                  ),
                                                )
                                              : const SizedBox(),
                                          //index3 == 0?SizedBox(height: 2,):SizedBox(),
                                          index3 == 0
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          4, 0, 0, 8),
                                                  child: Text(
                                                    'Know your medicine for better treatment',
                                                    style:
                                                        MyTextTheme().mediumBCN,
                                                  ),
                                                )
                                              : const SizedBox(),
                                          Wrap(
                                            children: [
                                              Image.asset(
                                                "assets/" +
                                                    modaldata.heading
                                                        .toString() +
                                                    ".png",
                                                height: 20,
                                                width: 20,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                modaldata.heading.toString(),
                                                style: MyTextTheme()
                                                    .mediumBCB
                                                    .copyWith(
                                                        color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          _getWidgetAccordingToType(modaldata),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                  visible: modaldata
                                                      .reference!.isNotEmpty,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        'Ref:',
                                                        style: MyTextTheme()
                                                            .mediumBCB,
                                                      ),
                                                    ],
                                                  )),
                                              Expanded(
                                                  child: Html(
                                                data: modaldata.reference
                                                    .toString(),
                                              )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Visibility(
                                    visible: index3 == 0 ? true : false,
                                    child: Wrap(
                                      children: List.generate(
                                          modal
                                              .controller
                                              .getMedicineDetailsList
                                              .length, (index2) {
                                        return InkWell(
                                          onTap: () {
                                            _scrollController1.scrollTo(
                                                index: index2,
                                                duration: const Duration(
                                                    milliseconds: 500));
                                          },
                                          child: modal
                                                      .controller
                                                      .getMedicineDetailsList[
                                                          index2]
                                                      .heading
                                                      .toString() ==
                                                  "Overview"
                                              ? const Text("")
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          3, 4, 4, 3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColor().blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      WidgetSpan(
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          8,
                                                                          0,
                                                                          2,
                                                                          3),
                                                              child:
                                                                  Image.asset(
                                                                "assets/" +
                                                                    modal
                                                                        .controller
                                                                        .getMedicineDetailsList[
                                                                            index2]
                                                                        .heading
                                                                        .toString() +
                                                                    ".png",
                                                                height: 20,
                                                                width: 20,
                                                                color: Colors
                                                                    .white,
                                                              ))),
                                                      WidgetSpan(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                3, 5, 5, 7),
                                                        child: Text(
                                                          modal
                                                              .controller
                                                              .getMedicineDetailsList[
                                                                  index2]
                                                              .heading
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: MyTextTheme()
                                                              .smallWCB,
                                                        ),
                                                      )),
                                                    ])),
                                                  ),
                                                ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }

  Widget _getWidgetAccordingToType(DiseaseDetailsDataModal medicine) {
    var data = medicine.body;

    if (data is List) {
      switch (int.parse(medicine.headingId.toString())) {
        case 11:
          return Column(
            children: List.generate((data as List).length, (index) {
              var newData = (data as List)[index];

              return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 2, 10, 0),
                  child: Column(
                    children: [
                      Text(
                        newData['text'].toString(),
                        style: MyTextTheme().smallBCN,
                      ),
                      Text(newData['value'].toString(),
                          style: MyTextTheme().smallBCN),
                    ],
                  )
                  // child: Row(
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 2,
                  //       backgroundColor: AppColor().black,
                  //     ),
                  //     const SizedBox(width: 5,),
                  //     (newData['problemName'] == '')?const Text(""):
                  //     Expanded(child: Text(newData['problemName'].toString(),style: MyTextTheme().smallBCN)),
                  //   ],
                  // ),
                  );
            }),
          );

        case 13:
          List<ClinicalFeaturesDataModal> clinicalFeatures =
              List<ClinicalFeaturesDataModal>.from((data).map(
                  (element) => ClinicalFeaturesDataModal.fromJson(element)));
          return Column(
            children: List.generate(clinicalFeatures.length, (index) {
              var newData = clinicalFeatures[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.inputType.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      children:
                          List.generate(newData.concern!.length, (index2) {
                        return Column(
                          children: List.generate(
                              newData.concern![index2].data!.length, (index3) {
                            var concern =
                                newData.concern![index2].data![index3];
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppColor().black,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(concern.problemName.toString(),style: MyTextTheme().smallBCN,)),
                              ],
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );

        case 14:
          List<DiagnosticsDataModal> diagnostics =
          List<DiagnosticsDataModal>.from((data).map(
                  (element) => DiagnosticsDataModal.fromJson(element)));
          return Column(
            children: List.generate(diagnostics.length, (index) {
              var newData = diagnostics[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newData.type.toString(),
                    style: MyTextTheme().smallBCB,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      children:
                      List.generate(newData.investigation!.length, (index2) {
                        return
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Test",style: MyTextTheme().smallBCN,),
                                  Text("Subtest",style: MyTextTheme().smallBCN),
                                  Text("Property",style: MyTextTheme().smallBCN),
                                  Text("Result",style: MyTextTheme().smallBCN)
                                ],
                              ),
                              Column(
                              children: List.generate(
                                  newData.investigation![index2].data!.length, (index3) {
                                var daigonasticData = newData.investigation![index2].data![index3];
                                return Column(
                                  children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,2,0,2),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Expanded(child: Text(daigonasticData.subTestName.toString(),style: MyTextTheme().smallBCN)),
                                  Expanded(child: Text(daigonasticData.propertyValue.toString(),style: MyTextTheme().smallBCN)),
                                  Expanded(child: Text(daigonasticData.remarkValue.toString(),style: MyTextTheme().smallBCN)),
                                  ],
                                  ),
                                )
                                  ],
                                );

                              }),

                        ),
                            ],
                          );
                      }),
                    ),
                  ),
                ],
              );
            }),
          );

        case 15:
          List<IntractionDataModal> intractionData =
              List<IntractionDataModal>.from((data)
                  .map((element) => IntractionDataModal.fromJson(element)));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: intractionData[0].interactionWithMedicine!.isNotEmpty,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'With Medicine',
                        style: MyTextTheme().mediumBCB,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                    intractionData[0].interactionWithMedicine!.length, (index) {
                  var newData =
                      intractionData[0].interactionWithMedicine![index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 5, 8, 0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: AppColor().black,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Text(
                              newData.interactionWithMedicine.toString(),
                              style: MyTextTheme().smallBCN,
                            )),
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible:
                    intractionData[0].interactionWithMedicineGroup!.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'With Medicine Group',
                        style: MyTextTheme().mediumBCB,
                      ),
                    ),
                    Column(
                      children: List.generate(
                          intractionData[0]
                              .interactionWithMedicineGroup!
                              .length, (index) {
                        var newData = intractionData[0]
                            .interactionWithMedicineGroup![index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 8, 0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColor().black,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                    newData.interactionWithMedicineGroup
                                        .toString(),
                                    style: MyTextTheme().smallBCN,
                                  )),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: intractionData[0].interactionWithNurient!.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'With Nurient',
                        style: MyTextTheme().mediumBCB,
                      ),
                    ),
                    Column(
                      children: List.generate(
                          intractionData[0].interactionWithNurient!.length,
                          (index) {
                        var newData =
                            intractionData[0].interactionWithNurient![index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 8, 0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColor().black,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                    newData.interactionWithNutrient.toString(),
                                    style: MyTextTheme().smallBCN,
                                  )),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          );

        case 18:
          return Column(
            children: List.generate((data as List).length, (index) {
              var newData = (data as List)[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(18, 5, 0, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColor().black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      newData['text'].toString(),
                      style: MyTextTheme().mediumBCB,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      newData['value'].toString(),
                      style: MyTextTheme().smallBCN,
                    )
                  ],
                ),
              );
            }),
          );

        case 20:
          return Column(
            children: List.generate((data as List).length, (index) {
              var newData = (data as List)[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColor().black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                      newData['precautions'].toString(),
                      style: MyTextTheme().smallBCN,
                    )),
                  ],
                ),
              );
            }),
          );

        default:
          return Container();
      }
    } else if (data is String) {
      return Html(data: data.toString());
    } else {
      return Container();
    }
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/MyTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/AppManager/appUtils.dart';
import 'package:knowmed/AppManager/coloured_safe_area.dart';
import 'package:knowmed/AppManager/common_widgets.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/food_And_Herb_Controller.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/FoodAndHerbs/food_and_herb_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Medicines/medicine_Details/medicine_Details_View.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Medicines/medicines_Data_Modal.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Widget/widgetAlphabet.dart';
import '../../../../Widgets/NavigationDrawerWidget.dart';
import '../Widget/right_corner_list_view.dart';


class FoodAndHerbPageView extends StatefulWidget {
  const FoodAndHerbPageView({Key? key}) : super(key: key);

  @override
  _FoodAndHerbPageViewState createState() => _FoodAndHerbPageViewState();
}

class _FoodAndHerbPageViewState extends State<FoodAndHerbPageView> {
  FoodAndHerbModal modal=FoodAndHerbModal();
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
    Get.delete<FoodAndHerbController>();
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
                    Text("Food Nutrition",style: MyTextTheme().largeWCB.copyWith(color: Colors.indigo.shade900)),
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
            init:FoodAndHerbController(),
            builder: (_) {
              return AlphabetWidget(
                onTapAlphabet: (String alphabet){
                  setState(() {
                    modal.controller.alpha = alphabet;
                    modal.medicineByAplphabetAndFiltter(context);
                    print("alphabet: "+ modal.controller.alpha.toString());
                  });
                },
                onPressSymptom: (Map val) async{
                  if(val!=null){
                    modal.controller.updateFoodCategoryId=val["id"];

                    if(val["id"]==0){
                      modal.controller.updateAlphabet="A";
                      await modal.medicineByAplphabetAndFiltter(context,);
                    }
                    else{
                      await modal.medicineByAplphabetAndFiltter(context,removeAlphabet: true);
                    }

                  }
                },
                rightCornerList: CommonWidgets().showNoData(
                  title: 'Medicine List Data Not Found',
                  show: (modal.controller.getShowNoData &&
                      modal.controller.getFoodAlphabet.isEmpty),
                  loaderTitle: 'Loading Medicine List',
                  showLoader: (!modal.controller.getShowNoData &&
                      modal.controller.getFoodAlphabet.isEmpty),
                  child: RightCornerLIstView(
                    onTap: (MedicineDataModal val,int index){
                      App().navigate(context, MedicineDetails(
                        index: index,
                      ));
                    },
                    dataList: modal.controller.getFoodAlphabet,
                    parameter: "foodName",
                  ),
                ),
                selectedAlphabet: modal.controller.alpha,
                filterList: modal.controller.getFilterList,
                filterParameter: "categoryName",
              );
            }
          ),
        )));
  }
}

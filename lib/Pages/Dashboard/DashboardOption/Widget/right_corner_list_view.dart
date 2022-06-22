




import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/aimation_util.dart';
import 'package:knowmed/AppManager/plugin/autoAnimated/src/list.dart';
import 'package:knowmed/Pages/Dashboard/DashboardOption/Medicines/medicines_Data_Modal.dart';


class RightCornerLIstView<T> extends StatelessWidget {
  final List dataList;
  final String parameter;
  final Function(T val,int index) onTap;

  const RightCornerLIstView({Key? key,
    required this.dataList,
    required this.onTap,
    required this.parameter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,0,10),
      child: LiveList(
        showItemInterval: Duration(milliseconds: 10),
        showItemDuration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(0),
        reAnimateOnVisibility: true,
        scrollDirection: Axis.vertical,
        itemBuilder: animationItemBuilder(
              (index) {
                var  dataObject=dataList[index];
            return   InkWell(
              onTap: (){
                onTap(dataObject,index);
              },
              child: Container(
                // height: 25,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4,8,4,4),
                  child: Text(dataObject.toJson()[parameter].toString(),style: MyTextTheme().smallPCN.copyWith(color: Colors.indigo),),
                ),
              ),
            );
          },

        ),
        itemCount: dataList.length,
        shrinkWrap: true,
      ),
    );
  }
}

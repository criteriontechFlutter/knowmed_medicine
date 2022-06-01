import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/MyTextField2.dart';
import 'package:knowmed/AppManager/NewTextField.dart';
import 'package:knowmed/AppManager/appColors.dart';
import 'package:knowmed/Pages/DiseaseAndCondition/disease.dart';

class DiseaseAndConditionPageView extends StatefulWidget {
  const DiseaseAndConditionPageView({Key? key}) : super(key: key);

  @override
  _DiseaseAndConditionPageViewState createState() => _DiseaseAndConditionPageViewState();
}

class _DiseaseAndConditionPageViewState extends State<DiseaseAndConditionPageView>{
  final controller = TextEditingController();
  List<Disease> disease = allDisease;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor().grey_dark,
        child: SafeArea(
        child: Container(
        child: Scaffold(
          backgroundColor: AppColor().white,
            appBar: AppBar(
              title: Text('Disease Details',
                  style: MyTextTheme().mediumSCB.copyWith(
                      color: AppColor().text_blue
                  )
              ),
              backgroundColor: AppColor().grey_header,
            ),
        body:  Column(
          children: <Widget>[
            Container(
              height: 45,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search disease',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)
                    )
                ),
                onChanged: searchDisease,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: disease.length,
                itemBuilder:(context,index) {
                  final diseases = disease[index];

                  return ListTile(
                      leading : Image.network(
                        diseases.urlImage,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title : Text(diseases.title)
                  );
                },
              ),
            ),
          ],
        ),
        )
        )
        )
    );
  }

  diseaselistpart() {

  }


  void searchDisease(String query) {
    final suggestions = allDisease.where((disease){
      final diseaseTitle = disease.title.toLowerCase();
      final input = query.toLowerCase();
      return diseaseTitle.contains(input);

    }).toList();
    setState(() => disease = suggestions);
    }
  }

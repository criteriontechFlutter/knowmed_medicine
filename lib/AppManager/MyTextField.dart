
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';





class MyTextField2 extends StatefulWidget {

  final String? hintText;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final int? maxLength;
  final bool? isPasswordField;
  final bool? enabled;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final ValueChanged? onChanged;
  List<TextInputFormatter>? inputFormatters;

   MyTextField2({Key? key, this.hintText, this.controller,
    this.isPasswordField,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.enabled,
    this.textAlign,
    this.keyboardType,
    this.decoration,
    this.onChanged,
    this.inputFormatters,
    this.maxLine}) : super(key: key);

  @override
  _MyTextField2State createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {

  bool obscure=false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isPasswordField??false){
      obscure=widget.isPasswordField!;
      setState(() {

      });
    }
  }





  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
        enabled: widget.enabled??true,
        controller: widget.controller,
        minLines: widget.maxLine,
        maxLines: widget.maxLine==null? 1:100,
        obscureText: widget.isPasswordField==null? false:obscure,
        maxLength: widget.maxLength??null,
        textAlign: widget.textAlign?? TextAlign.start,
        keyboardType: widget.keyboardType?? null,
        onChanged: widget.onChanged==null? null:(val){
          widget.onChanged!(val);
        },
        style:  MyTextTheme().mediumPCN,
        decoration: widget.decoration??InputDecoration(
          filled: true,
          isDense: true,
          fillColor: AppColor().white,
          counterText: '',
          //contentPadding: widget.isPasswordField==null? EdgeInsets.all(5):widget.isPasswordField? EdgeInsets.fromLTRB(5,5,5,5):EdgeInsets.all(5),
          contentPadding: EdgeInsets.all(12),
          hintText: widget.hintText??null,
          hintStyle: MyTextTheme().mediumBCN.copyWith(
            color: Colors.grey
          ),
          errorStyle: MyTextTheme().smallPCB,
          prefixIcon: widget.prefixIcon??null,
          suffixIcon:  (widget.isPasswordField==null || widget.isPasswordField==false)? widget.suffixIcon??null:IconButton(
            splashRadius: 2,
            icon: obscure? Icon(
              Icons.visibility_off,
              color: AppColor().primaryColor,)
                : Icon(Icons.visibility,
              color:  AppColor().primaryColorLight,),
            onPressed: (){
              setState(() {
                obscure=!obscure;
              });
            },),
          suffixIconConstraints: BoxConstraints.tight(Size(40,40)),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
                color: AppColor().grey,
                width: 1
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
                color: AppColor().grey,
                width: 1
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
                color: AppColor().primaryColor,
                width: 1
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
                color: AppColor().primaryColor,
                width: 1
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
                color: AppColor().primaryColor,
                width: 1
            ),
          ),
        ),
        validator: widget.validator??null
    );
  }
}



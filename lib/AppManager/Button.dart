
import 'package:flutter/material.dart';
import 'package:knowmed/AppManager/MtTextTheme.dart';
import 'package:knowmed/AppManager/appColors.dart';






class MyButton extends StatefulWidget {

  final String title;
  final double? height;
  final double? elevation;
  final double? width;
  final Function? onPress;
  final Color? color;
  final bool? animate;
  final TextStyle? textStyle;

  const MyButton({Key? key, required this.title, this.onPress,
    this.color,
  this.height,
  this.textStyle,
  this.elevation,
  this.animate,
  this.width}) : super(key: key);
  

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {








  Widget build(BuildContext context) {

    return SizedBox(
      width:  widget.width,
      height:  widget.height??40,
      child: TextButton(
          onPressed: (){
            widget.onPress!();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(widget.title,
                  textAlign: TextAlign.center,
                  style: widget.textStyle?? MyTextTheme().mediumWCB),
              ),
            ],
          )
      ),
    );
  }
}



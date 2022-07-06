import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed/Pages/Symptom%20Checker/Widget/select_body_part_widget.dart';

class SideAnimationPart extends StatefulWidget {
  final BodyPart selectedBodyPart;
  final Function(BodyPart val) onTapBodyPart;

  const SideAnimationPart({Key? key, required this.selectedBodyPart, required this.onTapBodyPart}) : super(key: key);

  @override
  State<SideAnimationPart> createState() => _SideAnimationPartState();
}

class _SideAnimationPartState extends State<SideAnimationPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.selectedBodyPart.toString() != ""?
       AnimatedPositioned(

            left: widget.selectedBodyPart!=BodyPart.notSelected?60:-300,top:200,
            child:  Column(
              children: [
                Image.asset("assets/symptoms_image/eyes.png",scale: 3,),
                SizedBox(height: 5,),
                Image.asset("assets/symptoms_image/face.png",scale: 3),
                SizedBox(height: 5,),
                Image.asset('assets/symptoms_image/hair.png',scale: 3),

              ],
            ), duration:Duration(milliseconds: 500)):Text("flutter "),

        // AnimatedPositioned(
        //   left: 100,top: 300,
        //     duration: Duration(seconds: 2),
        //     child: Text('Flutter'))
      ],
    );
  }
}

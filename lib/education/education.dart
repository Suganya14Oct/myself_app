import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;

class Education extends StatelessWidget {

  Education({@required this.company, @required AnimationController? controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

  final Company? company;
  final CompanyDetailsIntroAnimation? animation;

  @override
  Widget _createAnimation(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(opacity: animation!.bgdropOpacity!.value,
          child: Image.asset(company!.backdropPhoto.toString(),fit: BoxFit.cover,),),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation!.bgdropBlur!.value,
              sigmaY: animation!.bgdropBlur!.value
          ),
          child: new Container(
              color: Colors.black.withOpacity(0.3),
              child: _createAboutCompany()
          ),
        )
      ],
    );
  }

  Widget _createAboutCompany() {
    return SingleChildScrollView(
      child: new Padding(
        padding: EdgeInsets.only(top: 17.0,left: 14.0,right: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Education",style: TextStyle(
                color: Colors.white.withOpacity(animation!.nameOpacity!.value),
                fontSize: 27.0 * animation!.avatarSize!.value + 2.0,
                fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              color: Colors.white.withOpacity(0.79),
              endIndent: 130,
            ),
            SizedBox(height: 20.0,),
            Column(
              children: [
                Text("->  B.E(Bachelor of Engineering) - Computer Science Engineering (2018 - 2022)",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Vaigai College of Engineering, Madurai, Tamil Nadu, India based on Anna University Syllabus.      "
                    "->   GPA 8.2/10.0",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new AnimatedBuilder(animation: animation!.controller!,
            builder: _createAnimation)
    );
  }
}

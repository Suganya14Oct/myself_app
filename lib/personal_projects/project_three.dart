import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;

class ProjectThree extends StatelessWidget {

  ProjectThree({@required this.company, @required AnimationController? controller})
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
            new Text("Project 3",style: TextStyle(
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
            Container(
              child: Text("Scroll Down",style: TextStyle(
                  color: Colors.white.withOpacity(animation!.nameOpacity!.value),
                  fontSize: 14.0 * animation!.avatarSize!.value + 2.0,
                  fontWeight: FontWeight.bold
              ),),
              alignment: Alignment.topRight,
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              //color: Colors.redAccent,
              child: Image.asset("assets/judiciary.jpg"),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Project Name:",
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4,
                  fontSize: 17,decoration: TextDecoration.underline,decorationColor: Colors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
            Center(
              child: Text("Litract",
                style: TextStyle(
                    color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                    height: 1.4,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Project Concept:",
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4,
                  fontSize: 17,decoration: TextDecoration.underline,decorationColor: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            ),
            Center(
              child: Text("               This is project is based on the file maintanence for the judiciary/court purpose.",
                style: TextStyle(
                    color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                    height: 1.4,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),),
            SizedBox(
              height: 10.0,
            ),
            Text("Project Overview:",
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4,
                  fontSize: 17,decoration: TextDecoration.underline,decorationColor: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text("                  By using this project the client will be able to maintain his/her court details in a form type."
                "The main purpose of this app is to maintain/update/check important forms and all the details regarding"
                " the case, in order to submit in court on the specific day/time(hearing)."
                "For example on the first hearing the client having some forms and case regarded files. It should be"
                " rechecked/updated/modified for the second hearing. But the client doesn't know when was the second hearing."
                "Until he/she have to maintain that file without oblivion regarding that particular case. So, by using this app"
                " the client may able to meet his/her need.",
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("My Role:",
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4,
                  fontSize: 17,decoration: TextDecoration.underline,decorationColor: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("-> Bug Fixing, Modifications in front - end design.",
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 10.0,
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

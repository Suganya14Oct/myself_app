import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;

class ProjectTwo extends StatelessWidget {

  ProjectTwo({@required this.company, @required AnimationController? controller})
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
            new Text("Project 2",style: TextStyle(
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
              child: Image.asset("assets/payroll.jpg"),
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
              child: Text("CQUBE",
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
              child: Text("                This app is based on auditing work/pay roll for the employees/workers/labors",
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
            Text("                 There are two persons who plays a main role in this project. One is Contractor and the other is Auditor."
                          "This project has two logins.One for contractor and other for auditor. The contractor maintains"
                          " all the payroll details (for example PF, ESI, Bank Statement, Attendance, etc,.) The auditor will"
                    " check the documents according to some conditions. For example, WC policy license will be generated"
                    " for certain time lapse. The auditor will mention the time lapse or some conditions in that login."
                    "The app will check whether the condition time lapse matches.(This will be done by the APIs used in"
                        "the app).If the condition mismatches, The file will be rejected with remarks. Again the rejected file"
                     " will be recheked by the contractor. The file will be corrected again and uploaded again by the"
                  " contractor. Again the auditor will check if the condition satisfied, the file will be approved.",
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
            Column(
              children: [
                Text("-> Created front-end design for 7 - 9 modules & Bug Fixing and fixing performance issues",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("-> Integrated more than 20 - 25 APIs &  Worked with JSON",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Worked with state Management - Provider Concept",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Worked in file/document uploading in front - end",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Worked with GitHubs to push, pull and for code maintenance",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
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

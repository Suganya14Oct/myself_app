import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;

class ProjectOne extends StatelessWidget {

  ProjectOne({@required this.company, @required AnimationController? controller})
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
            new Text("Project 1",style: TextStyle(
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
              child: Image.asset("assets/image.png"),
            ),
            SizedBox(
              height: 8.0,
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
              child: Text("  Temple City",
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
              child: Text("Food Delivery App",
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
            Text("                 This project has two different apps, One named as Temple City Admin and another one named as Temple City delivery App.Both apps have"
                        " different purposes. Admin app is used by the hotel members to update, modify, delete daily food dishes, special"
                            " dishes, prize details, etc,. On the other hand, the delivery app - which is used the customers to order food."
                            "Both the apps are Interlinked.",
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
              Text("->  Worked in Admin App & Created front-end design for 8 - 10 modules.",
                          style: TextStyle(
                              color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                              height: 1.4,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),
            Text("->  Integrated more than 10 - 15 APIs & Worked with JSON",
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
                Text("->  Worked and familiar with Firebase for Push Notifications",
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
                Text("->   Worked in delivery app with team (collaboration) for google maps",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Bug Fixing and fixing performance issues & Code Maintanence",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,)
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

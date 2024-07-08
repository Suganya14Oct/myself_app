import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;

class ProjectFour extends StatelessWidget {

  final Company? company;
  final CompanyDetailsIntroAnimation? animation;

  ProjectFour({@required this.company, @required AnimationController? controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

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
            new Text("Project 4",style: TextStyle(
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
              child: Image.asset("assets/gym.jpg"),
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
              child: Text("GymSOft Mobile App",
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
              child: Text("Gym Mobile App for gym users",
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
            Text("This App is developed for a Businessman, he who is running multiple gyms. Have to maintain the all the Gym Users, Equiments details, Trainers"
              'This Project consists of both admin side and User side. Our team developed website for admin side and app & website for user side. In this my role is to develop this whole app fo users. to book their slot, to view gym equipments and to know about trainer details, their diet, etc,.   ',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("->  Created Figma Design for whole Project.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Designed Front End Design for 24 Screens (Whole Project).",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Integrated 17 API’s for the App.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Worked with JSON",
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
                Text("->  Worked with GitHub to push, pull and for code maintenance",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("->  Bug Fixing and fixing performance issues",
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

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myself/animation/animation.dart';
import 'dart:ui' as ui;
import 'package:myself/model/company.dart';
import 'package:myself/home/course_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedProfileSummary extends StatelessWidget {

  DetailedProfileSummary({@required this.company, @required AnimationController? controller})
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

  Widget _createAboutCompany(){
    return SingleChildScrollView(
      child: new Padding(
        padding: EdgeInsets.only(top: 17.0,left: 14.0,right: 14.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Detailed Profile Summary",style: TextStyle(
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
              child: Text("Swipe Down",style: TextStyle(
                  color: Colors.white.withOpacity(animation!.nameOpacity!.value),
                  fontSize: 14.0 * animation!.avatarSize!.value + 2.0,
                  fontWeight: FontWeight.bold
              ),),
              alignment: Alignment.topRight,
            ),
            SizedBox(
              height: 10.0,
            ),
            new Text(company!.about!,
              style: TextStyle(
                  color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                  height: 1.4
              ),
            ),
            SizedBox(height: 14.0,),
            Column(
              children: [
                Text("->  Experience in developing high-quality mobile Applications using flutter framework.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("->  Collaborate with cross-functional teams to design,define and ship new feature.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("->  Identify and address performance issues & Familiar with Google Maps",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("->  Maintain code documentation and technical specifications.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("-> Familiar with Rest APIs and JSON & Experience in GitHub.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("-> Experience in GitHub & Familiar with Google Maps and able to work with and without dependency.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("-> Developing user interface components and implementing them by following well-known Flutter/Dart frameworks and practices.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("-> Passionate about flutter, open source contributions, and learning new technologies.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("-> Familiarity with Agile methodology  & Experience with Firebase in cloud firestore.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0,),
                Text("-> Worked in 3+ projects based on client specifications & Familiar with state Management - provider",
                  style: TextStyle(
                      color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 14.0),
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

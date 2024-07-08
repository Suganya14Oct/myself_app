// import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/animation/certificate_animator.dart';
import 'dart:ui' as ui;
import 'package:myself/model/company.dart';
import 'package:myself/home/course_card.dart';
import 'package:myself/animation/detailed_animator.dart';
import 'package:myself/detailed_profile_summary/detailed_profile_summary.dart';
import 'package:myself/animation/education_animator.dart';
import 'package:myself/animation/language_animator.dart';
import 'package:myself/language/languages.dart';
import 'package:myself/personal_projects/personal_projects.dart';
import 'package:myself/animation/personal_projects_animator.dart';
import 'package:myself/model/repo_data.dart';
import 'package:myself/animation/software_animator.dart';
import 'package:myself/animation/work_animator.dart';
import 'package:url_launcher/url_launcher.dart';


class BGImg extends StatelessWidget{

BGImg({@required this.company, @required AnimationController? controller})
    : animation = new CompanyDetailsIntroAnimation(controller);

final Company? company;
final CompanyDetailsIntroAnimation? animation;
var link = "https://www.linkedin.com/in/suganya-murugan-83360b261";
var DPS = "Detailed";

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
              child: _createContent(context),
          ),
        )
      ],
    );
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
      body: new AnimatedBuilder(animation: animation!.controller!,
          builder: _createAnimation)
  );
}

@override
Widget _createContent(BuildContext context) {
  return new SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _createLogoAvatar(),

        Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
          child: Container(color: Colors.brown,height: 0.3,width: 900,),
        ),
         _createAboutCompany(),
         _createCourseScroller(context),
           // onTap: () {
           //   Navigator.push(context,
           //       MaterialPageRoute(builder: (context) => DetailedAnimator()));
           // })
      ],
    ),
  );
}

Widget _createLogoAvatar() {
  return new Transform(transform: new Matrix4.diagonal3Values(
      animation!.avatarSize!.value, animation!.avatarSize!.value, 1.0),
    alignment: Alignment.center,
    child: Column(
      children: [
        new Container(
          width: double.infinity,
          height: 120.0,
          margin: EdgeInsets.only(top: 32.0, left: 17.0),
          padding: EdgeInsets.all(2.0),
          child: Row(
            children: [
              new Image.asset(company!.logo!,width: 100,height: 110,fit: BoxFit.cover,),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text("SUGANYA M",
                      style: TextStyle(fontSize: 30.0 * animation!.avatarSize!.value + 2.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    SizedBox(height: 2.0,),
                    Row(
                      children: [
                        new Text("Phone No. :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        new Text("+91 7845503839",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                      ],
                    ),
                    SizedBox(height: 2.0,),
                    Row(
                      children: [
                        new Text("Address: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        new Text("Trivandrum,Kerala,India",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  new Text("Email Address: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  new Text("suganya000141@gmail.com",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                ],
              ),
              SizedBox(height: 4.0),
              InkWell(
                child: Row(
                  children: [
                    new Text("LinkedIn: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    RichText(text: TextSpan(
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,),
                      text: "Suganya Murugan",
                      recognizer:TapGestureRecognizer()..onTap = () async{
                          var url = 'https://www.linkedin.com/in/suganya-murugan-83360b261';
                         try{
                           if(await launch(url)){
                             await launch(url);
                           }
                         }catch(e){
                           print(e.toString());
                         }
                           // if(await canLaunchUrl(Uri.parse(url))) {
                           //   await launchUrl(Uri.parse(url));
                           // }else{
                           //   throw "Can't load link";
                           // }
                      }
                    ),
                    ),
                    new Text("  -  url",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                    // new Text(" ID Link",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _createAboutCompany(){
  return  Padding(
    padding: EdgeInsets.only(top: 4.0,left: 14.0,right: 14.0),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Profile Summary",style: TextStyle(
            color: Colors.white.withOpacity(animation!.nameOpacity!.value),
            fontSize: 28.0 * animation!.avatarSize!.value + 2.0,
            fontWeight: FontWeight.bold
        ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(
          color: Colors.white.withOpacity(0.79),
          endIndent: 130,
        ),
        SizedBox(
          height: 10.0,
        ),
         Text(company!.about!,
          style: TextStyle(
              color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
              height: 1.4
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.topRight,
          child:  Text("Swipe Left",
            style: TextStyle(
                color: Colors.white,
                height: 1.4,
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _createCourseScroller(BuildContext context) {
  return  Padding(padding: EdgeInsets.only(top: 14.0),
    child: Transform(transform:  Matrix4.translationValues(animation!.courseScrollerXTranslation!.value, 0.0, 0.0),
      child:  SizedBox.fromSize(
          size:  Size.fromHeight(250.0),
          child:
          // ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.symmetric(horizontal: 7.0),
          //     itemCount: company!.courses!.length,
          //     itemBuilder: (BuildContext context, int index){
                //var course = company!.courses![index];
                //return new CourseCard(course);
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/profile_summary.webp"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Detailed Profile Summary", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailedAnimator()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/personal_projects.webp"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Personal Projects", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PersonalAnimator()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/certificate.jpg"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Certificate", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CertificateAnimator()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/education.webp"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Education", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EducationAnimator()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/work_experience.jpg"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Work Experience", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WorkAnimator()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/software_skills.jpeg"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Software Skills", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SoftwareAnimator()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: 175.0,
                    padding:  EdgeInsets.all(8.0),
                    margin:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius:  BorderRadius.circular(12.0),
                        boxShadow: <BoxShadow>[
                           BoxShadow(
                              color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                          )
                        ]
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 3, child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              Image.asset("assets/languages.webp"),
                            ],
                          ),
                        )),
                        Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Languages", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        )),
                        Flexible(flex: 1, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                          child:  Text("Tap to View", style: TextStyle(
                              color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LanguageAnimator()));
                  },
                ),
              ],
            ),
          ),
        //}),
      ),
    ),
  );
}

}



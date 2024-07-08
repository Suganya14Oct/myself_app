import 'package:flutter/material.dart';
import 'package:myself/animation/ProFourAnimator.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;
import 'package:myself/animation/detailed_animator.dart';
import 'package:myself/animation/project_one_animator.dart';
import 'package:myself/animation/project_three_animator.dart';
import 'package:myself/animation/project_two_animator.dart';

class WorkExperience extends StatelessWidget {

  WorkExperience({@required this.company, @required AnimationController? controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

  final Company? company;
  final CompanyDetailsIntroAnimation? animation;

  @override
  Widget _createAnimation(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(opacity: animation!.bgdropOpacity!.value,
          child: Image.asset(company!.backdropPhoto.toString(),fit: BoxFit.cover)),
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
  Widget _createContent(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
            child: Container(color: Colors.brown,height: 0.3,width: 900,),
          ),
          _createAboutCompany(),
          _createCourseScroller(context),
          _createAboutCompany2(),
          _createCourseScroller2(context)
        ],
      ),
    );
  }

  Widget _createAboutCompany() {
    return Padding(
      padding: EdgeInsets.only(top: 17.0,left: 14.0,right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text("Work Experience",style: TextStyle(
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
          new Text("Worked as Flutter Developer in Profizio IT Solutions, Elcot It Park, Madurai.(From Feb 22 to Dec 23) Worked in 2+ projects.",
            style: TextStyle(
                color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                height: 1.4, fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.topRight,
            child: new Text("Swipe Left",
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
    return new Padding(padding: EdgeInsets.only(top: 14.0),
    child: Transform(transform: new Matrix4.translationValues(animation!.courseScrollerXTranslation!.value, 0.0, 0.0),
    child: new SizedBox.fromSize(
      size: new Size.fromHeight(250.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              child: Container(
                width: 175.0,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: new BorderRadius.circular(12.0),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                      )
                    ]
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(flex: 3, child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                           Image.asset("assets/image.png"),
                        ],
                      ),
                    )),
                    Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                      child: new Text("Project 1", style: TextStyle(
                          color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                      ),),
                    )),
                    Flexible(flex: 1, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                      child: new Text("Tap to View", style: TextStyle(
                          color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                      ),),
                    ))
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProOneAnimator()));
              },
            ),
            InkWell(
              child: Container(
                width: 175.0,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: new BorderRadius.circular(12.0),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                      )
                    ]
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(flex: 3, child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Image.asset("assets/payroll.jpg"),
                        ],
                      ),
                    )),
                    Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                      child: new Text("Project 2", style: TextStyle(
                          color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                      ),),
                    )),
                    Flexible(flex: 1, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                      child: new Text("Tap to View", style: TextStyle(
                          color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                      ),),
                    ))
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProTwoAnimator()));
              },
            ),
            InkWell(
              child: Container(
                width: 175.0,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: new BorderRadius.circular(12.0),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                      )
                    ]
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(flex: 3, child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Image.asset("assets/judiciary.jpg"),
                        ],
                      ),
                    )),
                    Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                      child: new Text("Project 3", style: TextStyle(
                          color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                      ),),
                    )),
                    Flexible(flex: 1, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                      child: new Text("Tap to View", style: TextStyle(
                          color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                      ),),
                    ))
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProThreeAnimator()));
              },
            ),
          ],
        ),
      ),
    ),
    ));
  }

  Widget _createAboutCompany2() {
    return Padding(
      padding: EdgeInsets.only(top: 17.0,left: 14.0,right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.white.withOpacity(0.79),
            //endIndent: 130,
          ),
          SizedBox(height: 20.0,),
          new Text("Worked as Flutter Developer in A2Z AlphabetSolutionz, TechnoPark Phase 3, Trivandrum.(From Jan 24 to present) Worked in 1 project.",
            style: TextStyle(
                color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
                height: 1.4,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCourseScroller2(BuildContext context) {
    return new Padding(padding: EdgeInsets.only(top: 14.0),
        child: Transform(transform: new Matrix4.translationValues(animation!.courseScrollerXTranslation!.value, 0.0, 0.0),
          child: new SizedBox.fromSize(
            size: new Size.fromHeight(250.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      width: 175.0,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: new BorderRadius.circular(12.0),
                          boxShadow: <BoxShadow>[
                            new BoxShadow(
                                color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0
                            )
                          ]
                      ),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(flex: 3, child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: [
                                Image.asset("assets/gym.jpg"),
                              ],
                            ),
                          )),
                          Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                            child: new Text("Project 4", style: TextStyle(
                                color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                            ),),
                          )),
                          Flexible(flex: 1, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                            child: new Text("Tap to View", style: TextStyle(
                                color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                            ),),
                          ))
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profouranimator()));
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new AnimatedBuilder(animation: animation!.controller!,
            builder: _createAnimation)
    );
  }
}

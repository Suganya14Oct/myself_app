import 'package:flutter/material.dart';
import 'package:myself/animation/animation.dart';
import 'package:myself/model/company.dart';
import 'dart:ui' as ui;
import 'package:url_launcher/url_launcher.dart';

class Certicate extends StatelessWidget {

  Certicate({@required this.company, @required AnimationController? controller})
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
            new Text("Certificate",style: TextStyle(
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
              child: Text("Certificate Link provided in the url icon",style: TextStyle(
                color: Colors.white.withOpacity(animation!.nameOpacity!.value),
                fontSize: 14.0 * animation!.avatarSize!.value + 2.0,
                //fontWeight: FontWeight.bold
              ),),
            ),
            Padding(padding: EdgeInsets.only(top: 14.0),
              child: Transform(transform: new Matrix4.translationValues(0.0, 0.0, animation!.courseScrollerXTranslation!.value),
              child: new SizedBox.fromSize(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(children:[
                          Container(
                            height: 175.0,
                            width: 158,
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
                                      Image.asset("assets/flutter_course.jpeg"),
                                      new Positioned(
                                        bottom: 00.0,
                                        child: Material(
                                            color: Colors.brown.shade50,
                                            type: MaterialType.circle,
                                            child: Row(
                                              children: [
                                                new IconButton( icon: Icon( Icons.link),
                                                  onPressed: () async {

                                                  var url = "https://www.udemy.com/certificate/UC-1341bfa0-0440-4217-8dc5-2e0edea0c33a/";
                                                  try{
                                                    if(await launch(url)){
                                                      await launch(url);
                                                    }
                                                  }catch(e){
                                                    print(e.toString());
                                                  }
                                                    // if(await canLaunchUrl(Uri.parse("https://www.udemy.com/certificate/UC-1341bfa0-0440-4217-8dc5-2e0edea0c33a/"))) {
                                                    //   await launchUrl(Uri.parse("https://www.udemy.com/certificate/UC-1341bfa0-0440-4217-8dc5-2e0edea0c33a/"));
                                                    // }
                                                  },
                                                ),
                                                //Text("Git Link",style: TextStyle(color: Colors.black,fontSize: 8),)
                                              ],
                                            )
                                        ),
                                        right: 0,
                                      )
                                    ],
                                  ),
                                )),
                                Flexible(flex: 3, child: Padding(padding: const EdgeInsets.only(top: 14.0, left: 4.0, right: 4.0),
                                  child: new Text("Flutter & Dart - The Complete Flutter App Development Course", style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ]
                        ),
                        Container(
                          height: 175.0,
                          width: 158,
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
                              Flexible(flex: 1, child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Stack(
                                  children: [
                                    Text("Certificate no.",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),)
                                  ],
                                ),
                              )),
                              Flexible(flex: 6, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                child: Column(
                                  children: [
                                    new Text("UC-1341bfa0-0440-4217-8dc5-2e0edea0c33a", style: TextStyle(
                                        color: Colors.black.withOpacity(0.85),
                                        //fontWeight: FontWeight.bold
                                    ),),
                                    new Text("Reference no.0004", style: TextStyle(
                                      color: Colors.black.withOpacity(0.85),
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
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

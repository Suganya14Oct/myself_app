
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myself/animation/animation.dart';
import 'dart:ui' as ui;
import 'package:myself/model/company.dart';
import 'package:myself/home/course_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalProjects extends StatelessWidget {

  PersonalProjects({@required this.company, @required AnimationController? controller})
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
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Personal Projects",style: TextStyle(
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
            Container(
              child: Text("Git Link provided in the url icon",style: TextStyle(
                  color: Colors.white.withOpacity(animation!.nameOpacity!.value),
                  fontSize: 14.0 * animation!.avatarSize!.value + 2.0,
                  //fontWeight: FontWeight.bold
              ),),
              //alignment: Alignment.topRight,
            ),
            Padding(padding: EdgeInsets.only(top: 14.0),
              child: Transform(transform:  Matrix4.translationValues(0.0, 0.0, animation!.courseScrollerXTranslation!.value),
              child:  SizedBox.fromSize(
                //size: new Size.fromHeight(.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(children:[
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
                                  Flexible(flex: 3, child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/myself.webp"),
                                         Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                            color: Colors.brown.shade50,
                                            type: MaterialType.circle,
                                            child: Row(
                                              children: [
                                                 IconButton( icon: Icon( Icons.link),
                                                  onPressed: () async {
                                                  var url = "https://github.com/Suganya14Oct/Project-Myself/tree/master";
                                                  try{
                                                    if(await launch(url)){
                                                      await launch(url);
                                                    }
                                                  }catch(e){
                                                    print(e.toString());
                                                  }
                                                    // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/Project-Myself/tree/master"))) {
                                                    //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/Project-Myself/tree/master"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Myself", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created an app about myself. I have my resume as an app using animations.", style: TextStyle(
                                      color: Colors.black.withOpacity(0.85),
                                      //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/google_maps.jpeg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                    var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Google_maps";

                                                    try{
                                                      if(await launch(url)){
                                                        await launch(url);
                                                      }
                                                    }catch(e){
                                                      print(e.toString());
                                                    }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Google_maps"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Google_maps"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Show Map", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created an app based on google maps.", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/screen_orientation.png"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {

                                                      var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Jokes_app_orientation";

                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Jokes_app_orientation"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Jokes_app_orientation"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Screen Orientation", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created a simple app based on screen Orientation(portrait and Lanscape)", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/provider.jpg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/flutter-pro";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/flutter-pro"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/flutter-pro"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Provider", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created an app based on State Management using Provider", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/mortgage.jpg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Mortgage";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Mortgage"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Mortgage"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Mortgage", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created Mortgage app with Mortgage Calculations", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/movie.jpg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Movies_app";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Movies_app"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Movies_app"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Movie", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Developed a simple Front-end like a movie App", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/fun.jpeg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Jokes_app_orientation";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Jokes_app_orientation"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Jokes_app_orientation"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Simply Fun(Game)", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created a simple app for fun games", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/weather.jpg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Weather_forecast";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Weather_forecast"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/Weather_forecast"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Weather", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created a weather app using Json Rest ApIs (API from open Weather)", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                        Image.asset("assets/quakes.jpeg"),
                                        new Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  new IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/All-Projects/tree/master/lib/quakes_map_app";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/quakes_map_app"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/All-Projects/tree/master/lib/quakes_map_app"));
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
                                  Flexible(flex: 2, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child: new Text("Quakes", style: TextStyle(
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
                                Flexible(flex: 1, child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    children: [
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child: new Text("Created a quakes app which is used to identify the earth Quakes data/information using API integration", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  ),),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(children:[
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
                                  Flexible(flex: 3, child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/gym.jpg"),
                                        Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/gymsoft_show";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/Project-Myself/tree/master"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/Project-Myself/tree/master"));
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
                                  Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child:  Text("GymSoft_Show", style: TextStyle(
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
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child:  Text("Created an app for gym users without Api Integration.", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  )),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(children:[
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
                                  Flexible(flex: 3, child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/commerce.png"),
                                        Positioned(
                                          bottom: 00.0,
                                          child: Material(
                                              color: Colors.brown.shade50,
                                              type: MaterialType.circle,
                                              child: Row(
                                                children: [
                                                  IconButton( icon: Icon( Icons.link),
                                                    onPressed: () async {
                                                      var url = "https://github.com/Suganya14Oct/commerce";
                                                      try{
                                                        if(await launch(url)){
                                                          await launch(url);
                                                        }
                                                      }catch(e){
                                                        print(e.toString());
                                                      }
                                                      // if(await canLaunchUrl(Uri.parse("https://github.com/Suganya14Oct/Project-Myself/tree/master"))) {
                                                      //   await launchUrl(Uri.parse("https://github.com/Suganya14Oct/Project-Myself/tree/master"));
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
                                  Flexible(flex: 2, child: Padding(padding:  EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                    child:  Text("E-Commerce", style: TextStyle(
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
                                      Text("Short Description",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                )),
                                Flexible(flex: 6, child: Padding(padding: EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
                                  child:  Text("Created E-Commerce App without API Integration", style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                    //fontWeight: FontWeight.bold
                                  )),
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

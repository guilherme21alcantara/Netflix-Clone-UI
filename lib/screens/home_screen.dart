import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netflixui/json/home_json.dart';
import 'package:netflixui/screens/onload.dart';
import 'package:netflixui/screens/pesquisar_screen.dart';
import 'package:netflixui/screens/video_detalhes_screen.dart';
import 'package:netflixui/screens/video_player.dart';
import 'package:netflixui/theme/AppColors.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final teste = ScrollController();
  var _controller = ScrollController();
  bool con = false;
  ScrollController? controller;
  @override
  void initState() {
     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
    ));
    // TODO: implement initState
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
   var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return FutureBuilder(builder:(BuildContext context, AsyncSnapshot<String> snapshot)
    {
      return
      Scaffold(
      backgroundColor: backgroundpt,
      resizeToAvoidBottomInset: false,
      body: isPortrait ==true?getBody(): getBody(),
      
      
    );
    } );
    
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Container(child: ListView(
      controller: controller,
      // controller: teste,
      children: [
        GestureDetector(
          child: Stack(
            children: [
              Container(
                width: size.height - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 480,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/banner_1.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 480,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.85),
                                  Colors.black.withOpacity(0.0)
                                ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter),
                          ),
                        ),
                        Container(
                          height: 480,
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/titulo_1.webp",
                                width: 300,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Clever",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          shape: BoxShape.circle),
                                    ),
                                    Text(
                                      "irreverent",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          shape: BoxShape.circle),
                                    ),
                                    Text(
                                      "exciting",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "My list",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 10),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: ()async  {
                             
                            await
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    reverseDuration:
                                        Duration(milliseconds: 100),
                                    child: VideoPlayerScreen(
                                        video: minhaLista[1])));
                         
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: playButtonColor,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 13, top: 2, bottom: 2),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "know more",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getLista(minhaLista, "My list", 100, 160),
                        getLista(popularesLista, "Popular Netflix", 100, 160),
                        getLista(emAltaLista, "on the rise", 100, 160),
                        getLista(originalLista, "Netflix Originals", 160, 300),
                        getLista(animesLista, "Animes", 100, 160),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/logo.ico",
                                  width: 35,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  size: 28,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PesquisarScreen()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Series",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Films",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "My list",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            if (con) {
              Navigator.pop(context);
              setState(() {
                con = false;
              });
            }
          },
        )
      ],
    ),);
  }

  Column getLista(
      List<dynamic> lista, String titulo, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            titulo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
                children: List.generate(lista.length, (index) {
              return GestureDetector(
                onTap: () {
                    
                  _onButtonPressed(lista[index]);
                  setState(() {
                    con = true;
                    print("aaaaaaaa");
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: AssetImage(lista[index]['img']),
                          fit: BoxFit.cover)),
                ),
              );
            })),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void _scrollListener() {
    print(controller!.position.extentAfter);
    if (controller!.position.extentAfter < 1000) {
      setState(() {
        if (con) {
          for (int i = 0; i < 1; i++) {
            Navigator.pop(context);
          }
          con = false;
        }
      });
    }
  }

  void _onButtonPressed(final dynamic video) async {
    
    showBottomSheet(
      
        elevation: 0,
        context: context,
        backgroundColor: Color(0xff2b2b2b),
      //  barrierColor: Colors.transparent,

        // use the shape border property to give it rounder corners
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (builder) {
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: AssetImage(video["detalhes"]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        video["detalhes"]["titulo"],
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                         if (con) {
              Navigator.pop(context);
              setState(() {
                con = false;
              });
            }
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff515151),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(Icons.close)),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 5),
                                  child: Container(
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          video["detalhes"]["ano"],
                                          style: TextStyle(
                                              fontSize: 15, color: greycolor),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: redcolor,
                                              borderRadius:
                                                  BorderRadius.circular(22)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              video["detalhes"]
                                                  ["classificacao"],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          video["detalhes"]["qtdeTemporada"],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  video["detalhes"]["descricao"],
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {

                           onLoadingH(context, video);
//                               Navigator.push(
//   context,
//   PageRouteBuilder(pageBuilder: (_, __, ___) => ),
// );
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => VideoPlayerScreen(
                              //               video: video,
                              //             )));
/*VideoPlayerScreen(
                                            video: video,
                                          ) */
                              /*


                              Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.scale,
                                          curve: Curves.bounceOut,
                                          alignment: Alignment.topCenter,
                                          duration:  Duration(milliseconds: 200),
                                          reverseDuration:
                                              Duration(milliseconds: 200),
                                          child:
                                              VideoPlayerScreen(video: video)))
                                  .then((value) {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitDown,
                                  DeviceOrientation.portraitUp,
                                ]);



                              });

                               */
                              
                            },
                            child: Container(
                              width: 200,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                MdiIcons.download,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Download",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 14),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => VideoPlayerScreen(
                                            video: video,
                                          )));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.play_arrow_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Preview",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Episodes and information"),
                        leading: Icon(
                          Icons.info_outline,
                          size: 22,
                        ),
                        trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18,
                              )
                            ]),
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VideosDetalhesScreen(
                                        video: video,
                                      )))
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

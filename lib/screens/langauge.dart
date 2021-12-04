import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:netflixui/json/em_breve_json.dart';
import 'package:netflixui/json/languages_json.dart';
import 'package:video_player/video_player.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  void initState() {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    super.initState();
  }

  void playcontinue() {
    if (widget.controller.value.isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 28.0,
            bottom: 15,
          ),
          child: Column(
            children: [
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Audio",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: ListView.builder(
                        itemCount: languageJson.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10),
                            child: Row(

                              children: [
                                languageJson[position]["titulo"] == "English" ?
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Icon(Icons.check, size: 32,),
                                ) :SizedBox(width: 40,),

                                Text(
                                  languageJson[position]["titulo"],
                                  style: TextStyle(fontSize: 20.0, color: languageJson[position]["titulo"] == "English" ? Colors.white : Colors.grey, fontWeight: languageJson[position]["titulo"] == "English" ? FontWeight.bold : FontWeight.normal),
                                ),
                              ],
                            ),




                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subtitles",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.66,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),


                        itemCount: subtitleJson.length,
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10),
                            child: Row(

                              children: [
                                subtitleJson[position]["titulo"] == "English" ?
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Icon(Icons.check, size: 32,),
                                ) :SizedBox(width: 40,),

                                                 Text(
                                  subtitleJson[position]["titulo"],
                                  style: TextStyle(fontSize: 20.0, color: subtitleJson[position]["titulo"] == "English" ? Colors.white : Colors.grey, fontWeight: subtitleJson[position]["titulo"] == "English" ? FontWeight.bold : FontWeight.normal),
                                ),
                              ],
                            ),




                          );
                        },
                      ),
                    ),
                  ],
                ),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();

                      playcontinue();


                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {

                      Navigator.of(context).pop();
                      playcontinue();



                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Apply",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

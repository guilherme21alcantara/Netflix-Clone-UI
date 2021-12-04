import 'dart:async';

import 'package:flutter/material.dart';

import 'package:netflixui/screens/onload.dart';
import 'package:netflixui/screens/video_player.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen()),
                            );
    });
  }

  @override
  Widget build(BuildContext context,) {
    return Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
            SizedBox(
              width: 50,
            ),
            //show this if state is loading
            Text("Loading...",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),),
          ],
        ),
      );
  }
}

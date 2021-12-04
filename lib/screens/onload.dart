
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixui/screens/load.dart';
import 'package:netflixui/screens/video_player.dart';

onLoadingH(BuildContext context, dynamic video) {
  
  

  Future.delayed(Duration(seconds: 1), () async {
    
   Navigator.push(
    context, CupertinoPageRoute(builder: (context) =>VideoPlayerScreen(
                                            video: video,
                                          ))) ; 
    }
  );
}

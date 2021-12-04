import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:netflixui/video/widgets/player_controls/player_control.dart';

import 'package:netflixui/video/widgets/player_life_cicle/player_life_circle.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({this.video, Key? key}) : super(key: key);

  final dynamic video;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}


class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {




  @override
  bool get wantKeepAlive => true;


  late VideoPlayerController vcontroller;
  late bool controlVisible;
  late Timer timer;
  bool isLoading = true;
  double a = 75.0;
  
  @override
  void initState() {

    startTimer();
    controlVisible = true;

    vcontroller =
        VideoPlayerController.asset(widget.video["detalhes"]["videoUrl"]);

    
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    autoHide();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    vcontroller.dispose();
    timer.cancel();
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  
  void handlerGestur() {
    setState(() {
      
    
    });
   
  }

  void handlerGesture() {
    setState(() {
      controlVisible = !controlVisible;
      
      if(a==75.0)
      {
        
        a=0;
      }
      else
      {
        a=75.0;
      }
    });
    autoHide();
  }

  void autoHide() {
    if (controlVisible) {
      timer = Timer(
          Duration(seconds: 5), () => setState(() => controlVisible = false));
    } else {
      timer.cancel();
    }
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 3), (t) {
      setState(() {
        isLoading = false; //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = 0.75;
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? Center(
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
      )
          
          :Stack(
        fit: StackFit.expand,

        children: <Widget>[
          InteractiveViewer(
            
            child: PlayerLifeCycle(
            vcontroller,
                (BuildContext context, VideoPlayerController controller) =>
                AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: a),
                    child: 
                  
                    VideoPlayer(vcontroller),
                  ),
                ),
          ),minScale: 0.1,maxScale: 1.2,),
          
          GestureDetector(
            child: PlayerControl(
              controller: vcontroller,
              visible: controlVisible,
              title: widget.video['detalhes']["titulo"],
            ),
      
            onTap: ()
            {
              handlerGestur();
              handlerGesture();
            }
            ,
          )
        ],
      )
    );
  }

}

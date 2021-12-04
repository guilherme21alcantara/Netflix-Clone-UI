import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflixui/screens/langauge.dart';
import 'package:video_player/video_player.dart';

class PlayerControl extends StatefulWidget {
  final VideoPlayerController controller;
  final String title;
  final bool visible;



   PlayerControl(
      {Key? key,
      required this.title,
      required this.controller,
      required this.visible})
      : super(key: key);

  @override
  _PlayerControlState createState() => _PlayerControlState();
}

class _PlayerControlState extends State<PlayerControl>

    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {




  @override
  bool get wantKeepAlive => true;




  @override
  void initState() {


    super.initState();
    Timer(Duration(milliseconds: 500), init);
  }

  @override
  void dispose() {

    super.dispose();
  }

  void init() {
    if (mounted)
      widget.controller.addListener(() {
        setState(() {});
      });
  }

  void replay(double min, double current) {
    double anchor = current - 10000;
    widget.controller
        .seekTo(Duration(milliseconds: (anchor < min ? min : anchor).round()));
  }

  void forward(double max, double current) {
    double anchor = current + 10000;
    widget.controller
        .seekTo(Duration(milliseconds: (anchor > max ? max : anchor).round()));
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
    Duration? duration = widget.controller != null &&
            widget.controller.value != null &&
            widget.controller.value.duration != null
        ? widget.controller.value.duration
        : null;
    Duration? position =
        widget.controller != null && widget.controller.value != null
            ? widget.controller.value.position
            : null;
    int timeDuration = duration != null && position != null
        ? duration.inMilliseconds - position.inMilliseconds
        : 0;
    Duration? timeline = duration != null && position != null
        ? Duration(milliseconds: (timeDuration < 0 ? 0 : timeDuration))
        : null;
    String durationText =
        timeline != null ? timeline.toString().split('.').first : '';
    final Size screenSize = MediaQuery.of(context).size;
    double currentValue = position != null
        ? widget.controller.value.position.inMilliseconds.toDouble()
        : 0.0;
    final double minValue = 0.0;
    double? maxValue = duration != null
        ? widget.controller.value.duration.inMilliseconds.toDouble()
        : 0.0;
    return 
    
    AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: screenSize.height,
      width: screenSize.width,
      color: Color.fromRGBO(0, 0, 0, 0.3),
      padding:
          EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0, top: 10.0),
      child: Opacity(
        opacity: widget.visible ? 1 : 0,
        child: widget.visible
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: screenSize.width,
                    height: 22.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[




                        IconButton(
                            padding: EdgeInsets.all(0.0),
                            color: Colors.white,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                              Navigator.of(context).pop();
                            }),
                        Container(
                          width: screenSize.width - 100.0,
                          child: Center(
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    height: 268.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          color: Colors.white,
                          iconSize: 40.0,
                          icon: Image.asset("assets/icons/rewind.png", color: Colors.white,),
                          onPressed: () => replay(minValue, currentValue),
                        ),
                        IconButton(
                          color: Colors.white,
                          iconSize: 80.0,
                          icon: Icon(widget.controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow),
                          onPressed: playcontinue,
                        ),
                        IconButton(
                          color: Colors.white,
                          iconSize: 40.0,
                          icon:  Image.asset("assets/icons/fast.png", color: Colors.white,),
                          onPressed: () => forward(maxValue, currentValue),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: screenSize.width - 90.0,
                        child: Slider(
                          activeColor: Color.fromRGBO(219, 0, 0, 1.0),
                          inactiveColor: Color.fromRGBO(86, 77, 77, 1.0),
                          value:
                              currentValue > maxValue ? maxValue : currentValue,
                          onChanged: (double value) => widget.controller
                              .seekTo(Duration(milliseconds: value.round())),
                          min: minValue,
                          max: maxValue,
                        ),
                      ),
                      Text(
                        durationText,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/speed.png",
                          width: 22,
                          height: 22,
                          color: Colors.white,
                        ),
                        Text('Speed (1x)'),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/icons/unlock.png",
                          width: 22,
                          height: 22,
                          color: Colors.white,
                        ),
                        Text('Block'),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/icons/episode.png",
                          width: 22,
                          height: 22,
                          color: Colors.white,
                        ),
                        Text('Episodes'),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/icons/language.png",
                          width: 22,
                          height: 22,
                          color: Colors.white,
                        ),
                        GestureDetector(
                            onTap: () {
                              if (widget.controller.value.isPlaying) {
                                widget.controller.pause();
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LanguageScreen(controller: widget.controller,)));






                            },
                            child: Text('language and subtitles')),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/icons/next.png",
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        Text('Next.ep'),
                      ],
                    ),
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netflixui/screens/video_player.dart';

class DetalhesVideo extends StatelessWidget {
  final dynamic video;
  final Color cor;
  final Color corClassificacao;
  final Size size;
  const DetalhesVideo({ this.video, required this.cor, required this.corClassificacao, required this.size }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          video["titulo"],
          style: TextStyle(
            height: 1.4,
            fontSize: 28,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text(
              video["relevancia"],
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 15,),
            Text(
              video["ano"],
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 15,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: corClassificacao,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  video["classificacao"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(width: 15,),
            Text(
              video["qtdeTemporada"],
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: 12,),
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        VideoPlayerScreen(
                          video: video,
                        )));
          },
          child: Container(
            width: size.width,
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
                SizedBox(width: 5,),
                Text(
                  "Play",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 12,),
        Container(
          width: size.width,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.download,
                color: Colors.white,
              ),
              SizedBox(width: 5,),
              Text(
                "Download T1:E1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Text(
          "T1:E1 \"Episode 1\"",
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.74,
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.74,
                    height: 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    height: 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: cor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
            "timer: 35m",
            style: TextStyle(color: Colors.grey, fontSize: 10),
            )
          ],
        ),
        SizedBox(height: 8,),
        Text(
          video["descricao"],
          style: TextStyle(
            height: 1.4, color: Colors.white.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 8,),
        Text(
          "Cast: " + video["elenco"],
          style: TextStyle(
            fontSize: 13,
            height: 1.4, color: Colors.grey.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
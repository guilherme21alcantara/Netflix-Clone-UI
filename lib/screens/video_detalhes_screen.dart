import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netflixui/json/home_json.dart';
import 'package:netflixui/json/videos_json.dart';
import 'package:netflixui/theme/AppColors.dart';
import 'package:netflixui/widgets/botao_detalhes.dart';
import 'package:netflixui/widgets/detalhes_video.dart';
import 'package:netflixui/widgets/episodios.dart';
import 'package:netflixui/widgets/video.dart';



class VideosDetalhesScreen extends StatefulWidget {
  final dynamic video;
  const VideosDetalhesScreen({ Key? key, this.video }) : super(key: key);

  @override
  _VideosDetalhesScreenState createState() => _VideosDetalhesScreenState();
}

class _VideosDetalhesScreenState extends State<VideosDetalhesScreen> {
  late Color cor;
  late Color corClassificacao;
  late List episodios;

  @override
  void initState() {
    super.initState();
    cor = widget.video["detalhes"]["cor"];
    corClassificacao = widget.video["detalhes"]["corClassificacao"];
    episodios = widget.video["detalhes"]["episodios"];
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            
          //  Navigator.pop(context);
          },
        ),
        actions: [

        ],
      ),
      body: _Body(
        video: widget.video,
        cor: cor,
        corClassificacao: corClassificacao,
        episodios: episodios,
      ),
    );
  }


}

class _Body extends StatefulWidget {
  final dynamic video;
  final Color cor;
  final Color corClassificacao;
  final List episodios;

  const _Body({ Key? key, this.video, required this.cor, required this.corClassificacao, required this.episodios }) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool classificacao = false;
  int activeItem = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        VideoDetalhes(video: widget.video["detalhes"],),

          Container(
            height: size.height - 310,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetalhesVideo(
                      video: widget.video["detalhes"],
                      cor: widget.cor,
                      corClassificacao: widget.corClassificacao,
                      size: size,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BotaoDetalhe(titulo: "My list", icone: Icons.add, onTap: (){}),
                        BotaoDetalhe(
                          titulo: "Rating",
                          icone: classificacao ? MdiIcons.thumbUpOutline : MdiIcons.thumbUp,
                          onTap: () {
                            setState(() {
                              classificacao = !classificacao;
                            });
                          },
                        ),
                        BotaoDetalhe(titulo: "Shared", icone: Icons.share,onTap: (){},),

                      ],
                    ),
                    SizedBox(height: 30,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(listaMenu.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                activeItem = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          width: 4,
                                          color:
                                          activeItem == index ?
                                          redcolor.withOpacity(0.8)
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        listaMenu[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: activeItem == index ?
                                            Colors.white.withOpacity(0.9)
                                                : Colors.white.withOpacity(0.5),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 30,),
                    if (activeItem == 0)
                      Episodios(episodios: widget.episodios, size: size,)
                    else if (activeItem == 1)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: size.width - 30,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        widget.video['detalhes']['img'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 75,
                                  left: size.width * 0.4,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.video['detalhes']['descricao'],
                              style: TextStyle(height: 1.4, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        height: 550,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(4),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: semelhantesLista.length,
                          itemBuilder: (context, index){
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 110,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image: AssetImage(semelhantesLista[index]['img']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
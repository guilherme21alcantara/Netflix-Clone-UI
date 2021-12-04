import 'package:flutter/material.dart';
import 'package:netflixui/json/pesquisar_json.dart';
import 'package:netflixui/screens/video_detalhes_screen.dart';

class PesquisarScreen extends StatefulWidget {
  @override
  _PesquisarScreenState createState() => _PesquisarScreenState();
}

class _PesquisarScreenState extends State<PesquisarScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
            Navigator.pop(context);
          },
        ),
        actions: [],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.35),
                ),
                child: Row(
                  children: [
                    Container(
                      width: size.width - (size.width * 0.25),
                      height: 35,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search by series, movie, genre,...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_voice_rounded,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body() : super();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
              child: Text(
                "Main searches",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: List.generate(pesquisarJson.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => VideosDetalhesScreen(
                                  video: pesquisarJson[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.9,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            pesquisarJson[index]['img'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width * 0.4,
                                  child: Text(
                                    pesquisarJson[index]['titulo'],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                color: Colors.transparent,
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
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

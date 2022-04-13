import 'package:flutter/material.dart';

import 'package:netflixui/json/em_breve_json.dart';
import 'package:netflixui/screens/pesquisar_screen.dart';
import 'package:netflixui/theme/AppColors.dart';
import 'package:netflixui/widgets/video.dart';

class EmBreveScreen extends StatefulWidget {
  @override
  _EmBreveScreenState createState() => _EmBreveScreenState();
}

class _EmBreveScreenState extends State<EmBreveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpt,
      appBar: AppBar(
        backgroundColor: backgroundpt,
        elevation: 0,
        title: const Text(
          "Coming soon",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PesquisarScreen()));
            },
          ),
        ],
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body() : super();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(emBreveJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VideoDetalhes(
                      video: emBreveJson[index],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            emBreveJson[index]['titulo_img'],
                            width: 120,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.notifications_none_outlined),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "receive notice",
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Icon(Icons.info_outline),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "know more",
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 15),
                      child: Text(
                        emBreveJson[index]['data'],
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: Text(
                        emBreveJson[index]['titulo'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Text(
                        emBreveJson[index]['descricao'],
                        style: TextStyle(
                            height: 1.4, color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            emBreveJson[index]['categorias'].length,
                            (indexCategoria) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  emBreveJson[index]['categorias']
                                      [indexCategoria],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              (indexCategoria <
                                      emBreveJson[index]['categorias'].length -
                                          1)
                                  ? Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: emBreveJson[index]['cor'],
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : Container(),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'package:netflixui/screens/pesquisar_screen.dart';
import 'package:netflixui/theme/AppColors.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen() : super();

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpt,
      appBar: AppBar(
        backgroundColor: backgroundpt,
        elevation: 0,
        title: const Text(
          "Downloads",
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
    return ListView(
      children: [
        Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(Icons.settings, color: Colors.white.withOpacity(0.8),),
                SizedBox(width: 10,),
                Text(
                  "Smart Downloads",
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Know the Downloads for you",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "We'll download a personalized selection of movies and series so you'll always have a title to watch on your mobile.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: Image.asset("assets/images/img_download.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(
                    child: Text(
                      "TO SET UP",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 35, bottom: 35),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2), 
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(
                    child: Text(
                      "Find a title to download",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
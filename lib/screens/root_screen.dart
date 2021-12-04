import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netflixui/json/root_app_json.dart';
import 'package:netflixui/screens/download_screen.dart';
import 'package:netflixui/screens/em_breve_screen.dart';
import 'package:netflixui/screens/home_screen.dart';
import 'package:netflixui/theme/AppColors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  late TabController tabController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
    ));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpt,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomeScreen(),
        EmBreveScreen(),
        DownloadScreen(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: backgroundpt),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return FlatButton(

              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    activeTab == index
                        ? items[index]['iconActive']
                        : items[index]['icon'],
                    color: activeTab == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    items[index]['titulo'],
                    style: TextStyle(
                        color: activeTab == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        fontSize: 10),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

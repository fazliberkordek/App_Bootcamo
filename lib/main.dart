import 'package:flutter/material.dart';
import 'next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppExt(),
    );
  }
}


class MyAppExt extends StatefulWidget {
  MyAppExt({Key? key}) : super(key: key);
  

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonName = 'Click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('The Bootcamp Application Demo'),
        ),
        body: Center(
            child: currentIndex == 0
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color.fromARGB(177, 174, 163, 41),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              buttonName = 'Clicked';
                            });
                          },
                          child: Text(buttonName),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white, primary: Colors.black),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const NextPage()));
                          },
                          child: const Text('Next Page'),
                        ),
                      ],
                    ),
                  )
                : Image.asset("C:/src/projects/bootcamp_app/images/404.jpg")),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      );
  }
}

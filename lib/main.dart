import 'package:carousel_pro/carousel_pro.dart';
import 'package:curved_bottom_navi_bar/details.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/detail' : (BuildContext context)=>Details(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
int selectedIndex = 0;
void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.purple,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 20),
            //Icon(Icons.collections, size: 20),
            //Icon(Icons.card_giftcard, size: 20),
            Icon(Icons.shopping_cart, size: 20),
            Icon(Icons.account_circle, size: 20),
          ],
          //currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 4,
                shadowColor: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 55,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search", border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                          onTap: () {
                            print("you clicked search icon");
                          },
                          child: Icon(Icons.camera_alt))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 270,
                  width: 1000, //double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(500)),
                  child: Carousel(
                    images: [
                      AssetImage('assets/images/ladies bags.jpg'),
                      AssetImage('assets/images/kurti.jpg'),
                      AssetImage('assets/images/cosmetics.jpg'),
                      AssetImage(
                        'assets/images/sarees.jpg',
                      ),
                    ],
                    dotColor: Colors.black,
                    boxFit: BoxFit
                        .fill, //.contain,//.fitHeight,//.cover,//.fitHeight,//.fitWidth,//.cover,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/detail');
                },
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/images/ladies bags.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

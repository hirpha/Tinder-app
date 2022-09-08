import 'package:demo_tinder_app/leftArray.dart';
import 'package:demo_tinder_app/rightArray.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List items = [
  {
    "image": "images/image 1.jpeg",
    "title": "Rehoni Delsmi,24",
    "description": "Lives in Hindi, Mimfis",
    "desc2": "20 miles away",
  },
  {
    "image": "images/images 4.jpeg",
    "title": "Kristina Watson,24",
    "description": "Lives in England, London",
    "desc2": "20 miles away",
  },
  {
    "image": "images/images 6.jpeg",
    "title": "Zara Yakob,22",
    "description": "Lives in China, Hungawu",
    "desc2": "10 miles away",
  },
  {
    "image": "images/images 3.jpeg",
    "title": "Jane Luwis,21",
    "description": "Lives in Germany, Frankfurt",
    "desc2": "25 miles away",
  },
  {
    "image": "images/images 2.jpeg",
    "title": "Helen David,26",
    "description": "Lives in America, New York",
    "desc2": "5 miles away",
  },
  {
    "image": "images/images 1.jpeg",
    "title": "wilson James,23",
    "description": "Lives in Canada, Toronto",
    "desc2": "10 miles away",
  },
];

List leftItems = [];
List rightItems = [];
String scrollDirection = "";
int navIndex = 1;

Widget buildListview(setState, ctx) {
  Widget listView = ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (ctx, index) => VisibilityDetector(
            key: Key(index.toString()),
            onVisibilityChanged: (info) {
              print(info.visibleFraction);
              if (info.visibleFraction > 0.5) {
                if (scrollDirection == "left") {
                  if (!leftItems.contains(items[index])) {
                    if (rightItems.contains(items[index])) {
                      setState(() {
                        rightItems.remove(items[index]);
                      });
                    }
                    setState(() {
                      leftItems.add(items[index]);
                    });
                  }
                } else if (scrollDirection == "right") {
                  if (!rightItems.contains(items[index])) {
                    if (leftItems.contains(items[index])) {
                      setState(() {
                        leftItems.remove(items[index]);
                      });
                    }
                    setState(() {
                      rightItems.add(items[index]);
                    });
                  }
                }
              }
            },
            child: Container(
              height: MediaQuery.of(ctx).size.height -
                  (MediaQuery.of(ctx).viewPadding.top +
                      kBottomNavigationBarHeight +
                      14.49),
              width: MediaQuery.of(ctx).size.width,
              margin: EdgeInsets.only(
                  top: 0,
                  left: MediaQuery.of(ctx).size.width * 0.1,
                  right: MediaQuery.of(ctx).size.width * 0.1,
                  bottom: 35),
              child: Stack(children: [
                Positioned(
                    child: Container(
                  decoration: BoxDecoration(),
                )),
                Positioned(
                  top: MediaQuery.of(ctx).viewPadding.top + 20,
                  child: Container(
                    height: MediaQuery.of(ctx).size.height -
                        (MediaQuery.of(ctx).viewPadding.top +
                            kBottomNavigationBarHeight +
                            14.49 +
                            140),
                    width: MediaQuery.of(ctx).size.width * .85,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.asset(
                        items[index]["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(ctx).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.0001),
                          Colors.black.withOpacity(0.001),
                          Colors.black.withOpacity(0.01),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    // child: Text("kkk"),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 22,
                  child: Text(
                    items[index]["title"],
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(ctx).size.height - 260,
                  left: 22,
                  child: Text(
                    items[index]["description"],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(ctx).size.height - 230,
                  left: 22,
                  child: Text(
                    items[index]["desc2"],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
              ]),
            ),
          ));
  if (navIndex == 2) {
    listView = RightArray(
      items: rightItems,
    );
  } else if (navIndex == 0) {
    listView = LeftArray(
      items: leftItems,
    );
  }
  return listView;
}

ScrollController controller = ScrollController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height -
        (MediaQuery.of(context).viewPadding.top +
            kBottomNavigationBarHeight +
            14.49 +
            35 +
            45));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top + 14.49),
            height: 50,
            width: 44.44,
            child: Image.asset("images/tinder.jpeg"),
          ),
          Container(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).viewPadding.top +
                      kBottomNavigationBarHeight +
                      14.49 +
                      60),
              child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    setState(() {
                      if (direction == ScrollDirection.reverse) {
                        setState(() {
                          scrollDirection = "left";
                        });
                      } else if (direction == ScrollDirection.forward) {
                        setState(() {
                          scrollDirection = "right";
                        });
                      }
                    });
                    return true;
                  },
                  child: buildListview(setState, context))),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: navIndex,
          onTap: (value) {
            setState(() {
              navIndex = value;
            });
            print(value);
            print(leftItems.length);
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    height: navIndex == 0 ? 25 : 37,
                    width: navIndex == 0 ? 25 : 37,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(255, 94, 81, 1),
                        )),
                    child: Icon(
                      Icons.close,
                      size: navIndex == 0 ? 15 : 25,
                      color: Color.fromRGBO(255, 94, 81, 1),
                    )),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                    height: navIndex == 1 ? 25 : 37,
                    width: navIndex == 1 ? 25 : 37,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(7, 166, 255, 1),
                        )),
                    child: Icon(
                      Icons.star,
                      size: navIndex == 1 ? 15 : 25,
                      color: Color.fromRGBO(7, 166, 255, 1),
                    )),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                    height: navIndex == 2 ? 25 : 37,
                    width: navIndex == 2 ? 25 : 37,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(0, 211, 135, 1),
                        )),
                    child: Icon(
                      Icons.favorite,
                      size: navIndex == 2 ? 15 : 25,
                      color: Color.fromRGBO(0, 211, 135, 1),
                    )),
                label: ""),
          ],
        ),
      ),
    );
  }
}

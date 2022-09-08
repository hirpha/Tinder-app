import 'package:flutter/material.dart';

class LeftArray extends StatelessWidget {
  final List items;
  LeftArray({required this.items});

  @override
  Widget build(BuildContext context) {
    print("data lengt ${items.length}");
    return items.length == 0
        ? Center(
            child: Text(
            "Items didn't scrolled to left yet",
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.w600),
          ))
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (ctx, index) => Container(
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
                  top: 100,
                  left: 0,
                  width: MediaQuery.of(ctx).size.width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 0,
                        width: 0,
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromRGBO(
                                109,
                                255,
                                106,
                                1,
                              ),
                              width: 3,
                            )),
                        child: Text(
                          "Like",
                          style: TextStyle(
                              color: Color.fromRGBO(109, 255, 106, 1),
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 78,
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromRGBO(255, 78, 64, 1),
                              width: 3,
                            )),
                        child: Text(
                          "Nope",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 78, 64, 1),
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
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
                        color: Color.fromARGB(255, 255, 255, 255),
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
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                
              ]),
            ),
          );
  }
}

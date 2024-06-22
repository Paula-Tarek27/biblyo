import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook/common/color.dart';
import 'package:ebook/common/top_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Book/book_details.dart';
import '../../Book/controlar/book_controlar.dart';
import '../../Model/data.dart';
import '../../common/book_card.dart';
import '../../common/recently.dart';
import '../main/main_view.dart';
class HomeView extends StatefulWidget {

  const HomeView({Key? key,})
      : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List topPicksArr = [
    {
      "name": "The Power Of Now",
      "author": "Eckhart Tolle",
      "img": "assets/images/book1.jpg"
    },
    {
      "name": "How To Think",
      "author": "Patric King",
      "img": "assets/images/book4.jpg"
    },
    {
      "name": "The 7 Habits of Highily Effective People",
      "author": "Stephen R.Covery",
      "img": "assets/images/book3.jpg"
    }
  ];
  List bestArr = [
    {
      "name": "The Power Of Positive Thinking",
      "author": "Norman Vincient",
      "img": "assets/images/book2.jpg",
      "rating" :4.0
    },
    {
      "name": "Rich Dad Poor Dad",
      "author": "Robbert T.Kiyoski",
      "img": "assets/images/book5.jpg",
      "rating" :3.0
    },
    {
      "name": "Mind Reader",
      "author": "David J.Lebrman",
      "img": "assets/images/book6.jpg",
      "rating" :5.0
    },
    {
      "name": "Good Vibes Good Life",
      "author": "Vex King",
      "img": "assets/images/book7.jpg",
      "rating" :5.0
    }
  ];
  List recentArr = [
    {
      "name": "Read People Like Book",
      "author": "Patric King",
      "img": "assets/images/book9.jpg"
    },
    {
      "name": "Stop Overthinking",
      "author": "Nick Trenton ",
      "img": "assets/images/overthink.jpg"
    },
    {
      "name": "Alone",
      "author": "Megan E. Freeman",
      "img": "assets/images/alone.jpg"
    },
    {
      "name": "Steve Jobs",
      "author": "Walter Isaacson",
      "img": "assets/images/jobs.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0,media.width*0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(media.width * 0.5)
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      backgroundColor: TColor.primary,
                      title: Row(
                        children: [
                          Text("Masterpieace",
                          style: TextStyle(
                            fontSize: 25,fontWeight: FontWeight.w700
                          ),
                          ),
                        ],
                      ),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(onPressed: (){
                          sideMenuScaffoldkey.currentState?.openEndDrawer();
                        }, icon: Icon(Icons.menu)),
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                          itemCount: topPicksArr.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                            var iObj = topPicksArr[itemIndex] as Map? ??{};
                            return TopPick(iObj: iObj,);
                          },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom
                        ),
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                              "For You:",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                            () => Row(
                          children: bookController.bookData
                              .map(
                                (e) => BookCard(
                              cover: e.cover ?? '', // Use a placeholder if null
                              title: e.title ?? '',
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetails(book: e),
                                  ),
                                );
                              },
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.black54),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "COMING SOON",
                              style: TextStyle(
                                color: Colors.black, // Change color as needed
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: media.width,
                        child: ListView.builder
                          (padding: EdgeInsets.symmetric(vertical: 15,horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = recentArr[index] as Map? ??{};
                            return Recently(iObj: bObj,);
                          }
                          ),
                        )
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

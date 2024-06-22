import 'package:ebook/Book/books.dart';
import 'package:ebook/common/color.dart';
import 'package:ebook/common/pin_pass.dart';
import 'package:ebook/view/home/home.dart';
import 'package:ebook/view/login/login.dart';
import 'package:ebook/view/menu/contact_us.dart';
import 'package:ebook/view/menu/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/intro_admin.dart';
import '../menu/account.dart';
import '../menu/setting.dart';
import '../search/search.dart';
import '../shipping/shop_page.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}
GlobalKey<ScaffoldState> sideMenuScaffoldkey = GlobalKey<ScaffoldState>();
class _MainTabViewState extends State<MainTabView> with TickerProviderStateMixin{
  TabController? controller;
  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Library", "icon": Icons.book},
    //{"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Contact Us", "icon": Icons.help},
    {"name": "Payment", "icon": Icons.attach_money},
    {"name": "Admin", "icon": Icons.newspaper},
    {"name": "Settings", "icon": Icons.settings},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldkey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: TColor.dColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(media.width * 0.7),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black54, blurRadius: 15)
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuArr.map((mObj) {
                      var index = menuArr.indexOf(mObj);
                      return Container(
                        // margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: selectMenu == index
                            ? BoxDecoration(color: TColor.primary, boxShadow: [
                          BoxShadow(
                              color: TColor.primary,
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ])
                            : null,
                        child: GestureDetector(
                          onTap: () {

                            if(index == 1) {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Books()  ) );
                              sideMenuScaffoldkey.currentState?.closeEndDrawer();

                            }/*else if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                           builder: (context) =>
                              const AccountView()));
                            sideMenuScaffoldkey.currentState
                                ?.closeEndDrawer();
                            }*/else if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ContactUs()));
                              sideMenuScaffoldkey.currentState
                                  ?.closeEndDrawer();
                            }else if (index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       PaymentPage()));
                              sideMenuScaffoldkey.currentState
                                  ?.closeEndDrawer();
                            }else if (index == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdminIntroPage()));
                              sideMenuScaffoldkey.currentState
                                  ?.closeEndDrawer();
                            }else if (index == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       SettingsPage()));
                              sideMenuScaffoldkey.currentState
                                  ?.closeEndDrawer();
                            }else if (index == 6) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       AccountView()));
                              sideMenuScaffoldkey.currentState
                                  ?.closeEndDrawer();
                            }

                            //

                            setState(() {
                              selectMenu = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mObj["name"].toString(),
                                style: TextStyle(
                                    color: selectMenu == index
                                        ? Colors.white
                                        : TColor.text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                mObj["icon"] as IconData? ?? Icons.home,
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.primary,
                                size: 33,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                SizedBox(height: 60,),
                Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          icon: Icon(
                            Icons.logout,
                            color: TColor.subTitle,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                     /* const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          HomeView(),
          SearchView(),
          //Container(),
          ShoppingCartPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(color: TColor.primary,
        child: TabBar(
        controller: controller,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const[
            Tab(
              icon: Icon(Icons.menu_book_rounded),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            /*Tab(
              icon: Icon(Icons.bookmark),
              text: "Bookmark",
            ),*/
            Tab(
              icon: Icon(Icons.shopping_bag),
              text: "Cart",
            ),
          ],
      ),),
    );
  }
}

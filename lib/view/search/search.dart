import 'package:ebook/common/color.dart';
import 'package:ebook/common/extantion.dart';
import 'package:ebook/view/category/category_model.dart';
import 'package:ebook/view/category/category_num3.dart';
import 'package:ebook/view/menu/payment.dart';
import 'package:ebook/view/search/search_filter.dart';
import 'package:ebook/view/search/search_force.dart';
import 'package:flutter/material.dart';
import '../../common/histroy.dart';
import '../../common/search_grid.dart';
import '../category/category.dart';
import '../menu/account.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTag = 0;
  List tagsArr = [
    "Genre",
    "New Release",
    "The Art",
    "Genre1",
    "New Release1",
    "The Art1"
  ];

  List searchArr = [
    {
      "name": "Biography",
      "img": "assets/images/b9.jpg",
    },
    {
      "name": "Life Style",
      "img": "assets/images/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/images/b3.jpg",
    },
    {
      "name": "Personality",
      "img": "assets/images/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/images/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/b6.jpg",
    },
    {
      "name": "Biography",
      "img": "assets/images/b1.jpg",
    },
    {
      "name": "Business",
      "img": "assets/images/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/images/b3.jpg",
    },
    {
      "name": "Cookery",
      "img": "assets/images/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/images/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/b6.jpg",
    }
  ];

  List sResultArr = [
    {
      "name": "The Heart of Hell",
      "img": "assets/images/h1.jpg",
      "author": "Mitch Weiss",
      "description":
      "The untold story of courage and sacrifice in the shadow of Iwo Jima.",
      "rate": 5.0
    },
    {
      "name": "Adrennes 1944",
      "img": "assets/images/h2.jpg",
      "author": "Antony Beevor",
      "description":
      "#1 international bestseller and award winning history book.",
      "rate": 4.0
    },
    {
      "name": "War on the Gothic Line",
      "img": "assets/images/h3.jpg",
      "author": "Christian Jennings",
      "description":
      "Through the eyes of thirteen men and women from seven different nations",
      "rate": 3.0
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: txtSearch,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchForceView(
                            didSearch: (sText) {
                              txtSearch.text = sText;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      );
                      endEditing();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: TColor.text),
                      suffixIcon: SizedBox(
                        width: 40,
                        child: IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchFilterView(
                                    didFilter: (fObj) {

                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                              );
                              endEditing();
                            },
                            icon: Icon(Icons.tune, color: TColor.text)),
                      ),
                      hintText: "Search Books. Authors. or ISBN",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              if (txtSearch.text.isNotEmpty)
                const SizedBox(
                  width: 8,
                ),
              if (txtSearch.text.isNotEmpty)
                TextButton(
                    onPressed: () {
                      txtSearch.text = "";
                      setState(() {});
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: TColor.text,
                        fontSize: 17,
                      ),
                    ))
            ],
          ),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: tagsArr.map((tagName) {
                    var index = tagsArr.indexOf(tagName);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          if(index == 1) {

                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  AccountView()  ) );

                          }else if (index == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                     AccountView()));
                          }
                          setState(() {
                            selectTag = index;
                          });
                        },
                        child: Text(
                          tagName,
                          style: TextStyle(
                              color: selectTag == index
                                  ? TColor.text
                                  : TColor.subTitle,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            if (txtSearch.text.isEmpty)
              Expanded(
                child: GridView.builder(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: searchArr.length,
                  itemBuilder: (context, index) {
                    var sObj = searchArr[index] as Map? ?? {};
                    return InkWell(
                      onTap: () {
                        if(index == 0) {

                          Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoriesPage()));

                        }else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>CategoriesPage2()));
                        }else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>CategoriesPage3()));
                        }
                      },
                      child: SearchGridCell(
                        sObj: sObj,
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            if (txtSearch.text.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  padding:
                  const EdgeInsets.symmetric( horizontal: 15),
                  itemCount: sResultArr.length,
                  itemBuilder: (context, index) {
                    var sObj = sResultArr[index] as Map? ?? {};
                    return HistoryRow(
                      sObj: sObj,
                    );
                  },),)
          ],
        ));
  }
}

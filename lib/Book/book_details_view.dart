import 'package:ebook/Model/book_model.dart';
import 'package:flutter/material.dart';

import '../common/color.dart';
class BookDetailsView extends StatelessWidget {
  final String cover;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String language;

  const BookDetailsView({super.key,
    required this.cover,
    required this.title,
    required this.author,
    required this.rating ,
    required this.description ,
    required this.language,
    required this.pages,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                ),
                Text("Back",style: TextStyle(color: TColor.text,fontWeight: FontWeight.w700),)
              ],
            )
          ],
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Image.network(cover),
                width: 150,
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Text(title,maxLines: 1,textAlign: TextAlign.center,style: TextStyle(color: TColor.text,fontWeight: FontWeight.bold,fontSize: 30),),
        Text("Author : $author",style: TextStyle(color: TColor.subTitle,fontWeight: FontWeight.w500,fontSize: 20)),
        //Text(description,maxLines: 3,textAlign: TextAlign.center,style: TextStyle(color: TColor.subTitle,fontWeight: FontWeight.normal,fontSize: 15)),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Rating",style: TextStyle(color: TColor.text,fontWeight: FontWeight.bold)),
                Text(rating,style: TextStyle(color: TColor.subTitle))
              ],
            ),
            Column(
              children: [
                Text("Pages",style: TextStyle(color: TColor.text,fontWeight: FontWeight.bold)),
                Text(pages,style: TextStyle(color: TColor.subTitle))
              ],
            ),
            Column(
              children: [
                Text("Language",style: TextStyle(color: TColor.text,fontWeight: FontWeight.bold)),
                Text(language,style: TextStyle(color: TColor.subTitle))
              ],
            ),
            /*Column(
              children: [
                Text("Audio",style: TextStyle(color: TColor.text,fontWeight: FontWeight.bold)),
                Text("4.5",style: TextStyle(color: TColor.subTitle))
              ],
            )*/
          ],
        )
      ],
    );
  }
}

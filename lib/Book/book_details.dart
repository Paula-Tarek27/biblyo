import 'package:ebook/Book/book_details_view.dart';
import 'package:ebook/Book/book_read.dart';
import 'package:ebook/Model/book_model.dart';
import 'package:ebook/Model/data.dart';
import 'package:ebook/common/audio.dart';
import 'package:ebook/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/rounbuttom.dart';
import '../view/shipping/cart.dart';
import '../view/shipping/cart_controlar.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CartController controller = Get.find<CartController>(); // Finding the controller
          CartItem newItem = CartItem(id: '1', title: book.title!,cover: book.cover!);
          controller.addToCart(newItem); // Adding item to the cart
        },
        child: Icon(Icons.add_shopping_cart,color: Colors.white,),
        backgroundColor: TColor.primaryLight,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: TColor.primaryLight,
              child: Row(
                children: [
                  Expanded(
                    child: BookDetailsView(
                      cover: book.cover!,
                      title: book.title!,
                      author: book.author!,
                      description: book.description!,
                      rating: book.rating!,
                      pages: book.pages.toString(),
                      language: book.language.toString(),

                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    book.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  RoundButton(title: 'Read', onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookRead(bookurl: book.bookurl!, title: book.title!, audioTracks: [
                      AudioTrack(title: 'Relax ', url: 'https://www.chosic.com/wp-content/uploads/2022/10/scott-buckley-moonlight(chosic.com).mp3'),
                      AudioTrack(title: 'Calm', url: 'https://www.chosic.com/wp-content/uploads/2021/09/melody-of-nature-main(chosic.com).mp3'),
                      AudioTrack(title: 'Peace', url: 'https://www.chosic.com/wp-content/uploads/2022/10/scott-buckley-permafrost(chosic.com).mp3'),
                      AudioTrack(title: 'Peaceful Mind', url: 'https://www.chosic.com/wp-content/uploads/2022/03/alex-productions-ambient-music-nature(chosic.com).mp3')
                    ],  )));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
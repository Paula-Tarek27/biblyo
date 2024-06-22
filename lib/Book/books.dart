import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook/Book/book_details.dart';
import 'package:ebook/Book/book_title.dart';
import 'package:ebook/Book/controlar/book_controlar.dart';
import 'package:ebook/common/book_card.dart';
import 'package:ebook/common/color.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Library : ",
          style: TextStyle(color: TColor.text, fontWeight: FontWeight.w700, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("", style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              Obx(
                    () => Column(
                  children: bookController.bookData
                      .map(
                        (e) => BookTitle(
                      cover: e.cover ?? '', // Use a placeholder if null
                      title: e.title ?? '',
                      author: e.author ?? '',
                      rating: e.rating ?? '',
                      price: e.price ?? 0,
                    ),
                  )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

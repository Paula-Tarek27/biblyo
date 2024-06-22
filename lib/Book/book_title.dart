import 'package:flutter/material.dart';
import '../common/color.dart';

class BookTitle extends StatelessWidget {
  final String title;
  final String cover;
  final String author;
  final int price;
  final String rating;

  const BookTitle({
    super.key,
    required this.cover,
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: TColor.primaryLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cover,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: TColor.text, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "By : $author",
                      style: TextStyle(color: TColor.subTitle),
                    ),
                    Text(
                      "Price : \L.E${price.toString()}",
                      style: TextStyle(color: TColor.subTitle),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 15),
                        Text(rating),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

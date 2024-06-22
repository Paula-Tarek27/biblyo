import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../common/color.dart';
import '../../Book/book_details.dart';
import '../../Model/book_model.dart';

class SearchForceView extends StatefulWidget {
  const SearchForceView({super.key, required Null Function(dynamic sText) didSearch});

  @override
  State<SearchForceView> createState() => _SearchForceViewState();
}

class _SearchForceViewState extends State<SearchForceView> {
  TextEditingController txtSearch = TextEditingController();
  List<BookModel> searchResults = []; // Store search results as BookModel List

  void searchBooks(String query) async {
    if (query.isNotEmpty) {
      var snapshot = await FirebaseFirestore.instance
          .collection('Books')
          .where('title', isGreaterThanOrEqualTo: query)
          .where('title', isLessThanOrEqualTo: query + '\uf8ff')
          .limit(10)
          .get();

      setState(() {
        searchResults = snapshot.docs
            .map((doc) => BookModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      });
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: TColor.textbox,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: txtSearch,
                  onChanged: searchBooks,
                  decoration: InputDecoration(
                    hintText: "Search here",
                    prefixIcon: Icon(Icons.search, color: TColor.text),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel", style: TextStyle(color: TColor.text)))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                var book = searchResults[index];
                return ListTile(
                  leading: Image.network(book.cover!, width: 50),
                  title: Text(book.title!),
                  subtitle: Text(book.author!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookDetails(book: book)),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

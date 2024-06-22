
import 'package:ebook/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Book/controlar/book_controlar.dart';
import '../../Book/controlar/pdf_controlar.dart';
import '../../common/multi_line.dart';
import '../../common/text_field_admin.dart';

class AddNewBookPage extends StatelessWidget {
  const AddNewBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    PdfController pdfController = Get.put(PdfController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 500,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: TColor.primaryLight,
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ADD NEW BOOK",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color:
                              Theme.of(context).colorScheme.background,
                            ),
                          ),
                          SizedBox(width: 70)
                        ],
                      ),
                      SizedBox(height: 60),
                      InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                          child: Obx(
                                () => Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Center(
                                child: bookController.isImageUploading.value
                                    ? CircularProgressIndicator(
                                  color: TColor.primary,
                                )
                                    : bookController.imageUrl.value == ""
                                    ? Image.asset(
                                    "assets/images/addImage.png")
                                    : ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  child: Image.network(
                                    bookController.imageUrl.value,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                            () => Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: bookController.pdfUrl.value == ""
                                ? TColor.primary
                                : Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: bookController.isPdfUploading.value
                              ? Center(
                            child: CircularProgressIndicator(
                              color: TColor.primary,
                            ),
                          )
                              : bookController.pdfUrl.value == ""
                              ? InkWell(
                            onTap: () {
                              bookController.pickPDF();
                            },
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/upload.png"),
                                SizedBox(width: 8),
                                Text(
                                  "Book PDF",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : InkWell(
                            onTap: () {
                              bookController.pdfUrl.value = "";
                            },
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "Assets/Icons/delete.png",
                                  width: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Delete Pdf",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Book title",
                  icon: Icons.book,
                  controller: bookController.title,
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Book cover",
                  icon: Icons.image,
                  controller: bookController.cover,
                ),
                SizedBox(height: 10),
                MultiLineTextField(
                    hintText: "Book Description",
                    controller: bookController.des
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Author Name",
                  icon: Icons.person,
                  controller: bookController.auth,
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "bookurl",
                  icon: Icons.link,
                  controller: bookController.bookurl,
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Category",
                  icon: Icons.category,
                  controller: bookController.category,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        isNumber: true,
                        hintText: "Price",
                        icon: Icons.monetization_on,
                        controller: bookController.price,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Pages",
                        isNumber: true,
                        icon: Icons.file_copy,
                        controller: bookController.pages,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Language",
                        icon: Icons.language,
                        controller: bookController.language,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Rate",
                        icon: Icons.star_rate,
                        controller: bookController.rating,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Colors.red,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "CANCLE",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Obx(
                              () => Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPdfUploading.value
                                ? Center(
                              child: CircularProgressIndicator(),
                            )
                                : InkWell(
                              onTap: () {
                                bookController.createBook();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_sharp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "POST",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
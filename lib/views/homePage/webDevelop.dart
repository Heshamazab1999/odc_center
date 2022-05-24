// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/model/CategoryDetails.dart';
import 'package:odc_hackathon/views/login/login.dart';

import '../../constant.dart';
import '../courseDetail/CourseDetail.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key, this.detailsModel}) : super(key: key);
  final CategoryDetailsModel? detailsModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title:  Text(
            detailsModel!.data!.categoryName!,
            style: TextStyle(color: Colors.black),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFeild(
                name: 'Search',
                obscureText: false,
                icon: const Icon(Icons.search_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(

                onTap: ()=>Get.to(CourseDetail()),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(detailsModel!.data!.imageUrl!),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11)),
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailsModel!.data!.categoryName!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Ahmed Abaza",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Constant.grey1),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "15 Hours",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Constant.grey1),
                            )
                          ],
                        )
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

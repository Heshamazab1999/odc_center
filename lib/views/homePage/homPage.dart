// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:odc_hackathon/constant.dart';

import 'package:get/get.dart';
import 'package:odc_hackathon/controller/home_controller.dart';
import 'package:odc_hackathon/enum/view_state.dart';
import 'package:odc_hackathon/views/courseDetail/CourseDetail.dart';
import 'package:odc_hackathon/views/homePage/webDevelop.dart';

import 'category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    final _controller = Get.put(HomeController());
    return Scaffold(
        body: Obx(
      () => _controller.state == ViewState.busy
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //logo
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Image.asset("assets/images/Logo.png"),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Constant.blackColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                "Enter the Code to Get your course",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      width: width * 0.6,
                                      height: hight * 0.08,
                                      decoration: BoxDecoration(
                                          color: Constant.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 3, 10, 0),
                                      child: const TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Enter Code',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Constant.primary,
                                            borderRadius:
                                                BorderRadius.circular(35)),
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 3, 10, 0),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.forward),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 6,
                      ),
                      buildRowseeAll("Top Categories", "See All",
                          () => Get.to(const Categories())),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: _controller.categoryModel!.data!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () async {
                              await _controller.getCategoryDetails(
                                  HomeController
                                      .to.categoryModel!.data![index].id!);
                              Get.to(CategoryDetail(
                                detailsModel: _controller.detailsModel!,
                              ));
                              // _controller.getCategoryDetails(
                              //     _controller.categoryModel!.data![index].id!);
                            },
                            child: buildTopCategory(
                              _controller
                                  .categoryModel!.data![index].categoryName!,
                              _controller.categoryModel!.data![index].imageUrl!,
                            ),
                          ),
                        ),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     buildTopCategory(
                      //         "Web Development", "assets/images/categoryicon1.png"),
                      //     buildTopCategory("Programing Languages",
                      //         "assets/images/categoryicon2.png"),
                      //     buildTopCategory(
                      //         "Graphics", "assets/images/categoryicon3.png")
                      //   ],
                      // ),
                      ,
                      const SizedBox(
                        height: 10,
                      ),
                      buildRowseeAll("New Courses", "See All", () {}),
                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: _controller.coursesModel!.data!.length,
                            itemBuilder: (ctx, index) => GestureDetector(
                                  onTap: () async {
                                    await _controller.getCoursesDetails(
                                        _controller
                                            .coursesModel!.data![index].id!);
                                    Get.to(() => CourseDetail(
                                          details: _controller.coursesDetails,
                                        ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            width: width * 0.75,
                                            height: 151,
                                            child: Image.network(_controller
                                                .coursesModel!
                                                .data![index]
                                                .category!
                                                .imageUrl!),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35)),
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 3, 10, 0),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _controller
                                                .coursesModel!
                                                .data![index]
                                                .category!
                                                .categoryName!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                color: Constant.primary),
                                          ),
                                          Text(
                                            "Learn ${_controller.coursesModel!.data![index].courseName} for ${_controller.coursesModel!.data![index].courseLevel}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
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
                                      ),
                                    ],
                                  ),
                                )),
                      )
                    ],
                  ),
                ),
              ),
            ),
    ));
  }

  Row buildRowseeAll(name, seeall, onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            seeall,
            style: const TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }

  Column buildTopCategory(categoryName, String icon) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 73,
            height: 73,
            child: Image.network(icon),
            decoration: BoxDecoration(
                color: Constant.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
          ),
        ),
        Text(
          categoryName,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/controller/home_controller.dart';
import 'package:odc_hackathon/enum/view_state.dart';
import 'package:odc_hackathon/views/homePage/webDevelop.dart';
import 'package:odc_hackathon/views/login/login.dart';

import '../../constant.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
            title: const Text(
              "Categories",
              style: TextStyle(color: Colors.black),
            )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => HomeController.to.state == (ViewState.busy)
                  ? Center(child: const CircularProgressIndicator())
                  : GridView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: HomeController.to.categoryModel!.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (ctx, index) => buildTopCategory(
                          HomeController
                              .to.categoryModel!.data![index].categoryName,
                          HomeController.to.categoryModel!.data![index]
                              .imageUrl!, () async {
                        await HomeController.to.getCategoryDetails(
                            HomeController.to.categoryModel!.data![index].id!);
                        Get.to(CategoryDetail(
                          detailsModel: HomeController.to.detailsModel!,
                        ));
                      }),
                    ),
            ),
          ),
        ));
  }

  buildTopCategory(categoryName, String icon, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 73,
            height: 73,
            child: Image.network(icon),
            decoration: BoxDecoration(
                color: Constant.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
          ),
          Text(
            categoryName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/MensSubCategoryController/mensSubcategoryController.dart';

class MensClothing_English extends StatefulWidget {
  const MensClothing_English({Key? key}) : super(key: key);

  @override
  State<MensClothing_English> createState() => _MensClothing_EnglishState();
}

class _MensClothing_EnglishState extends State<MensClothing_English> {
  SubMensCategory MensClothing = SubMensCategory();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // subCategoriesController.Subcategory_ApiHit();
    MensClothing.SubMensCategory_ApiHit();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (MensClothing.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return MensClothing.userList.value.seeAllMainCategory == null ||
                MensClothing.userList.value.seeAllMainCategory?.length == 0
            ? Center(
                child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/no_product.png',
                      color: Color(0xffff8300),
                    ),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    Text(
                      "Page Not Found",
                      style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ],
                ),
              ))
            : Padding(
                padding: const EdgeInsets.only(bottom: 500),
                child: Container(
                  height: Get.height,
                  color: Colors.white,
                  child: Center(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          mainAxisExtent: Get.height * .2),
                      itemCount: MensClothing
                              .userList.value.seeAllMainCategory?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(38.0),
                              child: Image.network(
                                "${MensClothing.userList.value.seeAllMainCategory?[index].imageUrl.toString()}",
                                height: 68,
                                width: 68,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5.v),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                  "${MensClothing.userList.value.seeAllMainCategory?[index].categoryName.toString()}",
                                  style: TextStyle(
                                    color: Color(0xFF272727),
                                    fontSize: 12,
                                    fontFamily: 'League Spartan',
                                    fontWeight: FontWeight.w500,
                                  )
                                  // theme.textTheme.bodySmall,
                                  // overflow: TextOverflow.ellipsis,
                                  // maxLines: 1,
                                  ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
      }
    });
  }
}

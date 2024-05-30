import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:theme_with_getx/model/country_model.dart';
import 'package:theme_with_getx/view/widgets/country_custom_view.dart';
import 'package:theme_with_getx/view_model/country_controller.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  CountryController countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country"),
      ),
      body: Obx(() {
        return countryController.isLoading.value
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 80.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 15,
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: countryController.cList.length,
                itemBuilder: (context, i) {
                  CountryModel item = countryController.cList[i];
                  return CountryCustomView(model: item);
                },
              );
      }),
    );
  }
}

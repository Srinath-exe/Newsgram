import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/story/model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../controllers/NewsController.dart';

class SelectTopic extends StatefulWidget {
  const SelectTopic({super.key});

  @override
  State<SelectTopic> createState() => _SelectTopicState();
}

class _SelectTopicState extends State<SelectTopic> {
  final NewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Obx(
          () =>
              // controller.allnews.length < 8
              // ? Shimmer(
              //     gradient:
              //         LinearGradient(colors: [lightgrey, Colors.grey.shade300]),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: black,
              //       ),
              //       height: 80,
              //       width: Config().deviceWidth(context),
              //     )):
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Feed",
                  style: TextStyle(
                      fontSize: 20, color: black, fontWeight: FontWeight.w600)),
              ZoomTapAnimation(
                onTap: () {
                  showDialog(
                      barrierColor: white.withOpacity(0.9),
                      context: context,
                      builder: (BuildContext context) {
                        return Transform.scale(scale: 0.8, child: SliderList());
                      });
                },
                child: Material(
                  elevation: 2,
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: black,
                      ),
                      // height: 80,
                      // width: Config().deviceWidth(context),
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.isDeafult.value
                                ? "Top Articles"
                                : capitalize(controller.finLis.keys
                                    .elementAt(controller.index.value)),
                            style: TextStyle(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SliderList extends StatefulWidget {
  SliderList({
    super.key,
  });

  @override
  State<SliderList> createState() => SliderListState();
}

class SliderListState extends State<SliderList> {
  final NewsController controller = Get.find();
  late int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Obx(
        () => controller.allnews.length < 8
            ? Lottie.asset(
                'assets/lottie/newsload.json',
              )
            : VerticalCardPager(
                titles: List.generate(controller.finLis.length, (index) {
                  return capitalize(controller.finLis.keys.elementAt(index));
                }),
                images: List.generate(
                  controller.finLis.length,
                  (index) {
                    return tile(
                        imgs(tag: controller.finLis.keys.elementAt(index)));
                  },
                ),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold), // optional
                onPageChanged: (page) {
                  // optional
                },
                onSelectedItem: (index) {
                  Navigator.pop(context);
                  controller.index.value = index;
                  controller.isDeafult.value = false;
                },
                initialPage: 0, // optional
                align: ALIGN.CENTER // optional
                ),
      )),
    );
  }

  tile(String url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
                image: AssetImage(
                  url,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}



// Material(
//                   elevation: 2,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: black,
//                         image: DecorationImage(
//                             image: AssetImage(
//                               imgs(
//                                   tag: controller.finLis.keys
//                                       .elementAt(controller.index.value)),
//                             ),
//                             fit: BoxFit.cover)),
//                     height: 80,
//                     width: Config().deviceWidth(context),
//                     alignment: Alignment.center,
//                     child: Text(
//                       controller.isDeafult.value
//                           ? "Top Articles"
//                           : capitalize(controller.finLis.keys
//                               .elementAt(controller.index.value)),
//                       style: TextStyle(
//                           fontSize: 40,
//                           color: white,
//                           fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ),
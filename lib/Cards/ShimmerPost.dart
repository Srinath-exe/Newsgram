import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatefulWidget {
  const ShimmerPost({super.key});

  @override
  State<ShimmerPost> createState() => _ShimmerPostState();
}

class _ShimmerPostState extends State<ShimmerPost> {
  double verpadding = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Config().deviceWidth(context),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Stack(
          children: [
            Shimmer(
              gradient:
                  LinearGradient(colors: [lightgrey, Colors.grey.shade400]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: verpadding, vertical: 10),
                    child: Shimmer(
                      gradient: LinearGradient(
                          colors: [lightgrey, Colors.grey.shade400]),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: black,
                            ),
                          ),
                          shim()
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Config().deviceWidth(context),
                    height: Config().deviceHeight(context) * 0.3,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: secondary),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  shim(width: Config().deviceWidth(context) * 0.8),
                  shim()
                ],
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: Config().deviceWidth(context),
                height: Config().deviceHeight(context) * 0.3,
                alignment: Alignment.center,
                child: Opacity(
                    opacity: 0.2,
                    child: Lottie.asset(
                      'assets/lottie/newsload.json',
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  shim({double height = 20, double width = 100}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: verpadding, vertical: 0),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: grey),
          )),
    );
  }
}

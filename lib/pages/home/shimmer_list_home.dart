import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListHome extends StatelessWidget {
  const ShimmerListHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBox.space16H,
                Container(
                  height: 160,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: 8,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ); // Remove the Padding widget here
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, mainAxisExtent: 100, crossAxisSpacing: 10, mainAxisSpacing: 10),
                ),
                Container(
                  height: 30,
                  width: 150,
                  color: Colors.grey[300],
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: 4,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 195,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ); // Remove the Padding widget here
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),
                ),
                Container(
                  height: 30,
                  width: 150,
                  color: Colors.grey[300],
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: 4,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    }),
                // Container(
                //   height: 200,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   height: 220, // Adjust the height as needed
                //   child: ListView.builder(
                //     padding: EdgeInsets.zero, // Adjust the padding here
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 2,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.all(8.0).copyWith(left: 0),
                //         child: ShimmerWidget(),
                //       ); // Remove the Padding widget here
                //     },
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: 30,
                //   width: 150,
                //   color: Colors.grey[300],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   height: 220, // Adjust the height as needed
                //   child: ListView.builder(
                //     padding: EdgeInsets.zero, // Adjust the padding here
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 2,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.all(8.0).copyWith(left: 0),
                //         child: ShimmerWidget(),
                //       ); // Remove the Padding widget here
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 16,
              width: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 120,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 12,
                  width: 40,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                Container(
                  height: 12,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 32,
              width: 120,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IndBlogShimmer extends StatelessWidget {
  const IndBlogShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Container(
                height: 150,
                color: Colors.grey, // Placeholder color for the image
              ),
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.grey, // Placeholder color for the content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16, // Placeholder height for the title
                      width: double.infinity, // Placeholder width for the title
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16, // Placeholder radius for the avatar
                              backgroundColor: Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height:
                                  16, // Placeholder height for the author name
                              width:
                                  100, // Placeholder width for the author name
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Container(
                          height: 16, // Placeholder height for the date
                          width: 60, // Placeholder width for the date
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

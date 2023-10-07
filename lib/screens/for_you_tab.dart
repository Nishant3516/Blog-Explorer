import 'package:flutter/material.dart';
import 'package:blogexplorer/models/blog_model.dart';
import 'package:blogexplorer/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ForYouTab extends StatefulWidget {
  final List<Blog> blogs;
  final bool isDataLoaded;
  const ForYouTab({Key? key, required this.blogs, required this.isDataLoaded})
      : super(key: key);

  @override
  State<ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<ForYouTab> {
  @override
  Widget build(BuildContext context) {
    return widget.isDataLoaded
        ? Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: ListView.builder(
              itemCount: widget.blogs.length, // Use the filtered blog count
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final blog = widget.blogs[index];
                return IndBlog(
                  blog: blog,
                );
              },
            ),
          )
        : Shimmer.fromColors(
            baseColor:
                Colors.grey[300]!, // Replace with your desired base color
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: 5, // Use a fixed number of shimmer items
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return IndBlogShimmer();
                },
              ),
            ),
          );
  }
}

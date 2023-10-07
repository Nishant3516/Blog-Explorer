import 'package:flutter/material.dart';
import 'package:blogexplorer/models/blog_model.dart';
import 'package:blogexplorer/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesScreen extends StatelessWidget {
  final bool isDataLoaded;
  final List<Blog> blogs; // List of all blogs

  const FavoritesScreen(
      {Key? key, required this.blogs, required this.isDataLoaded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter blogs where isFavorite is true
    final favoriteBlogs =
        blogs.where((blog) => blog.isFavorite).toList().reversed.toList();

    return isDataLoaded
        ? Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: ListView.builder(
              itemCount: favoriteBlogs.length,
              itemBuilder: (BuildContext context, int index) {
                final blog = favoriteBlogs[index];
                return IndBlog(blog: blog);
              },
            ),
          )
        : Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: 5, // Use a fixed number of shimmer items
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const IndBlogShimmer();
                },
              ),
            ),
          );
  }
}

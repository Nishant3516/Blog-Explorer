import 'package:blogexplorer/models/blog_model.dart';
import 'package:blogexplorer/screens/blog.dart';
import 'package:blogexplorer/utils/utils.dart';
import 'package:flutter/material.dart';

class IndBlog extends StatelessWidget {
  final Blog blog;

  const IndBlog({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigators().screenReplacement(
          context,
          BlogScreen(
            blog: blog,
          )),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey[850]!,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    image: NetworkImage(
                        blog.imageUrl), // Set the image based on the blog data
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      YSpace(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                child: Text("N"),
                              ),
                              XSpace(10),
                              const Text(
                                "Nishant Bansal",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ), // Set the author based on the blog data
                            ],
                          ),
                          const Text(
                            "05 Sep",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ), // Set the date based on the blog data
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

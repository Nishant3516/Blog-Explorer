import 'package:flutter/material.dart';
import 'package:blogexplorer/models/blog_model.dart';
import 'package:blogexplorer/utils/spacers.dart';
import 'package:share_plus/share_plus.dart';

class BlogScreen extends StatefulWidget {
  final Blog blog; // Callback to update the Blog object

  const BlogScreen({super.key, required this.blog});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  void _onFollowingChanged(bool newValue) {
    // Update isFollowing in the Blog object
    widget.blog.isFollowing = newValue;
    setState(() {
      widget.blog.isFollowing = newValue;
    });
    // Invoke the callback to update the Blog object
    // widget.onBlogUpdated(widget.blog);
  }

  void _onFavoriteChanged(bool newValue) {
    // Update isFavorite in the Blog object
    widget.blog.isFavorite = newValue;
    setState(() {
      widget.blog.isFavorite = newValue;
    });
    // Invoke the callback to update the Blog object
    // widget.onBlogUpdated(widget.blog);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Image.network(
                    widget.blog.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -MediaQuery.sizeOf(context).height * 0.035),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Text("N"),
                                ),
                                XSpace(10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Nishant Bansal",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    Text(
                                      "20 min ago",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () =>
                                  _onFollowingChanged(!widget.blog.isFollowing),
                              child: Center(
                                child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black),
                                    padding: const EdgeInsets.all(10),
                                    child: widget.blog.isFollowing
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                              XSpace(10),
                                              const Text(
                                                "Following",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          )
                                        : const Text(
                                            "Follow",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            0, -MediaQuery.sizeOf(context).height * 0.028),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.green[50],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text(
                                      "GENRE",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () => _onFavoriteChanged(
                                              !widget.blog.isFavorite),
                                          child: !widget.blog.isFavorite
                                              ? const Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.white,
                                                  size: 30,
                                                )
                                              : const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 30,
                                                )),
                                      XSpace(10),
                                      GestureDetector(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.comment_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              YSpace(10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.blog.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              YSpace(10),
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Phasellus euismod, libero quis varius fringilla, metus lectus egestas ligula, ac tincidunt purus eros sit amet erat. Aenean ac malesuada dolor, in euismod risus. Integer ut arcu euismod, tempus turpis eget, ultrices nisl. Nam fermentum, augue non venenatis congue, lectus ex lacinia nunc, non hendrerit mi libero non metus. Aliquam erat volutpat. Etiam dapibus, ante in volutpat blandit, erat eros scelerisque nisi, vel varius urna sapien vel odio. Nullam malesuada elit eget urna consectetur, eget tristique risus tempus. Pellentesque dignissim nunc vel justo vestibulum, vel accumsan lectus elementum.Suspendisse semper ex et odio aliquet, in rhoncus nunc efficitur. Sed ac euismod mi, ut fermentum urna. Nunc ultrices, leo in vestibulum tincidunt, massa augue tincidunt dolor, sit amet dignissim orci odio eget tortor. Sed fringilla, nisl non malesuada bibendum, odio erat posuere orci, eget facilisis dolor est a nunc. Vivamus volutpat viverra diam, ac dictum odio congue in. Sed volutpat, turpis nec tincidunt suscipit, tortor eros vehicula odio, non euismod lorem libero sed ex. Quisque sit amet mauris vitae purus eleifend feugiat eu eget eros. Vivamus vel ligula id dolor varius blandit. Integer quis justo a odio fermentum fringilla. In gravida bibendum velit, sit amet iaculis ex sollicitudin vel. Nunc non eros eget purus vulputate venenatis. Vivamus quis libero id urna eleifend fringilla. Integer ut efficitur odio, nec tristique nisl. Etiam sodales dui sed justo auctor bibendum. Integer iaculis eleifend odio, ut iaculis urna auctor sit amet. Curabitur malesuada ut justo sed varius. Phasellus volutpat, ipsum id laoreet rhoncus, est quam ultrices urna, nec semper lectus arcu ac urna. Vestibulum dictum leo sed enim facilisis, in convallis eros egestas. Integer tincidunt, risus et viverra vestibulum, sapien velit iaculis tortor, ac tincidunt quam eros a felis. Aenean id est a odio hendrerit auctor in nec arcu. Suspendisse malesuada ac risus eget ultrices. In sit amet ante in velit rhoncus laoreet vel vel ipsum. Morbi euismod libero non libero interdum, id blandit justo fringilla. Suspendisse eu erat eu mi egestas fringilla ac eu elit. Vivamus nec leo ac risus laoreet laoreet.",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                top: 20,
                left: 25,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                )),
            Positioned(
                top: 20,
                right: 25,
                child: GestureDetector(
                  onTap: () {
                    _shareBlog(widget.blog.title);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.share),
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  void _shareBlog(String title) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(title,
        subject: "https://www.geeksforgeeks.org/flutter-share-plus-library/",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}

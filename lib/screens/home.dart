import 'package:flutter/material.dart';
import 'package:blogexplorer/models/blog_model.dart';
import 'package:blogexplorer/screens/screens.dart';
import 'package:blogexplorer/services/api_service.dart';
import 'package:blogexplorer/utils/spacers.dart';
import 'package:blogexplorer/widgets/widgets.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  List<Blog> blogs = [];
  bool isDataLoaded = false;
  String searchText = "";

  Future<void> _fetchBlogs() async {
    final box = await Hive.openBox<Blog>('blogs');
    try {
      final fetchedBlogs = await ApiService.fetchBlogs();
      final filteredBlogs = fetchedBlogs.sublist(1, fetchedBlogs.length);
      setState(() {
        blogs = filteredBlogs;
        isDataLoaded = true;
      });
      box.clear();
      box.addAll(filteredBlogs);

      // Handle the fetched blogs as needed (e.g., update the UI)
    } catch (e) {
      // Handle errors gracefully (e.g., show an error message to the user)
      List<Blog> cachedBlogs = box.values.toList();
      setState(() {
        blogs = cachedBlogs;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Call the API to fetch blogs when the screen is first loaded
    _fetchBlogs();
  }

  void updateSearchText(String text) {
    setState(() {
      searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                floating: true,
                pinned: true,
                snap: true,
                expandedHeight: 350,
                actions: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    child: Text("N"),
                  ),
                  XSpace(20)
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: HomeHead(onSearchTextChanged: updateSearchText),
                ),
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.yellow,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Text(
                      "For You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Latest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Favorites",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              ForYouTab(
                isDataLoaded: isDataLoaded,
                blogs: (searchText == "" ||
                        searchText == null ||
                        searchText.isEmpty)
                    ? blogs
                    : blogs
                        .where((blog) => blog.title
                            .toLowerCase()
                            .contains(searchText.toLowerCase()))
                        .toList(),
              ),
              ForYouTab(
                isDataLoaded: isDataLoaded,
                blogs: blogs,
              ),
              FavoritesScreen(
                isDataLoaded: isDataLoaded,
                blogs: blogs,
              )
            ],
          ),
        ),
      ),
    );
  }
}

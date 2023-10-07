import 'package:flutter/material.dart';

class HomeHead extends StatefulWidget {
  final Function(String) onSearchTextChanged; // Callback function

  const HomeHead({super.key, required this.onSearchTextChanged});

  @override
  _HomeHeadState createState() => _HomeHeadState();
}

class _HomeHeadState extends State<HomeHead> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/onboard.png",
            height: 200,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: _searchController,
              autocorrect: true,
              autofocus: false,
              maxLines: 1,
              onChanged: (text) {
                // Call the callback function whenever the text changes
                widget.onSearchTextChanged(text);
              },
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Search Blogs",
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: Colors.white), // Border color
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

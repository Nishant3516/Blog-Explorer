import 'package:blogexplorer/utils/spacers.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30,
                child: Text("N"),
              ),
              YSpace(10),
              const Text(
                "Nishant Bansal",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              YSpace(20),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("300",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Followers",
                          style: TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  ),
                  XSpace(20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("10",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Following",
                          style: TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  )
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text(
              'Your Articles',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle navigation to the home screen here
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle navigation to the home screen here
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle navigation to the settings screen here
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'LogOut',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

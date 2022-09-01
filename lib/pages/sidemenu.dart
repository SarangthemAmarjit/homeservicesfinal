import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/router/router.gr.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  final String name;
  final String email;
  const NavDrawer({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 105,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/ehomeservice-722a5.appspot.com/o/side.jpg?alt=media&token=c7414349-6ca4-4389-a870-e4352d260f38'))),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.email)
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Profile'),
              onTap: () {
                context.router.push(UserProfileRoute());
              }),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Feedback'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: const Text('About'),
            onTap: () => {},
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text('Confirm'),
                        content: const Text('Do You Want to Logout'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("CANCEL")),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    onPressed: () async {
                                      log('Log Out');
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      if (prefs.containsKey("jwt")) {
                                        prefs.remove("jwt");
                                        prefs.remove('username');
                                        prefs.remove('statuscode');
                                        context.router.replaceNamed('/login');
                                      }
                                    },
                                    child: const Text("YES")),
                              )
                            ],
                          ),
                        ],
                      );
                    }));
              }),
        ],
      ),
    );
  }
}

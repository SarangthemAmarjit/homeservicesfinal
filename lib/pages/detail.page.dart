import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/model/model.dart';
import 'package:homeservice/router/router.gr.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.title,
      required this.data,
      required this.serviceimage})
      : super(key: key);
  final String serviceimage;
  final List data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
              height: 200,
              width: 200,
              child: Image.network(
                serviceimage,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )),
          const Text(
            'Well Experience Persons who can handle this Service are given below :',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 252, 118, 1)),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          // side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      tileColor: Colors.white,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[i].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {
                              log(data[i].name.toString());
                              log(i.toString());

                              context.router
                                  .push(ProfileRoute(userprofile: data[i]));
                            },
                            child: const Text(
                              'Check Profile',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 27, 147, 31),
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () => launchUrlString(
                                    'tel: +91' + data[i].contact),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                  size: 35,
                                ),
                              ),
                              const Text('Call me')
                            ],
                          ),
                        ],
                      )),
                );
              }),
        ],
      ),
    );
  }
}

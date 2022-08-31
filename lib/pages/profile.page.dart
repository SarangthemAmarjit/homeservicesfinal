import 'package:flutter/material.dart';
import 'package:homeservice/Refactor/profile.dart';
import 'package:homeservice/model/model.dart';

class ProfilePage extends StatelessWidget {
  final Datum userprofile;
  const ProfilePage({Key? key, required this.userprofile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 250, 134),
        appBar: AppBar(
          title: const Text("PROFILE"),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Center(
                          child: Text(
                        'Name : ' + userprofile.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ProfileUpdate(
                        text1: 'Contact Number  :', text2: userprofile.contact),
                    ProfileUpdate(
                        text1: 'Address  :', text2: userprofile.address),
                    ProfileUpdate(
                        text1: 'Gender  :', text2: userprofile.gender),
                    ProfileUpdate(
                        text1: 'Experience  :', text2: userprofile.experience),
                    ProfileUpdate(
                        text1: 'Job Type  :', text2: userprofile.jobtype),
                    ProfileUpdate(
                        text1: 'Avaibility  :',
                        text2: userprofile.availability),
                    ProfileUpdate(
                        text1: 'Prefered work Area  :',
                        text2: userprofile.preferedworkarea),
                    ProfileUpdate(
                        text1: 'Service Type  :',
                        text2: userprofile.servicetype),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )),
        ));
  }
}

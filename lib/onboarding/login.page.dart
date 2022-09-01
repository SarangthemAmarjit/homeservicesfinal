import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/core/localdisk.repo.dart/disk.repo.dart';
import 'package:homeservice/logic/counter/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/router/router.gr.dart';
import 'package:homeservice/Refactor/constant.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController _passwordlogin = TextEditingController();
TextEditingController _emaillogin = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  void initState() {
    super.initState;
  }

  void _onLoading() async {
    setState(() {
      isloading = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertbox;
      },
    );
    await context
        .read<CounterCubit>()
        .LoginData(_emaillogin.text, _passwordlogin.text);
    getdata().whenComplete(() {
      Navigator.pop(context);
      setState(() {
        isloading = false;
      });
    });
  }

  Future getdata() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        int status = await DiskRepo().retrieve2();
        if (status == 200) {
          context.read<CounterCubit>().showToast2();
          context.router.replaceNamed('/home');
        } else {
          context.read<CounterCubit>().showToast1();
        }
      }
    } on SocketException catch (_) {
      context.router.replaceNamed('/nointernet');
    }
  }

  regetdata() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        context.router.push(RegisterRoute());
      }
    } on SocketException catch (_) {
      context.router.replaceNamed('/nointernet');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        maxRadius: 50,
                        child: Icon(
                          Icons.home_work_outlined,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("HOME SERVICES PROVIDER"),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              Container(
                decoration: const BoxDecoration(
                    // color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70))),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return "Please Enter a Valid Email Address";
                              }
                            },
                            controller: _emaillogin,
                            decoration: const InputDecoration(
                                labelText: "Email", icon: Icon(Icons.email)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                            },
                            controller: _passwordlogin,
                            decoration: const InputDecoration(
                                labelText: "Password", icon: Icon(Icons.lock)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: (() async {
                    if (_formkey.currentState!.validate()) {
                      _onLoading();
                      log(_emaillogin.text);
                      log(_passwordlogin.text);
                    } else {
                      print('INVALID USERNAME OR PASSWORD');
                    }
                  }),
                  child: Text("Login")),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    regetdata();
                  },
                  child: Text("Register")),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Forgot Password?"),
                TextButton(onPressed: () {}, child: Text("Click here"))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

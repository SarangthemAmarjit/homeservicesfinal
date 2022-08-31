import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/logic/counter/counter_cubit.dart';
import 'package:homeservice/router/router.gr.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
final _usernameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  int regstatuscode = 0;
  void _onLoading() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(8),
            child: const LinearProgressIndicator(
              backgroundColor: Colors.orangeAccent,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ));
      },
    );
    await context.read<CounterCubit>().submitData(_usernameController.text,
        _emailController.text, _passwordController.text);
    getuser();
    Future.delayed(Duration(seconds: 5));
    Navigator.pop(context);
  }

  getuser() async {
    var data = await context.read<CounterCubit>().diskrepo.retrieve2();
    setState(() {
      regstatuscode = data;
    });
    if (regstatuscode == 200) {
      context.read<CounterCubit>().showToast_reg1();
      context.router.push(const HomeRoute());
    } else if (regstatuscode == 400) {
      context.read<CounterCubit>().showToast_reg3();
    } else {
      context.read<CounterCubit>().showToast_reg2();
      log('Error Status Code');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 250,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[200],
        ),
        child: CircleAvatar(
          maxRadius: 50,
          child: Icon(
            Icons.home_work_outlined,
            size: 50,
          ),
        ),
      ),
      Form(
        key: _formkey2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Create Password"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: (() async {
                  if (_formkey2.currentState!.validate()) {
                    _onLoading();
                  } else {
                    print('Form field cant be Empty');
                  }
                }),
                child: Text("Proceed")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already registered?"),
                TextButton(
                    onPressed: () {
                      context.router.push(LoginRoute());
                    },
                    child: Text("Login here"))
              ],
            ),
          ],
        ),
      )
    ]));
  }
}

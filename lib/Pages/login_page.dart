import 'package:flutter/material.dart';
import 'package:flutter_course/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/LoginImage.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Welcome $name",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter username", label: Text('UserName')),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter password", label: Text('Password')),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changedButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changedButton ? 40 : 150,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // shape: changedButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                                Radius.circular(changedButton ? 50 : 5))),
                        child: changedButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       minimumSize: const Size(150, 40)),
                  //   child: const Text("Login"),
                  // )
                ]),
              )
            ],
          ),
        ));
  }
}

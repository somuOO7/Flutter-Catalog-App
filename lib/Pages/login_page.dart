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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

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
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter username", label: Text('UserName')),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }
                        }

                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter password", label: Text('Password')),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(changedButton ? 50 : 5),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changedButton ? 40 : 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: changedButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}

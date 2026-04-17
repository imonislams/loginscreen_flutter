import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen
    extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  TextEditingController
  emailController =
      TextEditingController();
  TextEditingController
  passwordController =
      TextEditingController();
  void login(
    String email,
    String password,
  ) async {
    try {
      Response response = await post(
        Uri.parse(
          "https://reqres.in/api/login",
        ),
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        print(data["token"]);
        print("Login Success");
      } else {
        print(" Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller:
                  emailController,
              decoration:
                  InputDecoration(
                    hintText:
                        "Enter Email",
                  ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller:
                  passwordController,
              decoration:
                  InputDecoration(
                    hintText:
                        "Enter Password",
                  ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                login(
                  emailController.text
                      .toString(),
                  passwordController
                      .text
                      .toString(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.circular(
                        10,
                      ),
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color:
                          Colors.white,
                      fontSize: 20,
                      fontWeight:
                          FontWeight
                              .w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

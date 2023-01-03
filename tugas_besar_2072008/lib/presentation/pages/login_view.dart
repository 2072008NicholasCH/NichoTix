import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_besar_2072008/color_palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo_here_rounded.png',
                  fit: BoxFit.fill,
                  width: 205,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  "Login to your account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Email',
                        labelStyle:
                            const TextStyle(backgroundColor: Colors.white),
                        hintText: 'Email'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                      controller: passController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: "Password",
                        labelStyle:
                            const TextStyle(backgroundColor: Colors.white),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 165,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _auth
                          .signInWithEmailAndPassword(
                              email: emailController.text.toString().trim(),
                              password: passController.text.toString().trim())
                          .then((value) => context.goNamed("home"));
                    } on FirebaseAuthException catch (e) {
                      showNotif(context, e.message.toString());
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(secondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  const Text(
                    "Don't Have an Account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          context.goNamed('signup');
                        },
                        child: const Text("Sign up here",
                            style: TextStyle(
                                color: secondaryColor, fontSize: 16))),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showNotif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: secondaryColor, content: Text(message.toString())),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/services/auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");
  TextEditingController fNameController = TextEditingController(text: "");
  TextEditingController lNameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  String fullName = "";
  int balance = 0;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCol = firestore.collection("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo_here_rounded.png',
                  fit: BoxFit.fill,
                  width: 205,
                )),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                "Create an account:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: fNameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'First Name',
                      labelStyle:
                          const TextStyle(backgroundColor: Colors.white),
                      hintText: 'First Name'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: lNameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Last Name',
                      labelStyle:
                          const TextStyle(backgroundColor: Colors.white),
                      hintText: 'Last Name'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Email',
                      labelStyle:
                          const TextStyle(backgroundColor: Colors.white),
                      hintText: 'Email'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Phone',
                      labelStyle:
                          const TextStyle(backgroundColor: Colors.white),
                      hintText: 'Phone'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    // onPressed: () async {
                    //   user = (await AuthServices.signUp(
                    //       emailController.text, passController.text));
                    //   fullName =
                    //       ("${fNameController.text} ${lNameController.text}");
                    //   userCol.doc(user?.uid).set({
                    //     "name": fullName.toString().trim(),
                    //     "email": emailController.text.toString().trim(),
                    //     "phone": phoneController.text.toString().trim(),
                    //     "balance": balance,
                    //   });
                    //   fNameController.text = "";
                    //   lNameController.text = "";
                    //   emailController.text = "";
                    //   passController.text = "";
                    //   phoneController.text = "";
                    //   context.goNamed('login');
                    // },
                    onPressed: () async {
                      try {
                        fullName =
                            ("${fNameController.text} ${lNameController.text}");

                        final User? user =
                            (await _auth.createUserWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passController.text.trim()))
                                .user;
                        userCol.doc(user?.uid).set({
                          "name": fullName.toString().trim(),
                          "email": emailController.text.toString().trim(),
                          "phone": phoneController.text.toString().trim(),
                          "balance": balance,
                        }).then((value) => context.goNamed("login"));
                      } on FirebaseAuthException catch (e) {
                        // print(e.message.toString());
                        showNotif(context, e.message.toString());
                        fNameController.text = "";
                        lNameController.text = "";
                        emailController.text = "";
                        passController.text = "";
                        phoneController.text = "";
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[Text('Sign Up')],
                    )),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        context.goNamed('login');
                      },
                      child: const Text("Sign in",
                          style:
                              TextStyle(color: secondaryColor, fontSize: 16))),
                )
              ],
            ),
          ])
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

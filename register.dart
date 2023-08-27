
import 'package:flutter_application_1/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  TextEditingController content1 = TextEditingController();
  TextEditingController content2 = TextEditingController();

  final formfield = GlobalKey<FormState>();
  bool passToggle = true;

  void _registerWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful, you can add further logic here.
    } catch (e) {
      print("Registration Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        // appBar: AppBar(
        //   title: const Text("Register"),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/premium-vector/welcoming-woman-girl-saying-hello-waving-with-hand-vector-flat-illustration_605517-721.jpg?w=2000"),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: content1,
                obscureText: passToggle,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      setState(
                        () {
                          passToggle = !passToggle;
                        },
                      );
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: content2,
                obscureText: passToggle,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Password",
                  hintText: "Enter password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      setState(
                        () {
                          passToggle = !passToggle;
                        },
                      );
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var passwordController;
                  var emailController;
                  _registerWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  selectionColor: Colors.amberAccent,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: const Text("Sign in"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

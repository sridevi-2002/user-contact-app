
import 'package:flutter_application_1/contact.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile.dart';

 void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
    home:MyApp(),
  ));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            // User is not logged in, show the login screen
            
        return LoginScreen();
      }else{
        return UserContact();
      }
        }
        return CircularProgressIndicator();
      },
  );
}
}
class LoginScreen extends StatefulWidget {
 @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController content1 = TextEditingController();
  TextEditingController content2 = TextEditingController();

  bool passToggle = true;

void _signInWithEmailAndPassword(String email,String Password) async{
  try{
    var password;
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  Navigator.push(context as BuildContext,
  MaterialPageRoute(builder: (context)=>Profile()));

  
  }catch(e){
    print("Login Error:$e");
  }
 
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        // appBar: AppBar(
        //   title: const Text("USER CONTACTS"),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                   height: 150,width: 200,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/014/212/681/original/female-user-profile-avatar-is-a-woman-a-character-for-a-screen-saver-with-emotions-for-website-and-mobile-app-design-illustration-on-a-white-isolated-background-vector.jpg"),
                  ),
                ),SizedBox(height: 10,),
                SizedBox(
                
                  width: 400,
                  child: TextField(
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
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
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
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserContact()));
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    selectionColor: Colors.amberAccent,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegPage()));
                        },
                        child: const Text("Sign up"))
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

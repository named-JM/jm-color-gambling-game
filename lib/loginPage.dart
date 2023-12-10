import 'package:cosc30_midterm_caguco_set4/registerPage.dart';
import 'package:cosc30_midterm_caguco_set4/welcomePage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
//import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // bool _isElevated = false;
  String emailErrorText = '';
  String passwordErrorText = '';
  bool submitted = false;
  bool obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ----> MY NAME LOGO <----//
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/JoannaLogo.png',
                ),
                fit: BoxFit.cover,
              )),
            ),

            //----> FORM SECTION <----//
            //EMAIL
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 16,
                ),
                //---> Condition that becoming error <---//
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: submitted && emailErrorText.isNotEmpty
                        ? Colors.red.shade900
                        : Colors.grey,
                  ),
                ),
                errorText: submitted ? emailErrorText : null,
              ),
            ),

            //PASSWORD
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: obscurePassword,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: 16,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Toggle between eye and eye-off icons
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: submitted && passwordErrorText.isNotEmpty
                        ? Colors.red.shade900
                        : Colors.grey,
                  ),
                ),
                errorText: submitted ? passwordErrorText : null,
              ),
            ),

            //-----> LOGIN BUTTON FUNCTION HERE!! <-----//
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    submitted = true;
                  });

                  String registeredEmail = 'joanna@gmail.com';
                  String registeredPass = 'joan@123';

                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  setState(() {
                    emailErrorText = '';
                    passwordErrorText = '';
                  });
                  if (email.isNotEmpty && password.isNotEmpty) {
                    if (email == registeredEmail &&
                        password == registeredPass) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                      );
                    } else {
                      if (email != registeredEmail) {
                        setState(() {
                          emailErrorText = 'Invalid username.';
                        });
                      }
                      if (password != registeredPass) {
                        setState(() {
                          passwordErrorText =
                              emailErrorText.isEmpty ? 'Invalid password.' : '';
                        });
                      }

                      showErrorDialog(context, 'Invalid username or password.');
                    }
                  } else {
                    setState(() {
                      emailErrorText =
                          email.isEmpty ? 'Please enter your email.' : '';
                      passwordErrorText =
                          password.isEmpty ? 'Please enter your password.' : '';
                    });
                    showErrorDialog(
                      context,
                      'Please fill in both fields.',
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 0, 0, 0),
                    elevation: 10, //stronger glow effect
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    side: BorderSide(color: Colors.blue)),
                child: Text('Login')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shadowColor: Colors.black,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                side: BorderSide(color: Colors.green),
              ),
              child: Text('Register'),
            ),
          ], //children
        ),
      ),
    );
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Authentication Failed.'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String emailErrorText = '';
  String passwordErrorText = '';
  bool submitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Register'),
      ),
      body: Container(
        color: Colors.grey.shade300,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
            ),

            //-----> My LOGO <------//
            Container(
              height: 200, // height of the logo to top
              child: Image.asset(
                'assets/images/JoannaLogo.png',
                fit: BoxFit.cover,
              ),
            ),

            //-----> here is FILL UP SECTION <-----//

            //---> EMAIL ADDRESS <---//
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                errorText: submitted ? emailErrorText : null,
              ),
            ),
            //----> PASSWORD <----//
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                errorText: submitted ? passwordErrorText : null,
              ),
            ),
            //-----> LOGIN BUTTON FUNCTION <------//
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    submitted = true;
                  });

                  //this is just a simulation keneme registration condition
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  setState(() {
                    passwordErrorText = '';
                  });

                  if (password.isNotEmpty) {
                    if (!RegExp(r'[@#$%^&*()_+{}\[\]:;<>,.?~\\-]')
                            .hasMatch(password) ||
                        !RegExp(r'[0-9]').hasMatch(password)) {
                      setState(() {
                        passwordErrorText =
                            'Password must have atlease one special symbol.';
                      });
                    } else {
                      print('registration successful');
                      //Navigate back to the login page with prefilled values
                      Navigator.pop(
                          context, {'email': email, 'password': password});
                    }
                  } else {
                    //Error meesage for empty password field
                    setState(() {
                      passwordErrorText = 'Please enter password.';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}

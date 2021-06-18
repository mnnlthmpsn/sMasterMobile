import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:sound_kit/models/user.dart';
import 'package:sound_kit/screens/dashboard.dart';
import 'package:sound_kit/screens/forgotPassword.dart';
import 'package:sound_kit/screens/registerScreen.dart';
import 'package:sound_kit/utils/constants.dart';
import 'package:sound_kit/utils/helpers.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // textcontrollers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _login() {
    var user = new User(_emailController.text, _passwordController.text);
    user.signIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Theme(
                      data: ThemeData(
                          accentColor: kPrimaryColor,
                          primarySwatch: Colors.green,
                          colorScheme:
                              ColorScheme.light(primary: kPrimaryColor)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .85,
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) =>
                                    value!.isEmpty ? 'Required Field' : null,
                                decoration: InputDecoration(labelText: 'Email'),
                              )),
                          SizedBox(height: 30),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .85,
                              child: TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (value) =>
                                    value!.isEmpty ? 'Required Field' : null,
                                decoration:
                                    InputDecoration(labelText: 'Password'),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: InkWell(
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              onTap: () => newPageDestroyPrevious(context, Register()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: InkWell(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              onTap: () => newPageDestroyPrevious(context, ForgotPassword()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: TextButton.icon(
                  label: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  icon: Icon(Icons.login),
                  onPressed: () {
                    _formKey.currentState!.validate()
                        ? _login()
                        : null;
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: kPrimaryColor,
                    shape: BeveledRectangleBorder(),
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

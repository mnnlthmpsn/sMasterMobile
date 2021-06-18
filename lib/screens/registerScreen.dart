import 'package:flutter/material.dart';
import 'package:sound_kit/models/user.dart';
import 'package:sound_kit/screens/loginScreen.dart';
import 'package:sound_kit/utils/constants.dart';
import 'package:sound_kit/utils/helpers.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // textcontrollers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signUp() async {
    var user = new User(_emailController.text, _passwordController.text);
    user.signUp(context);
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
                                'Already Signed Up? Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              onTap: () => newPageDestroyPrevious(context, Login()),
                            ),
                          )
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
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                  icon: Icon(Icons.app_registration),
                  onPressed: () {
                    _formKey.currentState!.validate()
                        ? _signUp()
                        : print(false);
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

import 'package:flutter/material.dart';
import 'package:sound_kit/screens/loginScreen.dart';
import 'package:sound_kit/utils/constants.dart';
import 'package:sound_kit/utils/helpers.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                    'Reset Password',
                    style: TextStyle(fontSize: 18),
                  ),
                  icon: Icon(Icons.lock_open),
                  onPressed: () {
                    _formKey.currentState!.validate()
                        ? newPageDestroyPrevious(context, Login())
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

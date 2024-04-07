import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'Register_page.dart';
import 'Menu_page.dart';
import 'EmailValidation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage('',title: 'CoachCook Layout'), // Pass the title here
    );
  }
}


class LoginPage extends StatefulWidget {
  final String title; // Define the title parameter

  const LoginPage(String s, {Key? key, required this.title}) : super(key: key);

  @override
  Login_PageState createState() => Login_PageState();
}


class Login_PageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Coach',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFDE59),
                      ),
                    ),
                    Text(
                      'Cook',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: const {'username': '', 'password': ''},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Please insert email',
                  ),
                  FormBuilderValidators.email(),
                ]),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  filled: true,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Please insert password',
                  ),
                  FormBuilderValidators.minLength(
                    8,
                    errorText: 'Min length 8 characters',
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        // Open SearchPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainMenuPage()),
                        );
                      } else {
                        print("Validation failed");
                      }
                    },
                    color: const Color(0xFFFFDE59),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  MaterialButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        // Open forgetPasswordPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmailValidationPage()),
                        );
                      }
                    },
                    color: const Color(0xFFFFDE59),
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  // Open createPasswordPage
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage(title: 'CoachCook Layout')));
                },
                color: const Color(0xFFFFDE59),
                child: const Text(
                  "Create Password",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}


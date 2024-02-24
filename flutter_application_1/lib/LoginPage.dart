import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Login_PageState createState() => Login_PageState();
}

class Login_PageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
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
        padding: EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {'username': '', 'password': ''},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'username',
                decoration: InputDecoration(
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
              SizedBox(height: 15),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: InputDecoration(
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        // Open SearchPage
                        Navigator.pushNamed(context, '/ ');
                      } else {
                        print("Validation failed");
                      }
                    },
                    color: Color(0xFFFFDE59),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 10),
                  MaterialButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        // Open forgetPasswordPage
                        Navigator.pushNamed(context, '/ ');
                      } 
                    },
                    color: Color(0xFFFFDE59),
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 15),
              MaterialButton(
                onPressed: () {
                  _formKey.currentState!.save();
                      
                        // Open createPasswordPage
                  Navigator.pushNamed(context, '/ ');
                      
                },
                color: Color(0xFFFFDE59),
                child: Text(
                  "Create Password",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

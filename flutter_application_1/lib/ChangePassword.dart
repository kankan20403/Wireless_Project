import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ChangePasswordPage(),
        '/ChangePasswordPage': (context) => const ChangePasswordPage(),
      },
    );
  }
}*/

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  String? _oldPassword;

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
          initialValue: {'password': '', 'newPassword': ''},
          onChanged: () {
            _formKey.currentState!.save();
            _oldPassword = _formKey.currentState!.fields['password']!.value;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(height: 15),
              FormBuilderTextField(
                name: 'newPassword',
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  filled: true,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Please insert new password',
                  ),
                  FormBuilderValidators.minLength(
                    8,
                    errorText: 'Min length 8 characters',
                  ),
                  (value) {
                    if (value == _oldPassword) {
                      return 'New password must be different from old password';
                    }
                    return null;
                  },
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
                        Navigator.pushNamed(context, '/MainPage'); //Menu_page
                      } else {
                        print("Validation failed");
                      }
                    },
                    color: Color(0xFFFFDE59),
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:proj1/pages/OTPValidation.dart';

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
        '/': (context) => const EmailValidationPage(),
        '/EmailValidationPage': (context) => const EmailValidationPage(),
      },
    );
  }
}*/

class EmailValidationPage extends StatefulWidget {
  const EmailValidationPage({Key? key}) : super(key: key);

  @override
  _EmailValidationPageState createState() => _EmailValidationPageState();
}

class _EmailValidationPageState extends State<EmailValidationPage> {
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
          initialValue: {'username': ''},
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        // Navigate to OTPValidationPage
                        Navigator.pushNamed(context, '/OTPValidationPage');
                      } else {
                        print("Validation failed");
                      }
                    },
                    color: Color(0xFFFFDE59),
                    child: Text(
                      "Send OTP",
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

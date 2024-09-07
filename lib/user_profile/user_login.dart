import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoes_app_ui/home/home_screen.dart';
import 'package:shoes_app_ui/validations/user_validations.dart';
import 'package:shoes_app_ui/widget/shoes_textfield.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool _isButtonEnabel = false;

  void validateForm() {
    final isValidEmail = validator.validateEmail(emailC.text) == null;
    final isValidPassword = validator.validateEmail(emailC.text) == null;

    setState(() {
      _isButtonEnabel = isValidEmail && isValidPassword;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailC.addListener(validateForm);
    passwordC.addListener(validateForm);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailC.removeListener(validateForm);
    passwordC.removeListener(validateForm);
    emailC.dispose();
    passwordC.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Hello!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Welocme back you've been missed",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Your email"),
                ),
              ],
            ),
            ShoesTextField(
              controller: emailC,
              hinttext: "enter your email",
              onchanged: (Text) {
                validateForm();
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Your email"),
                ),
              ],
            ),
            ShoesTextField(
              controller: passwordC,
              hinttext: "enter your valid password",
              onchanged: (Text) {
                validateForm();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text("Forget password"),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color:_isButtonEnabel? Colors.grey: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                
                onPressed:_isButtonEnabel? () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                }: null,
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

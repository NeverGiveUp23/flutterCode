import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegExp emailValid =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+');

  bool obsureText = true;

  @override
  Widget build(BuildContext context) {
    final hiddenPassword = obsureText == true
        ? TextButton(
            onPressed: () {
              setState(() {
                obsureText = false;
              });
            },
            child: const Text("Show Password"))
        : TextButton(
            onPressed: () {
              setState(() {
                obsureText = true;
              });
            },
            child: const Text("Hide Password"));

    emailValidator(value) {
      if (value == null || value.isEmpty) {
        return " Email is required";
      } else if (!value.contains(emailValid)) {
        return "Email is invalid";
      }
      return null;
    }

    return Scaffold(
        body: Form(
      key: _signInKey,
      // for multiple fields
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Sign up to Twitter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // textFormField -> comes with validator class
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Enter An Email",
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                validator: emailValidator,
              ),
            ), // email
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: _passwordController,
                obscureText: obsureText,
                decoration: const InputDecoration(
                  hintText: "Enter password",
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
            ), // password
            Container(
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                  onPressed: () {
                    if (_signInKey.currentState!.validate()) {
                      debugPrint("Email: ${_emailController.text}");
                      debugPrint("Password: ${_passwordController.text}");
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            // password show / hid
            hiddenPassword,

            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Have an Account? Log in"))
          ]),
    ));
  }
}

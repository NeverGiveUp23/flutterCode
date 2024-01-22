import 'package:flutter/material.dart';
import 'package:flutter_stop_watch/stop_watch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool loggedIn = false;
  String name = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _buildLoginForm(),
    );
  }

  // Widget _buildSuccess() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Icon(
  //         Icons.check,
  //         color: Colors.orangeAccent,
  //       ),
  //       Text('Hi $name'),
  //     ],
  //   );
  // }

  _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Runner'),
              validator: (text) =>
                  text!.isEmpty ? 'Enter the runner\'s name' : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text!.isEmpty) {
                  return ' Enter the runner\'s email';
                }
                final regex = RegExp('[^@]+@[^.]+..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _validate,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;

    if (form?.validate() == false) {
      return;
    }

    final name = _nameController.text;
    final email = _emailController.text;

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => StopWatch(name: name, email: email),
    ));
  }
}

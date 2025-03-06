// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  void initState() {
    SharedPreferences.getInstance()
        .then((value) => emailController.text = value.getString('Email') ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final autenticar = Provider.of<AuthProvider>(context, listen: false);
    // final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 32, right: 32),
          color: const Color.fromARGB(255, 224, 229, 231),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 380,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/adatech/adatech.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      // color: paleteColors.elementAt(5),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onEditingComplete: () async {
                  if (_formKey.currentState!.validate()) {
                    // await auth(context, user, autenticar);
                  }
                },
                keyboardType: TextInputType.number,
                controller: senhaController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  fillColor: Colors.teal,
                  suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.lock_open : Icons.lock_outline,
                        // color: paleteColors.elementAt(7)
                      )),
                  labelText: 'Senha',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      // color: paleteColors.elementAt(5),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
                },
                label: const Text('Login'),
                icon: const Icon(Icons.login),
              )
            ],
          ),
        ),
      ),
    );
  }
}

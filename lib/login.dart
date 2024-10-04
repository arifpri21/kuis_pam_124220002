import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 145, 237),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: false,
        title: const Text(
          'Login Page',
          textAlign: TextAlign.center,
        ),
      ),
      //body login
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Image(image: AssetImage('assets/upnLogo.png')),
              ),

              // Textfield Username
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
              ),

              // Textfield password
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
              ),

              // Button
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 7, 145, 237)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () {
                      if (username == 'admin' && password == 'admin') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Login Berhasil!'),
                          backgroundColor: Colors.green,
                        ));

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      username: username,
                                    )));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Login Gagal!'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

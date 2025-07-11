import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function(String) onLogin;

  const LoginPage({super.key, required this.onLogin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Digite seu nome para começar:'),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  widget.onLogin(controller.text);
                }
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

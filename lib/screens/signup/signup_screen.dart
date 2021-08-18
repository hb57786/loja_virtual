import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome Completo'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Repita a Senha'),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 44.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.teal[100]; // Disabled color
                      }
                      return Colors.teal[600]; // Regular color
                    }),
                  ),
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(fontSize: 18),
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

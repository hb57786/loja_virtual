import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final UserData user = UserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name.isEmpty)
                      return 'Campo Obrigatório';
                    else if (name.trim().split(' ').length <= 1)
                      return 'Preencha seu nome completo';
                    return null;
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email.isEmpty)
                      return 'Campo Obrigatório';
                    else if (!emailValid(email)) return 'E-mail inválido';
                    return null;
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty)
                      return 'Campo Obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (pass) => user.password = pass,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty)
                      return 'Campo Obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (pass) => user.confirmPassword = pass,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (user.password != user.confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Senhas não coincidem!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        context.read<UserManager>().signUp(
                              user: user,
                              onSuccess: () {
                                debugPrint('sucesso');
                                // TODO: POP
                              },
                              onFail: (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Falha ao Cadastrar: $e'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            );
                      }
                    },
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
      ),
    );
  }
}

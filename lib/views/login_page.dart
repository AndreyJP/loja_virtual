import 'package:flutter/material.dart';
import 'package:loja_virtual/components/form_text_field.dart';
import 'package:loja_virtual/components/main_button.dart';
import 'package:loja_virtual/controller/acess_controller.dart';
import 'package:loja_virtual/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormTextField(
                  labelText: 'Usuário',
                  hintText: 'Usuário',
                  textController: _usernameController,
                  iconInput: const Icon(Icons.person_outline),
                  inputValidator: (username) {
                    if (username == null || username.isEmpty) {
                      return 'Por favor, preencha o campo usuário';
                    }
                    return null;
                  },
                ),
                FormTextField(
                  labelText: 'Senha',
                  hintText: 'Senha',
                  textController: _passwordController,
                  iconInput: const Icon(Icons.security),
                  obscureText: true,
                  inputValidator: (passwd) {
                    if (passwd == null || passwd.isEmpty) {
                      return 'Por favor, preencha o campo senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                mainButton(
                  buttonText: 'Login',
                  buttonCollor: Colors.grey,
                  buttonFunction: () async {
                    final navigator = Navigator.of(context);
                    final messenger = ScaffoldMessenger.of(context);

                    if (_formKey.currentState!.validate()) {
                      bool loginSucess = await AcessController.instance.login(
                          _usernameController.text, _passwordController.text);

                      if (loginSucess) {
                        navigator.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Usuário e/ou senha incorretos'),
                            backgroundColor: Color.fromARGB(255, 227, 113, 105),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

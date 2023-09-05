import 'package:flutter/material.dart';
import 'package:loja_virtual/controller/acess_controller.dart';
import 'package:loja_virtual/views/home_page.dart';
import 'package:loja_virtual/views/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  void initState(){
    super.initState();
    AcessController.instance.verificarToken().then((hasToken){
      if(hasToken){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text('Carregando...'),
          ],
        ),
      ),
    );
  }
}
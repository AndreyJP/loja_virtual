import 'package:flutter/material.dart';
import 'package:loja_virtual/components/profile_menu_option.dart';
import 'package:loja_virtual/controller/acess_controller.dart';
import 'package:loja_virtual/controller/user_controller.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/views/product_page.dart';
import 'package:loja_virtual/views/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<User> _user;

  @override
  void initState() {
    super.initState();
    _user = UserController.instance.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Virtual'),
        backgroundColor: Colors.grey,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Sair',
                child: const Text('Sair'),
                onTap: () async {
                  final navigator = Navigator.of(context);
                  bool logout = await AcessController.instance.logout();
                  if (logout) {
                    navigator.pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<User>(
              future: _user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.network(
                          snapshot.data!.image,
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          snapshot.data!.email,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () async {
                              final navigator = Navigator.of(context);
                              bool logout =
                                  await AcessController.instance.logout();
                              if (logout) {
                                navigator.pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const WelcomePage(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text('Encerrar Sessão'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileMenuOption(
                          title: 'Ver produtos',
                          icon: Icons.view_list,
                          iconColor: Colors.grey,
                          onPress: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductPage()),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileMenuOption(
                          title: 'Ver categorias',
                          icon: Icons.category,
                          iconColor: Colors.grey,
                          onPress: (){},
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
      
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

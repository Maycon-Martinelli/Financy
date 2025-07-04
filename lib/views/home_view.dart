import 'package:flutter/material.dart';
import 'animal_list_view.dart';
import 'animal_form_view.dart';
import 'favoritos_view.dart';
import 'mensagem_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoção'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        elevation: 4,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal[700],
                image: const DecorationImage(
                  image: AssetImage('assets/images/pet_header.png'),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.pets,
                    text: 'Animais disponíveis',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AnimalListView()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.add_circle_outline,
                    text: 'Cadastrar animal',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AnimalFormView()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.message_outlined,
                    text: 'Mensagens',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MensagemView()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.favorite_border,
                    text: 'Favoritos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FavoritosView()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.pets,
                size: 80,
                color: Colors.teal,
              ),
              SizedBox(height: 16),
              Text(
                'Bem-vindo ao Pet Adoção!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Aqui você encontra seu novo melhor amigo.',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF607D8B), // Um azul acinzentado parecido com blueGrey
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal[700]),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      hoverColor: Colors.teal[100],
      onTap: onTap,
    );
  }
}

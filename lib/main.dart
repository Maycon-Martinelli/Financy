import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'theme/app_theme.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/cadastro_view.dart';
import 'views/animal_list_view.dart';
import 'views/animal_form_view.dart';
import 'views/animal_detal_view.dart';
import 'views/favoritos_view.dart';
import 'views/mensagem_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Adoção de Animais',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/home': (context) => const HomeView(),
        '/cadastro': (context) => const CadastroView(),
        '/animais': (context) => const AnimalListView(),
        '/novo-animal': (context) => const AnimalFormView(),
        '/favoritos': (context) => const FavoritosView(),
        '/mensagens': (context) => const MensagemView(),
        // Detalhe de animal é com `MaterialPageRoute` diretamente, pois recebe argumento
      },
    );
  }
}

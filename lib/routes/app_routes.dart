import 'package:flutter/material.dart';
import '../views/login_view.dart';
import '../views/home_view.dart';
import '../views/cadastro_view.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginView(),
  '/home': (context) => HomeView(),
  '/cadastro': (context) => const CadastroView(),
};

import 'package:flutter/material.dart';
import 'package:senai/screens/cadastro_screen.dart';
import 'package:senai/screens/home_screen.dart';
import 'package:senai/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Senai',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const MyHomePage(title: 'Sistema de cadastro'),
          '/home': (context) => const HomeScreen('Sistema de cadastro'),
          '/cadastro': (context) => const CadastroScreen('Sistema de cadastro')
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _logar() {
    setState(() {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen(widget.title, _logar);
  }
}

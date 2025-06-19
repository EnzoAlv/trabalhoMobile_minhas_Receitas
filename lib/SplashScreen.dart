import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meu_caderno_de_receitas/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F7), // Um azul claro para o fundo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibe a imagem do logo que foi adicionada em pubspec.yaml
            Image.asset(
              "lib/imagens/logo.png", // Caminho da imagem
              width: 150, // Largura da imagem
              height: 150, // Altura da imagem
            ),
            const SizedBox(height: 20), // Espaçamento entre o logo e o texto
            const Text(
              "Meu Caderno de Receitas",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263238), // Cor de texto mais escura
              ),
            ),
            const SizedBox(height: 10), // Espaçamento
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4DD0E1)), // Cor do indicador de progresso
              strokeWidth: 3, // Espessura do indicador de progresso
            ),
          ],
        ),
      ),
    );
  }
}

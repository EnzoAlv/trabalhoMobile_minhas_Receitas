// lib/Home.dart
import 'package:flutter/material.dart';
import 'package:meu_caderno_de_receitas/receita_model.dart';
import 'package:meu_caderno_de_receitas/adicionar_receita.dart';
import 'package:meu_caderno_de_receitas/detalhes_receita.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Receita> _listaReceitas = [];

  @override
  void initState() {
    super.initState();
    _carregarReceitas();
  }

  Future<void> _carregarReceitas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? receitasString = prefs.getString('minhasReceitas');
    if (receitasString != null) {
      final List<dynamic> jsonList = json.decode(receitasString);
      setState(() {
        _listaReceitas.clear();
        _listaReceitas
            .addAll(jsonList.map((json) => Receita.fromJson(json)).toList());
      });
    }
  }

  Future<void> _salvarReceitas() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString =
        json.encode(_listaReceitas.map((receita) => receita.toJson()).toList());
    await prefs.setString('minhasReceitas', jsonString);
  }

  Future<void> _adicionarReceita() async {
    final novaReceita = await Navigator.push<Receita>(
      context,
      MaterialPageRoute(builder: (context) => const AdicionarReceita()),
    );

    if (novaReceita != null) {
      setState(() {
        _listaReceitas.add(novaReceita);
      });
      await _salvarReceitas();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Receita adicionada com sucesso!')),
      );
    }
  }

  void _excluirReceita(int index) {
    setState(() {
      _listaReceitas.removeAt(index);
    });
    _salvarReceitas();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Receita excluída!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Caderno de Receitas"),
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarReceita,
        child: const Icon(Icons.add),
        tooltip: 'Adicionar nova receita',
      ),
      body: _listaReceitas.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Nenhuma receita adicionada.\nClique no '+' para começar!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _listaReceitas.length,
              itemBuilder: (context, index) {
                final receita = _listaReceitas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    title: Text(
                      receita.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Categoria: ${receita.categoria}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetalhesReceita(receita: receita),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => _excluirReceita(index),
                      tooltip: 'Excluir receita',
                    ),
                  ),
                );
              },
            ),
    );
  }
}

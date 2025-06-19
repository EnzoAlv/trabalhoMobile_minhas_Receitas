// lib/adicionar_receita.dart
import 'package:flutter/material.dart';
import 'package:meu_caderno_de_receitas/receita_model.dart';
import 'package:uuid/uuid.dart'; // Necessário para gerar IDs únicos

class AdicionarReceita extends StatefulWidget {
  const AdicionarReceita({Key? key}) : super(key: key);

  @override
  State<AdicionarReceita> createState() => _AdicionarReceitaState();
}

class _AdicionarReceitaState extends State<AdicionarReceita> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _ingredientesController = TextEditingController();
  final _modoDePreparoController = TextEditingController();
  String _categoriaSelecionada = 'Outros'; // Valor inicial para a categoria

  // Lista de categorias para o dropdown
  final List<String> _categorias = [
    'Salgado',
    'Doce',
    'Bebida',
    'Café da Manhã',
    'Almoço',
    'Jantar',
    'Sobremesa',
    'Acompanhamento',
    'Lanche',
    'Outros',
  ];

  @override
  void dispose() {
    _nomeController.dispose();
    _ingredientesController.dispose();
    _modoDePreparoController.dispose();
    super.dispose();
  }

  void _salvarReceita() {
    if (_formKey.currentState!.validate()) {
      var uuid = const Uuid();
      final novaReceita = Receita(
        id: uuid.v4(), // Gera um ID único
        nome: _nomeController.text,
        ingredientes: _ingredientesController.text,
        modoDePreparo: _modoDePreparoController.text,
        categoria: _categoriaSelecionada,
      );
      Navigator.pop(context, novaReceita); // Retorna a nova receita para a tela anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Nova Receita"),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome da Receita',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.receipt_long),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da receita';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ingredientesController,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Ingredientes (um por linha)',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.food_bank),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira os ingredientes';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _modoDePreparoController,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Modo de Preparo',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.restaurant_menu),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modo de preparo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _categoriaSelecionada,
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.category),
                ),
                items: _categorias.map((String categoria) {
                  return DropdownMenuItem<String>(
                    value: categoria,
                    child: Text(categoria),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _categoriaSelecionada = newValue!;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _salvarReceita,
                icon: const Icon(Icons.save),
                label: const Text('Salvar Receita'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
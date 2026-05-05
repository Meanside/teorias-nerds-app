import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theory_project/controllers/theory_controller.dart';

class AddTheoryView extends StatefulWidget {
  const AddTheoryView({Key? key}) : super(key: key);

  @override
  State<AddTheoryView> createState() => _AddTheoryViewState();
}

class _AddTheoryViewState extends State<AddTheoryView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedCategory = 'Filmes';

  final List<String> _categories = ['Filmes', 'Séries', 'Anime', 'HQs', 'Jogos'];

  @override
  Widget build(BuildContext context) {
    final theoryController = Get.find<TheoryController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Teoria'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título da Teoria',
                  hintText: 'Ex: A verdadeira identidade do vilão...',
                ),
                validator: (value) => value!.isEmpty ? 'Insira um título' : null,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Categoria'),
                items: _categories.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contentController,
                maxLines: 8,
                decoration: const InputDecoration(
                  labelText: 'Conteúdo',
                  hintText: 'Escreva sua teoria detalhadamente aqui...',
                  alignLabelWithHint: true,
                ),
                validator: (value) => value!.isEmpty ? 'O conteúdo não pode ser vazio' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    theoryController.addTheory(
                      _titleController.text,
                      _selectedCategory,
                      _contentController.text,
                    );
                  }
                },
                child: const Text('Publicar Teoria'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

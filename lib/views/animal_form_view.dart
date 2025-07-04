import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../services/animal_service.dart';

class AnimalFormView extends StatefulWidget {
  const AnimalFormView({super.key});

  @override
  State<AnimalFormView> createState() => _AnimalFormViewState();
}

class _AnimalFormViewState extends State<AnimalFormView> {
  final _formKey = GlobalKey<FormState>();
  final _service = AnimalService();

  final _nome = TextEditingController();
  final _idade = TextEditingController();
  final _raca = TextEditingController();
  final _descricao = TextEditingController();

  String _especie = 'Cachorro';
  String _porte = 'Médio';

void _salvar() async {
  if (_formKey.currentState!.validate()) {
    final novo = Animal(
      id: DateTime.now().toIso8601String(),
      nome: _nome.text.trim(),
      idade: int.parse(_idade.text),
      raca: _raca.text.trim(),
      especie: _especie,
      porte: _porte,
      descricao: _descricao.text.trim(),
      status: 'disponivel',
      fotos: [
        'https://place-puppy.com/300x300', // pode mudar depois
      ],
      donoId: 'usuario_123',
    );

    await _service.adicionarAnimal(novo); // <- aqui está a correção

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Animal cadastrado com sucesso!')),
    );

    Navigator.pop(context);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Animal'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nome,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _idade,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Idade'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe a idade';
                  if (int.tryParse(value) == null) return 'Idade inválida';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _raca,
                decoration: const InputDecoration(labelText: 'Raça'),
                validator: (value) => value == null || value.isEmpty ? 'Informe a raça' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _especie,
                decoration: const InputDecoration(labelText: 'Espécie'),
                items: const [
                  DropdownMenuItem(value: 'Cachorro', child: Text('Cachorro')),
                  DropdownMenuItem(value: 'Gato', child: Text('Gato')),
                  DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                ],
                onChanged: (value) {
                  setState(() {
                    _especie = value!;
                  });
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _porte,
                decoration: const InputDecoration(labelText: 'Porte'),
                items: const [
                  DropdownMenuItem(value: 'Pequeno', child: Text('Pequeno')),
                  DropdownMenuItem(value: 'Médio', child: Text('Médio')),
                  DropdownMenuItem(value: 'Grande', child: Text('Grande')),
                ],
                onChanged: (value) {
                  setState(() {
                    _porte = value!;
                  });
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descricao,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) => value == null || value.isEmpty ? 'Informe uma descrição' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _salvar,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

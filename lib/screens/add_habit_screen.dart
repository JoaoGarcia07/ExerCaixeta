import 'package:flutter/material.dart';
import '../models/habito.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _titulo = TextEditingController();
  final _desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Hábito')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _titulo, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Descrição')),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF005293), foregroundColor: const Color(0xFFFECB00)),
              onPressed: () {
                if (_titulo.text.isNotEmpty) {
                  Navigator.pop(context, Habito(titulo: _titulo.text, descricao: _desc.text));
                }
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
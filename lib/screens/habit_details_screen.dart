import 'package:flutter/material.dart';
import '../models/habito.dart';

class HabitDetailsScreen extends StatelessWidget {
  final Habito habito;
  const HabitDetailsScreen({super.key, required this.habito});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(habito.titulo, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF005293))),
            const SizedBox(height: 10),
            Text(habito.descricao, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Icon(
              habito.concluido ? Icons.check_circle : Icons.pending,
              size: 100,
              color: habito.concluido ? Colors.green : Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
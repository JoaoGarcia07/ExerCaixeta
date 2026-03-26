import 'package:flutter/material.dart';
import '../models/habito.dart';
import 'habit_details_screen.dart';
import 'add_habit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habito> listaHabitos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _simularCarregamento();
  }

  // [Requisito 19] Simulação de carregamento assíncrono
  Future<void> _simularCarregamento() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      listaHabitos = [
        Habito(titulo: 'Beber Água', descricao: 'Meta de 2L por dia'),
        Habito(titulo: 'Estudar Flutter', descricao: 'Praticar widgets e estados'),
        Habito(titulo: 'Exercitar-se', descricao: '30 min de caminhada'),
        Habito(titulo: 'Ler Livro', descricao: 'Ler 10 páginas de manhã'),
        Habito(titulo: 'Meditar', descricao: '10 min de respiração'),
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const azul = Color(0xFF005293); // Cor da Suécia
    const amarelo = Color(0xFFFECB00); // Cor da Suécia

    return Scaffold(
      appBar: AppBar(title: const Text('Controle de Hábitos 🇸🇪')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: azul))
          : ListView.builder(
              itemCount: listaHabitos.length,
              itemBuilder: (context, index) {
                final h = listaHabitos[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    // [Requisito 15] Marcar como concluído
                    leading: Checkbox(
                      activeColor: azul,
                      checkColor: amarelo,
                      value: h.concluido,
                      onChanged: (val) => setState(() => h.concluido = val!),
                    ),
                    title: Text(
                      h.titulo,
                      style: TextStyle(
                        color: azul,
                        fontWeight: FontWeight.bold,
                        decoration: h.concluido ? TextDecoration.lineThrough : null, // [Requisito 18]
                      ),
                    ),
                    // Função de Excluir
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => setState(() => listaHabitos.removeAt(index)),
                    ),
                    // [Requisito 21/22] Navegação para Detalhes
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HabitDetailsScreen(habito: h)),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: azul,
        foregroundColor: amarelo,
        child: const Icon(Icons.add),
        onPressed: () async {
          final novo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddHabitScreen()),
          );
          if (novo != null) setState(() => listaHabitos.add(novo));
        },
      ),
    );
  }
}
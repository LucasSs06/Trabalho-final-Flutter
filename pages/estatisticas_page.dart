import 'package:flutter/material.dart';

class EstatisticasPage extends StatelessWidget {
  const EstatisticasPage({super.key});

  @override
  Widget build(BuildContext context) {
    int totalTarefas = 12;
    int concluidas = 7;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total de Tarefas: $totalTarefas',
              style: const TextStyle(fontSize: 20)),
          Text('Concluídas: $concluidas',
              style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: concluidas / totalTarefas,
            minHeight: 10,
          ),
          const SizedBox(height: 10),
          Text(
              '${((concluidas / totalTarefas) * 100).toStringAsFixed(1)}% concluído'),
        ],
      ),
    );
  }
}

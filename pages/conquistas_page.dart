import 'package:flutter/material.dart';

class ConquistasPage extends StatelessWidget {
  const ConquistasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // aqui futuramente você pode passar número de tarefas concluídas ou XP
    int conquistasDesbloqueadas = 3;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
          const SizedBox(height: 20),
          Text(
            'Você desbloqueou $conquistasDesbloqueadas conquistas!',
            style: const TextStyle(fontSize: 18),
          ),
          if (conquistasDesbloqueadas >= 1)
            const Text('🏅 Nível Bronze conquistado!'),
          if (conquistasDesbloqueadas >= 5)
            const Text('🥈 Nível Prata conquistado!'),
          if (conquistasDesbloqueadas >= 10)
            const Text('🥇 Nível Ouro conquistado!'),
        ],
      ),
    );
  }
}

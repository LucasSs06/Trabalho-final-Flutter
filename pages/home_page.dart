import 'package:flutter/material.dart';
import 'tarefas_page.dart';
import 'conquistas_page.dart';
import 'estatisticas_page.dart';

class HomePage extends StatefulWidget {
  final String usuario;

  const HomePage({super.key, required this.usuario});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      TarefasPage(),
      ConquistasPage(),
      EstatisticasPage(),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Olá, ${widget.usuario}')),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Conquistas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Estatísticas',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Tarefa {
  String titulo;
  bool concluida;

  Tarefa(this.titulo, {this.concluida = false});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? usuario;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Gamificada',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: usuario == null
          ? LoginPage(onLogin: (nome) {
              setState(() {
                usuario = nome;
              });
            })
          : HomePage(usuario: usuario!),
    );
  }
}

class LoginPage extends StatefulWidget {
  final void Function(String) onLogin;

  const LoginPage({super.key, required this.onLogin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Digite seu nome para começar:'),
            TextField(controller: controller),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  widget.onLogin(controller.text);
                }
              },
              child: const Text('Entrar'),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String usuario;

  const HomePage({super.key, required this.usuario});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Tarefa> tarefas = [];

  @override
  Widget build(BuildContext context) {
    final pages = [
      TarefasPage(
        tarefas: tarefas,
        onToggle: (i) {
          setState(() {
            tarefas[i].concluida = !tarefas[i].concluida;
          });
        },
        onAdd: (titulo) {
          setState(() {
            tarefas.add(Tarefa(titulo));
          });
        },
      ),
      ConquistasPage(tarefasConcluidas:
          tarefas.where((t) => t.concluida).length),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Olá, ${widget.usuario}')),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.check_box), label: 'Tarefas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), label: 'Conquistas'),
        ],
      ),
    );
  }
}

class TarefasPage extends StatelessWidget {
  final List<Tarefa> tarefas;
  final void Function(int) onToggle;
  final void Function(String) onAdd;

  const TarefasPage({
    super.key,
    required this.tarefas,
    required this.onToggle,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Nova tarefa'),
              )),
              IconButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      onAdd(controller.text);
                      controller.clear();
                    }
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (context, i) {
              final tarefa = tarefas[i];
              return ListTile(
                title: Text(
                  tarefa.titulo,
                  style: TextStyle(
                      decoration: tarefa.concluida
                          ? TextDecoration.lineThrough
                          : null),
                ),
                trailing: Checkbox(
                  value: tarefa.concluida,
                  onChanged: (_) => onToggle(i),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ConquistasPage extends StatelessWidget {
  final int tarefasConcluidas;

  const ConquistasPage({super.key, required this.tarefasConcluidas});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
          const SizedBox(height: 20),
          Text(
            'Você completou $tarefasConcluidas tarefas!',
            style: const TextStyle(fontSize: 20),
          ),
          if (tarefasConcluidas >= 5)
            const Text('🏅 Parabéns, você desbloqueou o nível Bronze!'),
          if (tarefasConcluidas >= 10)
            const Text('🥈 Incrível! Nível Prata!'),
          if (tarefasConcluidas >= 20)
            const Text('🥇 Mestre das Tarefas! Nível Ouro!'),
        ],
      ),
    );
  }
}

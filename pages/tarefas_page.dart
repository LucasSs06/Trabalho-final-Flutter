import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  List<Tarefa> tarefas = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      tarefas.add(Tarefa(titulo: controller.text));
                    });
                    controller.clear();
                  }
                },
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (context, i) {
              final t = tarefas[i];
              return ListTile(
                title: Text(
                  t.titulo,
                  style: TextStyle(
                      decoration:
                          t.concluida ? TextDecoration.lineThrough : null),
                ),
                trailing: Checkbox(
                  value: t.concluida,
                  onChanged: (_) {
                    setState(() {
                      t.concluida = !t.concluida;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

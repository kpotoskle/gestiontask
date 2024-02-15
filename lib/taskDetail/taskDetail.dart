import 'package:flutter/material.dart';
import 'package:gestiontask/Task.dart';
import 'package:gestiontask/constant.dart';
import 'package:gestiontask/taskEdit/taskEdit.dart';

class detailTaskPage extends StatefulWidget {
  final int position;

  detailTaskPage({required this.position});

  @override
  State<detailTaskPage> createState() => _detailTaskPageState();
}

class _detailTaskPageState extends State<detailTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Tâche'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              print(widget.position);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editTaskPage(number: widget.position),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre: ${task[widget.position].titre}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date d\'échéance: ${task[widget.position].date}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Statut: ${task[widget.position].statut ? 'Complété' : 'Non Complété'}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

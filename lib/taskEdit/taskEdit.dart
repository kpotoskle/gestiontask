import 'package:flutter/material.dart';
import 'package:gestiontask/Task.dart';
import 'package:gestiontask/constant.dart';
import 'package:gestiontask/taskList/taskList.dart';
import 'package:google_fonts/google_fonts.dart';
class editTaskPage extends StatefulWidget {
  final int number;
  const editTaskPage({super.key,required this.number});

  @override
  State<editTaskPage> createState() => _editTaskPageState();
}

class _editTaskPageState extends State<editTaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: task[widget.number].titre);
    _dateController = TextEditingController(text: task[widget.number].date);
    isCompleted = task[widget.number].statut;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier la Tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titre de la tâche'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5, top: 10),
              child: TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Date d'échéance",
                    labelStyle: GoogleFonts.aBeeZee(
                        color: Colors.black
                    ),
                    contentPadding: EdgeInsets.all(15)),
                onTap: () async {
                  // Afficher le DatePicker lorsque l'utilisateur tape sur le champ de date
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  // Mettre à jour le champ de texte avec la date sélectionnée
                  if (selectedDate != null && selectedDate != DateTime.now()) {
                    _dateController.text = selectedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Statut :'),
                Checkbox(
                  value: isCompleted,
                  onChanged: (value) {
                    setState(() {
                      isCompleted = value!;
                    });
                  },
                ),
                Text('Complété'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              print(widget.number);
               task[widget.number].titre = _titleController.text;
               task[widget.number].date = _dateController.text;
               task[widget.number].statut = isCompleted;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listTaskPage()),
              );
              },
              child: Text('Enregistrer les modifications'),
            ),
          ],
        ),
      ),
    );
  }
}
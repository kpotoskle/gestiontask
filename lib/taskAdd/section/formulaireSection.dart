import 'package:flutter/material.dart';
import 'package:gestiontask/Task.dart';
import 'package:gestiontask/constant.dart';
import 'package:gestiontask/taskList/taskList.dart';
import 'package:google_fonts/google_fonts.dart';

class showForm extends StatefulWidget {
  const showForm({super.key});

  @override
  State<showForm> createState() => _showFormState();
}

class _showFormState extends State<showForm> {
  final TextEditingController titreController =  TextEditingController();
  final TextEditingController dateController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20,left: 50,right: 50,top: 20),
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          InputForm("Titre ",titreController),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5, top: 10),
            child: TextFormField(
              controller: dateController,
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
                  dateController.text = selectedDate.toLocal().toString().split(' ')[0];
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String title = titreController.text;
              String date = dateController.text;
              Task newTask = Task(
                titre: title,
                date: date,
                statut: false,
              );
              task.add(newTask);
              titreController.clear();
              dateController.clear();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listTaskPage()),
              );
            },
            child: Text('Ajouter la tâche'),
          ),
        ],
      ),
    );
  }
}


Widget InputForm(String label,TextEditingController inputController) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5, top: 10),
    child: TextFormField(controller: inputController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green),
          ),
          labelText: label,
          labelStyle: GoogleFonts.aBeeZee(
              color: Colors.black
          ),
          contentPadding: EdgeInsets.all(15)),
      cursorColor: Colors.blue,
    ),
  );
}


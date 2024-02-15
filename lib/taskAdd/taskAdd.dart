import 'package:flutter/material.dart';
import 'package:gestiontask/constant.dart';
import 'package:gestiontask/taskAdd/section/formulaireSection.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
             children: [
         showLogo(nomImage: "assets/image/addPagelogo.png"),
         showForm()
             ],
        ),
      ),
    );
  }
}


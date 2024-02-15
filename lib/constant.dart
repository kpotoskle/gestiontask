import 'package:flutter/material.dart';
import 'package:gestiontask/Task.dart';
List<Task> task = [];
class showLogo extends StatelessWidget {
  final String nomImage;
  const showLogo({super.key,required this.nomImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        height: 200,
        width: 200,
        child: Image.asset(nomImage),
      ),
    );
  }
}
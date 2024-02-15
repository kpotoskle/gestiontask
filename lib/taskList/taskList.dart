import 'package:flutter/material.dart';
import 'package:gestiontask/constant.dart';
import 'package:gestiontask/taskAdd/taskAdd.dart';
import 'package:gestiontask/taskDetail/taskDetail.dart';

class listTaskPage extends StatelessWidget {
  const listTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Tâches'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(task[index].titre),
            subtitle: Text('Date: ${task[index].date}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailTaskPage(position: index,),
                ),
              );
            },
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
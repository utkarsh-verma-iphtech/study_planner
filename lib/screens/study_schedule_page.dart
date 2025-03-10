import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/study_provider.dart';
import 'home_page.dart';

class StudySchedulePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(studyProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Schedule', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text('No Study Tasks Yet!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: ListTile(
                    title: Text(tasks[index].subject, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(tasks[index].description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            TextEditingController subjectController =
                                TextEditingController(text: tasks[index].subject);
                            TextEditingController descriptionController =
                                TextEditingController(text: tasks[index].description );
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Edit Task'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: subjectController,
                                        decoration: InputDecoration(labelText: 'Subject'),
                                      ),
                                      TextField(
                                        controller: descriptionController,
                                        decoration: InputDecoration(labelText: 'Description'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        ref.read(studyProvider.notifier).editTask(
                                              index,
                                              subjectController.text,
                                              descriptionController.text,
                                            );
                                        Navigator.pop(context);
                                      },
                                      child: Text('Save', style: TextStyle(color: Colors.blue)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            ref.read(studyProvider.notifier).deleteTask(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
            (route) => false,
          );
        },
        child: Icon(Icons.home, color: Colors.white),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}




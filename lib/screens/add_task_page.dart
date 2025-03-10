import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/study_provider.dart';
import 'study_schedule_page.dart';

class AddTaskPage extends ConsumerWidget {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Study Task', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                if (subjectController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  ref.read(studyProvider.notifier).addTask(
                        subjectController.text,
                        descriptionController.text,
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => StudySchedulePage()),
                  );
                }
              },
              child: Text('View Study Schedule', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

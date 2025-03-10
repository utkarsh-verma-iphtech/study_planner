import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/study_task.dart';

class StudyTaskNotifier extends StateNotifier<List<StudyTask>> {
  StudyTaskNotifier() : super([]);

  void addTask(String subject, String description) {
    state = [...state, StudyTask(subject: subject, description: description)];
  }

  void editTask(int index, String newSubject, String newDescription) {
    state[index] = StudyTask(subject: newSubject, description: newDescription);
    state = [...state];
  }

  void deleteTask(int index) {
    state = [...state]..removeAt(index);
  }
}

final studyProvider = StateNotifierProvider<StudyTaskNotifier, List<StudyTask>>(
    (ref) => StudyTaskNotifier());








// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../models/study_task.dart';

// class StudyTaskNotifier extends StateNotifier<List<StudyTask>>{
//   StudyTaskNotifier() : super([]);

//   void addTask(String subject , String description)
//   {
//     state = [...state ,StudyTask(subject: subject, description: description)];
//   }

//    void editTask(int index, String newSubject, String newDescription) {
//     state[index] = StudyTask(subject: newSubject, description: newDescription);
//     state = [...state];
//   }

//   void deleteTask (int index){
//     state = [...state]..removeAt(index);
//   }
// }

// final stateProvider = StateNotifierProvider<StudyTaskNotifier,List <StudyTask>>((ref) => StudyTaskNotifier());
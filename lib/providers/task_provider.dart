import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import 'package:uuid/uuid.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  final uuid = Uuid();

  void addTask(String title) {
    state = [
      ...state,
      Task(id: uuid.v4(), title: title),
    ];
  }

  void toggleTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        task.toggleDone();
      }
      return task;
    }).toList();
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }
}

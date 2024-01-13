import 'package:flutter/material.dart';
import 'package:resume_builder_task/screen/resume_itme.dart';

class ResumeModel extends ChangeNotifier {
  final Resume _resume = Resume(items: []);
  int? _selectedItemIndex;

  Resume get resume => _resume;
  int? get selectedItemIndex => _selectedItemIndex;

  void showAddItemDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Resume Item'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addItem(ResumeItem(
                  title: titleController.text,
                  content: contentController.text,
                ));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  
  }

  void showUpdateItemDialog(BuildContext context, int index) {
    TextEditingController titleController = TextEditingController(text: _resume.items[index].title);
    TextEditingController contentController = TextEditingController(text: _resume.items[index].content);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Resume Item'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addItem(ResumeItem(
                  title: titleController.text,
                  content: contentController.text,
                ));
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  
  }

  void addItem(ResumeItem item) {
    _resume.items.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _resume.items.removeAt(index);
    if (_selectedItemIndex == index) {
      _selectedItemIndex = null;
    }
    notifyListeners();
  }

  void updateItem(int index, ResumeItem item) {
    _resume.items[index] = item;
    notifyListeners();
  }

  void selectItem(int index) {
    _selectedItemIndex = index;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

enum ActionType {
  addNote,
  editNote,
}

// ignore: must_be_immutable
class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  String? id;
  ScreenAddNote({
    super.key,
    required this.type,
    this.id,
  });

  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              // Add note
              break;
            case ActionType.editNote:
              // Edit note
              break;
          }
        },
        icon: const Icon(Icons.save),
        label: const Text(
          'Save',
          style: TextStyle(color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type == ActionType.addNote ? 'Add Note' : 'Edit Note'),
        actions: [
          // if (type == ActionType.editNote) saveButton,
          saveButton,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Content',
                ),
                maxLines: 6,
                maxLength: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

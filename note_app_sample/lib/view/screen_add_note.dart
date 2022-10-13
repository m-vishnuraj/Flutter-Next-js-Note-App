import 'package:flutter/material.dart';
import 'package:note_app_sample/data/data.dart';
import 'package:note_app_sample/data/note_model/note_model.dart';

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
              saveNote();
              break;
            case ActionType.editNote:
              // Edit note
              break;
          }
        },
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: const Text(
          'Save',
          style: TextStyle(color: Colors.white),
        ),
      );

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
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
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _contentController,
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

  Future<void> saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;

    final _newNote = NoteModel.create(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );

    NoteDB().createNote(_newNote);
  }
}

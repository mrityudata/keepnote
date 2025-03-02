import 'package:keepnote/app/index.dart';

class EditNotesViewModel{

  String noteId = '';

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  init(String title, String description,String id){
    setValues(title,description,id);
  }

  void setValues(String title, String description, String id){
    titleController.text = title;
    descController.text = description;
    noteId = id;
  }

  Future<int> updateNote() async {
     final db = await DatabaseHelper().updateNote(noteId,  titleController.text, descController.text);
     return db;
  }

}
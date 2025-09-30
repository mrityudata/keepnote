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
    try{
      final db = await DatabaseHelper().updateNote(noteId,  titleController.text, descController.text);
      if(db == 1){
        actionManager.postAction(DetailsPageAction(isUpdated: true,noteId: noteId));
      }
      return db;
    }catch(e){
      if (e is StateError && e.message.contains(Strings.cannotFindEvents)) {
        debugPrint(Strings.blocClosed);
      } else {
        rethrow;
      }
      return 0;
    }
  }

}
import 'package:keepnote/database/database_helper.dart';
import '../../../app/index.dart';

class AddNewNoteViewModel{
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<String> priorities = [Strings.urgent, Strings.myGoals, Strings.home, Strings.college,Strings.market,Strings.mayBeLater];

  String? selectedPriority = Strings.urgent;

  init(){
    titleController.clear();
    descController.clear();
  }

  dispose(){
    titleController.clear();
    descController.clear();
  }

  void setSelectedPriorityValue(String? value){
    selectedPriority = value;
    print("selectedPriority $selectedPriority");
  }

  void showDropDown(context){
    DropdownButton<String>(
      hint: Text(Strings.addTag),
      items: priorities.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );}
      ).toList(),
      onChanged: (String? value) {
        print("value $value");
      },
    );
  }

  bool validation(){
    if(titleController.text.isNotEmpty && descController.text.isNotEmpty && selectedPriority != null){
      return true;
    }else{
      return false;
    }
  }

  void setFinalValues() async {
    final String uniqueId = Uuid().v4();
    Map<String,dynamic> noteMap = NotesModel(
      id: uniqueId,
      tag: selectedPriority!,
      title: titleController.text,
      description: descController.text,
      timeStamp: formatDateAsTimestamp()
    ).toJson();
    //insert data to Database
    await DatabaseHelper().insertNote(noteMap);
  }

  int formatDateAsTimestamp() {
    return DateTime.now().millisecondsSinceEpoch; // Returns an integer timestamp
  }

}
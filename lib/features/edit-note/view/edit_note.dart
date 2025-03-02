import '../../../app/index.dart';

class EditNote extends StatefulWidget {
  final NotesModel notesData;
  const EditNote({super.key,required this.notesData});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  EditNotesViewModel editNotesViewModel = EditNotesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          Strings.editNote,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: EditNoteWidget(notesList: widget.notesData,viewModel: editNotesViewModel,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.edit, size: 24,color: Colors.black,),
        onPressed: (){
          editNotesViewModel.updateNote();
        },
      ),
    );
  }
}

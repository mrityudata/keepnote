import '../../../app/index.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  AddNewNoteViewModel viewModel = AddNewNoteViewModel();

  @override
  void initState() {
    viewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          Strings.addNewNote,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: AddNewNoteWidget(viewModel: viewModel,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.check, size: 24,color: Colors.orange.shade100,),
          onPressed: (){
          if(viewModel.validation()){
            viewModel.setFinalValues();
            Navigator.pop(context,true);
          }else{
            showCommonBottomSheet(context,Strings.pleaseFillRequire);
          }
          },
      ),
    );
  }
}

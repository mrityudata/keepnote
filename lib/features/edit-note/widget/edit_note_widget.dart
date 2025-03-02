import '../../../app/index.dart';

class EditNoteWidget extends StatefulWidget {
  final NotesModel notesList;
  final EditNotesViewModel viewModel;
  const EditNoteWidget({super.key,required this.notesList,required this.viewModel});

  @override
  State<EditNoteWidget> createState() => _EditNoteWidgetState();
}

class _EditNoteWidgetState extends State<EditNoteWidget> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.init(widget.notesList.title,widget.notesList.description,widget.notesList.id!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.0,left: 25,right: 25),
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(25)
              ],
              decoration: InputDecoration(
                  hintText: Strings.title,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 32,
                  )
              ),
              controller: widget.viewModel.titleController,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0,left: 25,right: 25),
            child: TextField(
              maxLines: 100,
              decoration: InputDecoration(
                  hintText: Strings.description,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 23,
                  )
              ),
              controller: widget.viewModel.descController,
              style: TextStyle(
                fontSize: 18,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1000)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

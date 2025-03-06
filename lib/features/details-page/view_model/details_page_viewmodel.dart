import '../../../app/index.dart';

class DetailsPageViewmodel{

  late DetailsBloc _detailsBloc;
  DetailsBloc get detailsBloc => _detailsBloc;
  List<NotesModel> notesList = [];
  Color listColor = Colors.transparent;
  bool isEdit = false;
  late StreamSubscription<dynamic> actionSubscription;
  String headingTag = '';


  init(){
    _detailsBloc = DetailsBloc()..add(DetailsPageLoadEvent(noteList: notesList,color: listColor));
  }

  _listenForDetailsAction(){
    actionSubscription = GlobalActionManager().eventStream.listen( (event){
      log("DetailsPageAction ${event is DetailsPageAction}");
      if(event is DetailsPageAction){
        if(event.isUpdated){
          print("isUpdated ${event.isUpdated}");
          updateUI();
        }
      }
    } );
  }

  void updateUI() async {
    print("Update UI");
    notesList = await DatabaseHelper().getNoteList(headingTag);
    _detailsBloc.add(DetailsPageLoadEvent(noteList: notesList,color: listColor));
  }

  void setDataOfList({required List<NotesModel> paramNotesList,required Color color,required String heading}){
    headingTag = heading;
    notesList = paramNotesList;
    listColor = color;
  }

  void isEditValue(BuildContext context,NotesModel noteData) async {
     final value = await Navigator.push(context, MaterialPageRoute(builder: (_) => EditNote(notesData: noteData,)));
     if(value == true){
       _listenForDetailsAction();
     }
  }

  void deleteNotes(String? noteId, String headingTag) async {
     int result = await DatabaseHelper().deleteNote(noteId!,headingTag);
     print("Delete result $result");
       _listenForDetailsAction();
  }

}
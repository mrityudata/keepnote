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

  _listenForAction(){
    actionSubscription = GlobalActionManager().eventStream.listen( (event){
      if(event is DetailsPageAction){
        if(event.isUpdated){
          updateUI();
        }
      }
    } );
  }

  void updateUI() async {
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
       _listenForAction();
     }
  }

}
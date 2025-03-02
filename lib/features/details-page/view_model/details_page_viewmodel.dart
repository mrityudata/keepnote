import '../../../app/index.dart';

class DetailsPageViewmodel{

  late DetailsBloc _detailsBloc;
  DetailsBloc get detailsBloc => _detailsBloc;
  List<NotesModel> notesList = [];
  Color listColor = Colors.transparent;
  bool isEdit = false;


  init(){
    _detailsBloc = DetailsBloc()..add(DetailsPageLoadEvent(noteList: notesList,color: listColor));
  }

  void setDataOfList({required List<NotesModel> paramNotesList,required Color color}){
    notesList = paramNotesList;
    listColor = color;
  }

  void isEditValue(BuildContext context,NotesModel noteData){
      Navigator.push(context, MaterialPageRoute(builder: (_) => EditNote(notesData: noteData,)));
  }

}
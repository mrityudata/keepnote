import '../../../app/index.dart';

abstract class DetailsPageState{}

class DetailsPageLoadingState extends DetailsPageState{}

class DetailsPageLoadState extends DetailsPageState{
  List<NotesModel> noteList;
  Color color;

  DetailsPageLoadState({required this.noteList, required this.color});
}
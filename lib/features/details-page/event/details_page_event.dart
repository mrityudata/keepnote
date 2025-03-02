import '../../../app/index.dart';

abstract class DetailsPageEvent{}

class DetailsPageLoadingEvent extends DetailsPageEvent{}

class DetailsPageLoadEvent extends DetailsPageEvent{
  List<NotesModel> noteList;
  Color color;

  DetailsPageLoadEvent({required this.noteList, required this.color});
}
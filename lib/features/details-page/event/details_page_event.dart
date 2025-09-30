import '../../../app/index.dart';

abstract class DetailsPageEvent{}

class DetailsPageLoadingEvent extends DetailsPageEvent{}

class DetailsPageLoadEvent extends DetailsPageEvent{
  List<NotesModel> noteList;
  Color color;

  DetailsPageLoadEvent({required this.noteList, required this.color});
}

class DeleteNoteEvent extends DetailsPageEvent {
  final String noteId;
  final String headingTag;
  final Color color;
  DeleteNoteEvent({required this.noteId, required this.headingTag,required this.color});
}
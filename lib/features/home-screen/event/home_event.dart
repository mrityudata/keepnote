import 'package:keepnote/app/index.dart';

abstract class HomeEvent{}

class HomeScreenLoadingEvent extends HomeEvent{

}

class HomeScreenLoadedEvent extends HomeEvent{
  String dateTime;
  int count;
  List<List<NotesModel>>? allNotesList = [];
  HomeScreenLoadedEvent({required this.dateTime, this.allNotesList,required this.count});
}
import 'package:keepnote/app/index.dart';

abstract class HomeEvent{}

class HomeScreenLoadingEvent extends HomeEvent{

}


class AddNoteEvent extends HomeEvent{
  Map<String, dynamic> newNote;
  AddNoteEvent({required this.newNote});
}

class NavigateBackEvent extends HomeEvent{
  NavigateBackEvent();
}


class HomeScreenLoadedEvent extends HomeEvent{
  String dateTime;
  int count;
  List<List<NotesModel>>? allNotesList = [];
  HomeScreenLoadedEvent({required this.dateTime, this.allNotesList,required this.count});
}


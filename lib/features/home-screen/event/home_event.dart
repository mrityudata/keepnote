import 'package:keepnote/app/index.dart';

abstract class HomeEvent{}

class HomeScreenLoadingEvent implements HomeEvent{

}

class HomeScreenLoadedEvent implements HomeEvent{
  String dateTime;
  int count;
  List<NotesModel>? goalsList = [];
  HomeScreenLoadedEvent({required this.dateTime, this.goalsList,required this.count});
}
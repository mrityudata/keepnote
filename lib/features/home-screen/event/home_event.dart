import 'package:keepnote/app/index.dart';

abstract class HomeEvent{}

class HomeScreenLoadingEvent implements HomeEvent{

}

class HomeScreenLoadedEvent implements HomeEvent{
  String dateTime;
  List<NotesModel>? goalsList = [];
  HomeScreenLoadedEvent({required this.dateTime, this.goalsList});
}
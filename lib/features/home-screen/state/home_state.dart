import 'package:keepnote/app/index.dart';

abstract class HomeState{}

class HomeScreenLoadingState implements HomeState{

}

class HomeScreenLoadedState implements HomeState{
  String dateTime;
  int count;
  List<NotesModel>? goalsList = [];
  HomeScreenLoadedState({required this.dateTime, this.goalsList,required this.count});

  List<Object?> get props => [dateTime, goalsList];

}
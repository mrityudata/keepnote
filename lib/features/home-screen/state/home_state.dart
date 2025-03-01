import 'package:keepnote/app/index.dart';

abstract class HomeState{}

class HomeScreenLoadingState implements HomeState{

}

class HomeScreenLoadedState implements HomeState{
  String dateTime;
  List<NotesModel>? goalsList = [];
  HomeScreenLoadedState({required this.dateTime, this.goalsList});

  List<Object?> get props => [dateTime, goalsList];

}
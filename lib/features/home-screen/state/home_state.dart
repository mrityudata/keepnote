import 'package:keepnote/app/index.dart';

abstract class HomeState extends Equatable{}

class HomeScreenLoadingState extends HomeState{
  @override
  List<Object?> get props => [];

}

class AddNoteState extends HomeState{
  final int result;
  AddNoteState({required this.result});

  @override
  List<Object?> get props => [];
}

class NavigateBackState extends HomeState{
  NavigateBackState();
  @override
  List<Object?> get props => [];
}

class HomeScreenLoadedState extends HomeState{
  final String dateTime;
  final int count;
  final List<List<NotesModel>>? allNotesList;
  HomeScreenLoadedState({required this.dateTime, this.allNotesList,required this.count});

  @override
  List<Object?> get props => [dateTime, allNotesList,count];

}


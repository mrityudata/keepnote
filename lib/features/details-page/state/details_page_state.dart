import '../../../app/index.dart';

abstract class DetailsPageState extends Equatable{}

class DetailsPageLoadingState extends DetailsPageState{
  @override
  List<Object> get props => [];
}

class DetailsPageLoadState extends DetailsPageState{
  final List<NotesModel> noteList;
  final Color color;

  DetailsPageLoadState({required this.noteList, required this.color});

  @override
  List<Object> get props => [noteList,color];
}

class DetailsPageErrorState extends DetailsPageState {
  final String error;
  DetailsPageErrorState(this.error);

  @override
  List<Object?> get props => throw UnimplementedError();
}
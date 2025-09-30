import '../../../app/index.dart';

class DetailsBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsBloc() : super(DetailsPageLoadingState()) {
    on<DetailsPageLoadEvent>(_onLoadEvent);
    on<DeleteNoteEvent>(_onDeleteEvent);
  }

  Future<void> _onLoadEvent(DetailsPageLoadEvent event, Emitter<DetailsPageState> emit) async {
    emit(DetailsPageLoadingState());
    emit(DetailsPageLoadState(noteList: event.noteList, color: event.color));
  }

  Future<void> _onDeleteEvent(DeleteNoteEvent event, Emitter<DetailsPageState> emit) async {
    emit(DetailsPageLoadingState());
    try {
      final int result = await DatabaseHelper().deleteNote(event.noteId, event.headingTag);
      if (result > 0) {
        final List<NotesModel> updatedNotes = await DatabaseHelper().getNoteList(event.headingTag);
        emit(DetailsPageLoadState(noteList: updatedNotes, color: event.color));
      } else {
        emit(DetailsPageErrorState(Strings.deleteFailed));
      }
    } catch (e) {
      emit(DetailsPageErrorState('${Strings.errorDelete } $e'));
    }
  }
}
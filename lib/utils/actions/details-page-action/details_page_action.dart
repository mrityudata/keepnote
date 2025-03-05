import '../../../app/index.dart';

class DetailsPageAction extends Action{
  final bool isUpdated;
  final String noteId;
  DetailsPageAction({
    required this.isUpdated,
    required this.noteId
  });

  @override
  Object? invoke(Intent intent) {
    throw UnimplementedError();
  }
}
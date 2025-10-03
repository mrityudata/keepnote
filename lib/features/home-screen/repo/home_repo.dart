import 'package:keepnote/app/index.dart';

class HomeRepo {

  HomeRepo();

  Future<int> addNewNote({required Map<String, dynamic> newNote}) async {
    final response = await DatabaseHelper().insertNote(newNote);
    if (response > 0) {
      return response;
    } else {
      return 0;
    }
  }
}

import '../../../app/index.dart';

class HomeScreenAction extends Action{
  final bool isUpdated;
  final String selectedPriority;
  HomeScreenAction({
    required this.isUpdated,required this.selectedPriority
});

  @override
  Object? invoke(Intent intent) {
    throw UnimplementedError();
  }
}
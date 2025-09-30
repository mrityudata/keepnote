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

class HomeScreenNavigateBackAction extends Action{
  final bool isUpdated;
  HomeScreenNavigateBackAction({
    required this.isUpdated,
  });

  @override
  Object? invoke(Intent intent) {
    throw UnimplementedError();
  }
}
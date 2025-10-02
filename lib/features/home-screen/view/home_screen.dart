import '../../../app/index.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final HomeScreenViewModel viewModel = HomeScreenViewModel(homeRepo: HomeRepo());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ivory,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
            Strings.dashBoard,
             style: TextStyle(
               fontSize: 20.sp,
               fontWeight: FontWeight.bold
             ),
        ),
      ),
      body: HomeScreenWidget(viewModel: viewModel,),
    );
  }
}
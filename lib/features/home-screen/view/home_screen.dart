import '../../../app/index.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

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
               fontSize: 20,
               fontWeight: FontWeight.bold
             ),
        ),
      ),
      body: HomeScreenWidget(viewModel: viewModel,),
    );
  }
}
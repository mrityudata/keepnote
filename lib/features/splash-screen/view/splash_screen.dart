import '../../../app/index.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //after 3 sec move to next screen
    Future.delayed(Duration(seconds: 3),(){
      if(mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: common,
      body : Center(
        child: Text(
            Strings.notes,
             style: Theme.of(context).textTheme.bodyLarge,
      ),
        )
    );
  }
}
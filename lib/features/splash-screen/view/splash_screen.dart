import 'package:keepnote/features/user-name/view/user_name.dart';

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
        String? user = Pref().getString(userName);
        user == null ?
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserName()))
            : Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ivory,
      body : Center(
        child: Text(
            Strings.notes,
             style: Theme.of(context).textTheme.bodyLarge,
      ),
        )
    );
  }
}
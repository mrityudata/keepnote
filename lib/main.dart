import 'app/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigationKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: fontFamilyWorkSans,
          primaryColor: common,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.orange.shade100,
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      onGenerateRoute: (settings){
        switch(settings.name){
          case AppRoutes.initialRoute : return MaterialPageRoute(builder: (_) => SplashScreen());
          case AppRoutes.home: return MaterialPageRoute(builder: (_) => HomeScreen());
          case AppRoutes.addNewNote: return MaterialPageRoute(builder: (_) => AddNewNote());
          default: return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
    );
  }
}
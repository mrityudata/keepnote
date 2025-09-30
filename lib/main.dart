import 'app/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;
  await Pref.initSharedPref();
  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => HomeBloc(HomeRepo())),
      BlocProvider(create: (_) => DetailsBloc())
    ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(Dim.dim_360, Dim.dim_690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp(
          key: navigationKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: fontFamilyWorkSans,
              primaryColor: ivory,
              brightness: Brightness.light,
              scaffoldBackgroundColor: ivory,
              textTheme: TextTheme(
                bodyLarge: TextStyle(fontSize: Dim.dim_18.sp, fontWeight: FontWeight.w600),
                bodyMedium: TextStyle(fontSize: Dim.dim_16.sp, fontWeight: FontWeight.w500),
                bodySmall: TextStyle(fontSize: Dim.dim_16.sp, fontWeight: FontWeight.w400),
              )
          ),
          themeMode: ThemeMode.system,
          home: SplashScreen(),
          onGenerateRoute: (settings){
            switch(settings.name){
              case AppRoutes.initialRoute : return MaterialPageRoute(builder: (_) => SplashScreen());
              case AppRoutes.home: return MaterialPageRoute(builder: (_) => HomeScreen());
              case AppRoutes.addNewNote: return MaterialPageRoute(builder: (_) => AddNewNote(viewModel: HomeScreenViewModel(), homeBloc: HomeBloc(HomeRepo()),));
              default: return MaterialPageRoute(builder: (_) => HomeScreen());
            }
          },
        );
      },
    );
  }
}
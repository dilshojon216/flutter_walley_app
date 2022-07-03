import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_walley_app/src/presentation/bloc/home/home_bloc.dart';
import 'src/config/routes/main_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Walley App',
        debugShowCheckedModeBanner: false,
        initialRoute: MainNavigationRouteNames.splashScreen,
        routes: MainNavigationRoute.routes,
      ),
    );
  }
}

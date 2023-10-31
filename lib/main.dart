import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:counter/cubit/cubit.dart';
import 'package:counter/cubit/mood_cubit.dart';
import 'package:counter/cubit/state.dart';
import 'package:counter/data/local_data.dart';
import 'package:counter/modules/home_screen/first_screen.dart';
import 'package:counter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cashe.dart';
import 'cubit/blockObserver.dart';
import 'data/quran_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isdark = CashHelper.getData(key: 'isdark');
  await DataManager.initHive();
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  final bool? isdark;
  const MyApp(this.isdark, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          // BlocProvider(create: (context) => GetQuranCubit()..getChapterData()..getVersesData()),
          BlocProvider(
            create: (context) => MoodCubit()..changeMood(fromshared: isdark),
          ),
        ],
        child: BlocConsumer<MoodCubit, CounterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              // Use builder only if you need to use library outside ScreenUtilInit context
              builder: (_, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: MoodCubit.get(context).isdark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: AnimatedSplashScreen(
                    splash: Image.asset(
                      'assets/images/muslimm.png',
                      fit: BoxFit.contain,
                      height: 400.h,
                      width: 400.w,
                      alignment: Alignment.center,
                    ),
                    splashIconSize: double.infinity,
                    nextScreen: const Home(),
                  ),
                );
              },
            );
          },
        ));
  }
}

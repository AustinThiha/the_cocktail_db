import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_basic/bloc/category_bloc.dart';
import 'package:flutter_retrofit_basic/bloc/cocktail_detail/cock_tail_detail_bloc.dart';
import 'package:flutter_retrofit_basic/bloc/cocktail_list_bloc/cock_tail_list_bloc.dart';
import 'package:flutter_retrofit_basic/ui/pages/home_page.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/utils/rest_client.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    RestClient restClient = RestClient(dio);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc(restClient),
            child: const HomePage(),
          ),
          BlocProvider(
            create: (context) => CockTailListBloc(restClient),
            child: const HomePage(),
          ),
          BlocProvider(
            create: (context) => CockTailDetailBloc(restClient),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const CategoriesPage(),
    // );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

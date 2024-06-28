import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/features/list/presentation/bloc/save_bloc.dart';
import 'package:shopping_list/features/list/presentation/pages/grocery_list.dart';
import 'package:shopping_list/core/theme/theme.dart';
import 'package:shopping_list/init_dependencies.dart';

void main() async{
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<SaveBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: AppTheme.darkThemeMode,
      home: const GroceryList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/core/services/injection_dependency.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/bloc/shoe_bloc.dart';
import 'package:sneakers/src/user/cart/bloc/cart_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/pages/admin_dashboard.dart';
import 'package:sneakers/src/user/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoeBloc>(
          create: (context) => sl<ShoeBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Dashboard(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/app_pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'PlayfairDisplay',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(147, 10, 147, 1),
            primary: Color.fromRGBO(146, 20, 146, 1),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: TextTheme(
              titleLarge: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            useMaterial3: true,
        ),
        home:HomeScreen(),
      ),
    );
  }
}
import 'package:adhils_portfolio/desktop/desktop_view.dart';
import 'package:adhils_portfolio/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
        builder: (context, child) {
          final provider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: provider.theme,
            // ThemeData(
            //   primarySwatch: Colors.blue,
            //   textTheme: TextTheme(
            //     displayMedium: GoogleFonts.montserrat(),
            //     headlineMedium: GoogleFonts.montserrat(),
            //       bodyMedium: GoogleFonts.montserrat(),
            //       bodySmall: GoogleFonts.montserrat(),
            //       headlineSmall: GoogleFonts.montserrat(),
            //   )
            // ),
            home: const Portfolio(),
          );
        }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './features/auth/presentation/controller/login_provider.dart';
import './features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          titleLarge:
              GoogleFonts.oswald(fontSize: 25, fontStyle: FontStyle.italic),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the app!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

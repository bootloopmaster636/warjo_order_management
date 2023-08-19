//deps
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//routes
import 'Routes/AddOrder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WARJO Order Management',
      theme: ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Color.fromRGBO(78, 242, 105, 1),
          useMaterial3: true,
          fontFamily: GoogleFonts.varelaRound().fontFamily),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: Color.fromRGBO(78, 242, 105, 1),
          useMaterial3: true,
          fontFamily: GoogleFonts.varelaRound().fontFamily),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Orderan Aktif'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        title: Text(
          widget.title,
        ),
      ),
      body: Center(child: Text("test")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddOrder()));
        },
        tooltip: 'Increment',
        label: Text("Tambah Orderan"),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

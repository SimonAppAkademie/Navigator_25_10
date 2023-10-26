import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  //runApp(const MaterialApp(home: HomeScreen()));

  runApp(MaterialApp(
    // Die initiale Route festlegen
    initialRoute: '/',
    // Die Routen festlegen und benennen
    routes: {
      '/': (context) => HomeScreen(),
      '/details': (context) => DetailsScreen()
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.centerLeft, child: Text("HomeScreen")),
      ),
      //den Content in einer Spalte zentrieren
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Produkt 1"),
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: 'Info zu Produkt 1');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Produkt 2"),
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: 'Info zu Produkt 2');
                  },
                ),
              ),
              Card(
                child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Produkt 3"),
                    onTap: () {
                      Navigator.pushNamed(context, '/details', arguments: 'Info zu Produkt 3');
                    }),
              ),
              Card(
                child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Produkt 4"),
                    onTap: () {
                      Navigator.pushNamed(context, '/details', arguments: 'Info zu Produkt 4');
                    }),
              ),
            ],
          )),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details', arguments: 'anderer Button');
              },
              child: Text("Button"))
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // den Übergabeparameter aus der Route holen und in eine Variable speichern
    String info = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(leading: const Icon(Icons.arrow_back_sharp), title: const Align(alignment: Alignment.centerLeft, child: Text("DetailsScreen"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(info),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Zurück zum HomeScreen"))
          ],
        ),
      ),
    );
  }
}

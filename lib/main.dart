import 'package:dropdownprovider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Drop(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Drop> (context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Drop>(
              builder: (context , prov,child) {
                return TextField(decoration: InputDecoration(hintText: prov.hintText));
              }
            ),
            DropdownButton(
            value: provider.dropdownvalue ,
            items: provider.items.map((String item){
              return DropdownMenuItem(value : item ,child : Text(item));
            }).toList(), 
            onChanged: (String? newValue){
              provider.dropdownvalue = newValue!;
              provider.dropdownfunction();
            }),
            FloatingActionButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPage()));
            })
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Drop> (context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(hintText: provider.hintText),)
          ],
        ),
      ),
    );
  }
}

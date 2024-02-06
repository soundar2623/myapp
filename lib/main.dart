import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book ur House',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(),
      home: const MyHomePage(title: 'Book ur House'),
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
  int _counter = 0;
  String _searchQuery = '';
  List<String>itemlist = ['House 1','House 2','Villa 1','Apartment'];
  List<String>filteredList = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _resetCounter(){
    setState(() {
      _counter=0;
    });
  }
  void _onSearchQueryChanged(String query){
    setState(() {
      _searchQuery = query;
      filteredList = itemlist
      .where((item)=>item.toLowerCase().contains(query.toLowerCase()))
      .toList();
    });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(

            backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
          actions: [
            IconButton(onPressed:(){
      print('Search button pressed. Query: $_searchQuery');
      print('Filtered List: $filteredList');
            },
        icon: Icon(Icons.search),
            ),
          ],
      ),
      body: Center(
      child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      const Text(
      'Rent or sale:',
      ),
      Text(
      '$_counter',
      style: TextStyle(fontSize: 20.0),
      ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _resetCounter,
          child:const Text('Reset Counter'),
        ),
       SizedBox(height: 16.0), // Add more spacing
       TextField(
       onChanged: _onSearchQueryChanged,
       decoration: InputDecoration(
       hintText: 'Search...',
       prefixIcon: Icon(Icons.search),
      ),
       ),
          SizedBox(height: 16.0),
      ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
      )
      ,
      );
    }
  }

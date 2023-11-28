import 'package:flutter/material.dart';
import 'package:chili_tusk/utill/constant.dart';
import 'package:chili_tusk/utill/component/gifs_view_model.dart';
import 'core/responce/gifs_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIFs App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const MainActivity(),
    );
  }
}

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  MainActivityState createState() => MainActivityState();
}

class MainActivityState extends State<MainActivity> {
  late GifsViewModel viewModel;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<GifsItem> gifs = [];

  @override
  void initState() {
    super.initState();
    viewModel = GifsViewModel();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.loadMore();
        setState(() {
          gifs = viewModel.gifs;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIFs Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: _searchController.text.isEmpty ? 'Search GIFs' : '',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    viewModel.searchGifs(_searchController.text, Constant.KEY);
                    setState(() {
                      gifs = viewModel.gifs;
                    });
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GifsAdapter(gifs: gifs, scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}

class GifsAdapter extends StatelessWidget {
  final List<GifsItem> gifs;
  final ScrollController scrollController;

  const GifsAdapter({super.key, required this.gifs, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: gifs.length,
      itemBuilder: (context, index) {
        return buildItemLayout(gifs[index]);
      },
    );
  }

  Widget buildItemLayout(GifsItem gif) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          title: Center(
            child: Text(
              gif.title,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                color: Colors.white70
              ),
            ),
          ),
          subtitle: Image.network(gif.images.original.url),
        ),
      ),
    );
  }
}

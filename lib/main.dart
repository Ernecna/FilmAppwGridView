import 'package:basicfilmapp/DetailPage.dart';
import 'package:basicfilmapp/Film.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FilmApp'),
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
  Future<List<Film>> getFilm() async {
    var films = <Film>[];
    var v1 = Film(1, "Bir Zamanlar Anadoluda", "img/anadoluda.png", 10);
    var v2 = Film(2, "Django", "img/django.png", 15);
    var v3 = Film(3, "Inception", "img/inception.png", 19);
    var v4 = Film(4, "Interstellar", "img/interstellar.png", 11);
    var v5 = Film(5, "Thehatefuleight", "img/thehatefuleight.png", 13);
    var v6 = Film(6, "The Pianist", "img/thepianist.png", 16);
    films.addAll([v1, v2, v3, v4, v5, v6]);
    return films;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Film>>(
          future: getFilm(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var films = snapshot.data;
              return GridView.builder(
                  itemCount: films!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 3.5),
                  itemBuilder: (context, index) {
                    var films = snapshot.data;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(films[index])));
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset(films![index].filmImage),
                                  Text(films![index].filmName),
                                  Text(films![index].cost.toString() + "/")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center();
            }
          }),
    );
  }
}

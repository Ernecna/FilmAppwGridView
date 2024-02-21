import 'package:basicfilmapp/Film.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Film film;
  DetailPage(this.film);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.film.filmName),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 191, 248),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(widget.film.filmImage),
                Text(
                  widget.film.filmName,
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.purple),
                ),
                Text(widget.film.cost.toString() + "\u{20BA}",
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: Colors.black)),
                ElevatedButton(
                    onPressed: () {
                      print("BUY");
                    },
                    child: Text(
                      "BUY",
                      style: TextStyle(fontSize: 30),
                    ))
              ]),
        ));
    ;
  }
}

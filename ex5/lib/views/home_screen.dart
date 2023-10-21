import 'package:carousel_slider/carousel_slider.dart';
import 'package:ex5/models/films.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FetchState { loading, error, done }

class _HomeScreenState extends State<HomeScreen> {
  var state = FetchState.loading;
  var message = "Loading…";
  final List<Film> films = [];

  Future<void> _initFilm() async {
    Future.delayed(Duration(seconds: 2), () async {
      try {
        var response = await Film.fetchFilms();
        setState(() {
          state = FetchState.done;
          films.addAll(response);
        });
      } catch (error) {
        setState(() {
          state = FetchState.error;
          message = error.toString();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Exo 5")),
        body: Column(
          children: [
            state != FetchState.done
                ? Expanded(child:Center(child:  Text(message,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)))
                : Expanded(
                    child: CarouselSlider.builder(
                      itemCount: films.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) => displayFilm(films[index]),
                      options: CarouselOptions(
                        height: 400, // set desired height of carousel
                        enableInfiniteScroll: false,
                      ),
                    ),

                  ),
          ],
        ));
  }

  Widget displayFilm(Film films){
      return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex:3,
          child: Image.network(
            films.imageUrl,
            width: 150,
            // ajustez la largeur de l'image selon vos besoins
            height:
            400, // ajustez la hauteur de l'image selon vos besoins
          ),
        ),

        Expanded(
          flex:7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date de sortie : ${films.release_date}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 8),
              Text(
                films.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Score : ${films.score} %',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.green

                ),
              ),
              SizedBox(height: 8),
              Text(

                '${films.running_time} minutes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,

                ),
              ),
              SizedBox(height: 8),
              Text(
                'Directed by ${films.director} ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,

                ),
              ),
              SizedBox(height: 8),
              Text(
                'Description : ${films.description}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

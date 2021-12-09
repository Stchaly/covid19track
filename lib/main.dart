import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'covid19track app',
      home: EcranPrincipal(),
    );
  }
}

class EcranPrincipal extends StatelessWidget {
  TextEditingController controlleurNom = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Hero(
                  tag: 'boreal submission',
                  child: Image.network(
                    "https://www.vmcdn.ca/f/files/timminstoday/images/education/boreal.jpg",
                    height: 200,
                    width: 350,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text('Bienvenue'),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Pour débuter, entrez votre nom:")),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                controller: controlleurNom,
                decoration: InputDecoration(
                    labelText: "Entrez votre nom",
                    fillColor: Colors.lightGreen,
                    filled: true),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EcranDetails(
                        "pas disponible",
                        controlleurNom.value.text,
                        "https://www.vmcdn.ca/f/files/timminstoday/images/education/boreal.jpg");
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("continuer"),
                )),
          ],
        ),
      ),
    );
  }
}

class EcranDetails extends StatelessWidget {
  String details = " Pas disponible";
  String nomOriginal = "";
  String titre = "Titre";
  String imageURL = "";

  EcranDetails(String details, String titre, String imageURL) {
    this.nomOriginal = titre;
    this.titre = "Formulaire COVID-19 pour " + titre;

    this.details = details;
    this.imageURL = imageURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              child: Column(
            children: [
              Hero(
                  child: Image.asset(imageURL, width: 400, height: 200),
                  tag: "collegeboreal"),
              Hero(
                  child: Text(
                    titre,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  tag: "collegeboreal"),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: const Text(
                  "Date 2020-12-10",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 20),
                child: Text(
                  "Aujourd'hui,je me sens :",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Icon(
                    Icons.sentiment_neutral,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Icon(
                    Icons.sentiment_satisfied_alt_sharp,
                    color: Colors.black,
                  ),
                ),
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.36,
                  child: Text(
                    "J'ai  effectué un voyage en dehors du "
                    "Canada dans les "
                    "derniers 14 jours :",
                    softWrap: true,
                    maxLines: 4,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(Icons.close),
                Icon(Icons.check)
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      "J'ai été en contacte "
                      "avec une personne as "
                      "derniers 14 jours :",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                Icon(Icons.close),
                Icon(Icons.check)
              ]),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EcranDetails(" Pas disponible");
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Text("Soumettre"),
                ),
              ),
            ],
          )),
        ));
  }
}

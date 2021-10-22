import 'package:flutter/material.dart';

const Map<String, dynamic> types = {
  'Normal': Color(0xFFA8A878),
  'Fire': Color(0xFFF08030),
  'Water': Color(0xFF6890F0),
  'Electric': Color(0xFFF8D030),
  'Grass': Color(0xFF78C850),
  'Ice': Color(0xFF98D8D8),
  'Fighting': Color(0xFFC03028),
  'Poison': Color(0xFFA040A0),
  'Ground': Color(0xFFE0C068),
  'Flying': Color(0xFFA890F0),
  'Psychic': Color(0xFFF75888),
  'Bug': Color(0xFFA8B820),
  'Rock': Color(0xFFB8A038),
  'Ghost': Color(0xFF705898),
  'Dark': Color(0xFF705848),
  'Dragon': Color(0xFF7038F8),
  'Steel': Color(0xFFB8B8D0),
  'Fairy': Color(0xFFF0B6BC),
  'Shadow': Color(0xFF705898),
};

class PokeDetail extends StatelessWidget {
  final pokemon;
  PokeDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: types[pokemon['type'][0]],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: types[pokemon['type'][0]],
          //title: Text(pokemon['name']),
        ),
        body: Stack(
          children: [
            Positioned(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 20,
              top: MediaQuery.of(context).size.height * 0.1,
              left: 10,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      pokemon['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Height: ${pokemon['height']}'),
                    Text('Weight: ${pokemon['weight']}'),
                    Text(
                      'Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon['type']
                          .map<Widget>((t) => FilterChip(
                                label: Text(t,
                                    style: TextStyle(color: Colors.white)),
                                backgroundColor: types[t],
                                onSelected: (b) {},
                              ))
                          .toList(),
                    ),
                    Text(
                      'Weakness',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon['weaknesses']
                          .map<Widget>((t) => FilterChip(
                                label: Text(t,
                                    style: TextStyle(color: Colors.white)),
                                backgroundColor: types[t],
                                onSelected: (b) {},
                              ))
                          .toList(),
                    ),
                    Text(
                      'Previous Evolution:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    (pokemon['prev_evolution'] == null)
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon['prev_evolution']
                                .map<Widget>((t) => FilterChip(
                                      label: Text(t['name'],
                                          style:
                                              TextStyle(color: Colors.black)),
                                      backgroundColor: Colors.amber,
                                      onSelected: (b) {},
                                    ))
                                .toList(),
                          ),
                    Text(
                      'Next Evolution:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    (pokemon['next_evolution'] == null)
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon['next_evolution']
                                .map<Widget>((t) => FilterChip(
                                      label: Text(t['name'],
                                          style:
                                              TextStyle(color: Colors.black)),
                                      backgroundColor: Colors.amber,
                                      onSelected: (b) {},
                                    ))
                                .toList(),
                          ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon['img'],
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon['img']),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

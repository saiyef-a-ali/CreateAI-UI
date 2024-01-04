import 'package:flutter/material.dart';
import 'package:newui/widgets/trending/models/game_model.dart';

class GameData {
  List<GameModel> GameList;

  GameData() : GameList = [] {
    GameList.add(
      GameModel(
        id: 0,
        name: 'THE DETECTIVE',
        rating: 8.0,
        genre: ["Drama"],
        director: 'Ericson Core',
        storyLine:
            'Togo (1913 – December 5, 1929) was the lead sled dog of Leonhard Seppala and his dog sled team in the 1925 serum run to Nome across central and northern Alaska. Even though he covered more distance (260 miles) than his co-sledder Balto (55 miles), he didn\'t get as much fame.',
        image: Image.asset("assets/image/A.png"),
        imageLogo: Image.asset("assets/image/A1.png"),
      ),
    );
    GameList.add(
      GameModel(
        id: 1,
        name: 'THE DETECTIVE 2',
        rating: 8.5,
        genre: ["Crime", "Drama"],
        director: 'Todd Phillips',
        storyLine:
            "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he's part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.",
        image: Image.asset("assets/image/B.png"),
        imageLogo: Image.asset("assets/image/B1.png"),
      ),
    );
    GameList.add(
      GameModel(
        id: 2,
        name: 'THE DETECTIVE 3',
        rating: 5.7,
        genre: ["Action", "Adventure", "Fantasy"],
        director: 'Tim Burton',
        storyLine:
            "Complex sociological themes run through this science-fiction classic about three astronauts marooned on a futuristic planet where apes rule and humans are slaves. The stunned trio discovers that these highly intellectual simians can both walk upright and talk. They have even established a class system and a political structure. The astronauts suddenly find themselves part of a devalued species, trapped and imprisoned by the apes.",
        image: Image.asset("assets/image/C.png"),
        imageLogo: Image.asset("assets/image/C1.png"),
      ),
    );
  }
}

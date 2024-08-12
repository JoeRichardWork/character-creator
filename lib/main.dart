import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

//Firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  
  //Allows firebase to use channels to initialize itself.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      home: const Home() ,
      theme: primaryTheme,
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox'),

    );
  }
}


// Implicit (built-in) animations
// easy to use
// limited configuration


//Explicit (custom) animations
// harder to set up
// more control over the animation
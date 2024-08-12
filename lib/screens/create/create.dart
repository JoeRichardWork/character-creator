import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});
  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {

final _nameController = TextEditingController();
final _sloganController = TextEditingController();


  void handleSubmit(){
    if(_nameController.text.trim().isEmpty){
      //Show error dialogue here
      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          title:  const StyledHeading("Missing Character Name"),
          content: const StyledText("Every good RPG character needs a name"),
          actions: [
            StyledButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const StyledHeading("close"))
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    if(_sloganController.text.trim().isEmpty){
      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          title:  const StyledHeading("Missing Character Slogan"),
          content: const StyledText("Every good RPG character needs a slogan"),
          actions: [
            StyledButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const StyledHeading("close"))
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    //characters.add(Character(name: _nameController.text.trim(), slogan: _sloganController.text.trim(), id: uuid.v4(), vocation: selectedVocation));

    Provider.of<CharacterStore>(context, listen: false)
    .addCharacter(Character(name: _nameController.text.trim(), slogan: _sloganController.text.trim(), id: uuid.v4(), vocation: selectedVocation));

    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Home()));

  }

  //Handling vocation selection
  Vocation selectedVocation = Vocation.dada;

  void updateVocation(Vocation v){
    setState(() {
      selectedVocation = v;
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Welcome Message
          
          
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor,),
              ),
              const Center(
                child: StyledHeading("Welcome, New Player!"),
              ),
              const Center(
                child: StyledText("Create a name and slogan for your new character"),
              ),
              const SizedBox(
                height:30 ,
              ),
          
          
              //Input for name and slogan
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.bodyMedium),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText("Character Name"),
                ),
              ),
          
              const SizedBox(height:20),
          
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.bodyMedium),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character Slogan"),
                ),
              ),
          
              const SizedBox(height: 30,),
          
              //Select Vocation Title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor,),
              ),
              const Center(
                child: StyledHeading("Choose a Vocation"),
              ),
              const Center(
                child: StyledText("This determines your available skills"),
              ),
              const SizedBox(
                height:30 ,
              ),
          
              //Vocation Cards
              VocationCard(
                isSelected: selectedVocation == Vocation.dada,
                onTap: updateVocation,
                vocation: Vocation.dada),
              VocationCard(
                isSelected: selectedVocation == Vocation.coach,
                onTap: updateVocation,
                vocation: Vocation.coach),
              VocationCard(
                isSelected: selectedVocation == Vocation.queen,
                onTap: updateVocation,
                vocation: Vocation.queen),
              VocationCard(
                isSelected: selectedVocation == Vocation.gremlin,
                onTap: updateVocation,
                vocation: Vocation.gremlin),
              VocationCard(
                isSelected: selectedVocation == Vocation.potato,
                onTap: updateVocation,
                vocation: Vocation.potato),
              //Submit Button
              Center(
                child: StyledButton(
                  onPressed: handleSubmit, 
                  child: const StyledHeading("Create Character")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
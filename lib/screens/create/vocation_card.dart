import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    required this.vocation,
    required this.onTap,
    required this.isSelected,
    super.key});

  final Vocation vocation;
  final void Function(Vocation)onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap(vocation);},
      child: Card(
        color: isSelected? AppColors.secondaryColor: Colors.transparent,
        child: Padding(padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset("assets/img/vocations/${vocation.image}",
              width: 40,
              colorBlendMode: BlendMode.color,
              color: !isSelected ?Colors.black.withOpacity(0.8):Colors.transparent ,
              ),
      
              const SizedBox(width: 10),
      
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(vocation.title),
                    StyledText(vocation.description),
                  ] 
                ),)
            ],
      
          ),
        ),
      
      ),
    );
  }
}
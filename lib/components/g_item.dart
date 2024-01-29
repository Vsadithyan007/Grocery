import 'package:flutter/material.dart';



class GroceryItemTile extends StatelessWidget {
  final String iName,iPrice,imgPath;
  final clr;
  void Function()? onPressed;
  
  GroceryItemTile({
    super.key,
    required this.iName,
    required this.iPrice,
    required this.imgPath,
    required this.clr,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: clr[100],
          borderRadius: BorderRadius.circular(12),

          ),
        child: Column(children: [
          Image.asset(imgPath,
          height: 64,),
          
          Text(iName),
          MaterialButton(onPressed: onPressed,
          color: clr[800],
          child: Text('\$'+iPrice,
            style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
        ]),
      ),
    );
  }
}
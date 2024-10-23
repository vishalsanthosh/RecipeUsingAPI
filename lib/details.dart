import 'package:flutter/material.dart';
import 'package:receipe_api/reciepemodel.dart';

class DetailScreen extends StatefulWidget {
final Recipe recipes;
DetailScreen({required this.recipes});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: const Color.fromARGB(255, 90, 235, 155),
        child: Column(
          
          children: [
            Image.network(widget.recipes.image,height: 300,width: 350,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.symmetric(),color: Colors.orange),
                child: Center(child: Text(widget.recipes.name,style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(border: Border.symmetric(),borderRadius: BorderRadius.circular(5),color: Colors.orange),
              child: Text(widget.recipes.cuisine,style: TextStyle(color: Colors.white),)),
            Text("Ingredients:${widget.recipes.ingredients}",style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
            SizedBox(height: 5,),
            Text("Instructions:${widget.recipes.instructions}",style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration:BoxDecoration(border: Border.symmetric(),borderRadius: BorderRadius.circular(5),color:Colors.black ),
                 child: Center(child: Text("Time Required to prepare:${widget.recipes.prepTimeMinutes} minutes",style: TextStyle(color: Colors.white),))),
            )
          ],
        ),
      ),
    );
  }
}
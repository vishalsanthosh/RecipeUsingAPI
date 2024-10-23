import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:receipe_api/details.dart';
import 'package:receipe_api/reciepemodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLoading=true;
  void initState(){
    super.initState();
    _getData();
  }
  RecipemodelApi? dataFromApi;
  _getData()async{
    try{
      String url="https://dummyjson.com/recipes";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode==200){
        dataFromApi=RecipemodelApi.fromJson(json.decode(res.body));
      _isLoading= false;
      setState(() {
        
      });
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome.."),centerTitle: true,backgroundColor: const Color.fromARGB(255, 214, 86, 47),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.food_bank))],),
      body: _isLoading? Padding(padding: EdgeInsets.all(12),
      child: Center(
        child: CircularProgressIndicator(),
      ),
      ):dataFromApi==null?
      Center(child: Text("Failed to load data"),
     
      ) :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,crossAxisSpacing: 2,mainAxisSpacing: 2),
         itemCount: dataFromApi!.recipes.length,
         itemBuilder: (context ,index){
        
          final recipe=dataFromApi!.recipes[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailScreen(recipes: recipe)));
          },
          child: Container(
            
          decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 189, 161, 153)),borderRadius: BorderRadius.circular(5),color: const Color.fromARGB(255, 228, 141, 160)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Image.network(recipe.image,height: 85,width: double.infinity,),
                Text(recipe.name,style: TextStyle(color: const Color.fromARGB(255, 16, 17, 17),fontWeight: FontWeight.w900),),
                ElevatedButton(onPressed: (){}, child: Text(recipe.cuisine,style: TextStyle(color: Colors.green),))
              ],
            ),
          ),
          ),
        );
      })
    );
  }
}
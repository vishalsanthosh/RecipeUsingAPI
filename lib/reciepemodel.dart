// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RecipemodelApi RecipemodelApiFromJson(String str) => RecipemodelApi.fromJson(json.decode(str));


class RecipemodelApi {
    List<Recipe> recipes;

    RecipemodelApi({
        required this.recipes,
    });

    factory RecipemodelApi.fromJson(Map<String, dynamic> json) => RecipemodelApi(
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
    );

   
}

class Recipe {
    String name;
    List<String> ingredients;
    List<String> instructions;
    int prepTimeMinutes;
    String cuisine;
    String image;

    Recipe({
        required this.name,
        required this.ingredients,
        required this.instructions,
        required this.prepTimeMinutes,
        required this.cuisine,
        required this.image,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        prepTimeMinutes: json["prepTimeMinutes"],
        cuisine: json["cuisine"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "prepTimeMinutes": prepTimeMinutes,
        "cuisine": cuisine,
        "image": image,
    };
}

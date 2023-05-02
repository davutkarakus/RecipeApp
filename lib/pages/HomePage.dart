import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../entity/MainPage/Categories.dart';
import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchTfController = TextEditingController();
  var username = FirebaseAuth.instance.currentUser!.displayName;
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  Future<List<Categories>> getCategories() async {
    var categoryList = <Categories>[];
    var c1 = Categories(category_id: 1, category_name: "Vegetables", category_image: "https://spoonacular.com/recipeImages/1096026-312x231.jpg");
    var c2 = Categories(category_id: 2, category_name: "Soups", category_image: "https://spoonacular.com/recipeImages/1096263-312x231.jpg");
    var c3 = Categories(category_id: 3, category_name: "Desserts", category_image: "https://spoonacular.com/recipeImages/1025438-312x231.jpg");
    var c4 = Categories(category_id: 4, category_name: "Salad", category_image: "https://spoonacular.com/recipeImages/1098387-312x231.jpg");
    var c5 = Categories(category_id: 5, category_name: "Asian", category_image: "https://spoonacular.com/recipeImages/716217-312x231.jpg");
    var c6 = Categories(category_id: 6, category_name: "American", category_image: "https://spoonacular.com/recipeImages/646512-312x231.jpg");
    var c7 = Categories(category_id: 7, category_name: "Italian", category_image: "https://spoonacular.com/recipeImages/715495-312x231.jpg");
    categoryList.add(c1);
    categoryList.add(c2);
    categoryList.add(c3);
    categoryList.add(c4);
    categoryList.add(c5);
    categoryList.add(c6);
    categoryList.add(c7);
    return categoryList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backGround.png"),
                fit: BoxFit.cover,
                opacity: 0.6
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,top: 25),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello, $username!",style: TextStyle(color: Colors.black45,fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: RichText(
                        text: TextSpan(
                            text: "Make your own food,\nstay at",style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(text: " home",style: TextStyle(color: Colors.orange,fontSize: 23,fontWeight: FontWeight.w500)),
                            ]
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,16, 16, 16),
                    child: TextField(
                      controller: searchTfController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: MaterialStateColor.resolveWith((states) =>
                          states.contains(MaterialState.focused)
                              ? Colors.black
                              : Colors.grey),
                          hintText: "Search recipe, ingredients..",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                  ),
                  Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: SizedBox(
                      height: 150,
                      child: FutureBuilder<List<Categories>>(
                          future: getCategories(),
                          builder: (context,snapshot){
                            if(snapshot.hasData){
                              var categoryList = snapshot.data;
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categoryList!.length,
                                  itemBuilder: (context,indeks){
                                    var category = categoryList[indeks];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 13),
                                      child: Column(
                                        children: [
                                          ClipRRect(borderRadius: BorderRadius.circular(10),child: SizedBox(height: 120 ,width: 120,child: Image.network(category.category_image,fit: BoxFit.cover))),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Text(category.category_name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              );
                            }else {
                              return Center();
                            }
                          }
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Text("Popular Recipes",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        signOut();
                      },
                      child: Text("Sign out")
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

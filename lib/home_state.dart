// import 'dart:typed_data';

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:my_blog_app/model/blog_api_call.dart';
// import 'package:my_blog_app/model/blog_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_blog_app/cached_image_network.dart';

class MyHomeState extends StatefulWidget{
const MyHomeState({super.key});
@override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}
class MyHomePageState extends State<MyHomeState> with TickerProviderStateMixin{
  late TabController tabController;
  
List <dynamic> blogs = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    tabController = TabController(length: 3, vsync: this);
    _fetch_Blog_Data();
   
  }

  void _fetch_Blog_Data() async {
    final String url = "https://basic-blog.teamrabbil.com/api/post-details/3";
  final Uri uri = Uri.parse(url);
    // http.get(uri as Uri);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(response.body);
setState(() {
  blogs = jsonData['postComments'];
});
    }
    // final body = response.body;
    // final jsonDecode(body);
    // setState(() {
    //   users = joson['postComments']
    // });
    
  }








 @override
 void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              "images/profile.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
        ),
        //  bottom: TabBar(tabs: [
        //   Tab(
        //     text: "Home",
        //   )
        // ]),
        elevation: 1,
      ),
      backgroundColor: Colors.white70,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            
            Container(
              margin: EdgeInsets.only(top: 10),
              child: 
            TextField(
                 decoration: InputDecoration(
                   labelText: "Search",
                   labelStyle: TextStyle(color: Colors.teal),
                   prefixIcon: Icon(Icons.search),
                   enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)
                   ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)
                   ),
                 ),
                ),
                ),

                SizedBox(height: 20,),
              //  Tab Bar
              TabBar(
                controller: tabController,
                labelColor: Colors.teal,
                // unselectedLabelColor: Colors.teal,
                // indicator: BoxDecoration(
                // ),
                tabs: [
                  Tab(
                    text: "Featured", 
                  ),
                  Tab(
                    text: "Lastest",
                  ),
                  Tab(
                    text: "Trending",
                  )

              ]),

               Expanded(
                child:  TabBarView(
                controller: tabController,
                children: [

                  // first
                Container(child: ListView.builder( 
                  itemCount: blogs.length,
                  itemBuilder: (context, index){
                     final blog = blogs[index];
                    final id = blogs[index]['id'];
                    final list_id = blogs[index]['list_id'];
                    final author = blogs[index]['author'];
                    final img = blogs[index]['img'];
                    final comment = blogs[index]['comment'];
                    final created_at = blogs[index]['created_at'];
                    final updated_at = blogs[index]['updated_at'];
                    
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Container(
                          child: getNetworkImage("$img"),
                          // fit: BoxFit.cover,
                          // height: 150,
                          // width: (MediaQuery.of(context).size.width / 2) - 40,
                          // ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(comment,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "jan 12  " + " 8 min read", 
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 13
                                ),
                                textAlign: TextAlign.end,
                                
                              ),
                            ],
                          ),
                        )
                        ],
                      ),
                    );
                  })
                ),


                  Container(
                  child: Icon(Icons.abc),
                ),
              
                Container(
                  child: Icon(Icons.abc),
                ),
                Container(
                   child: Icon(Icons.e_mobiledata),
                ),
               ]))
              
          
          ],
        ),
        
      ),


    );
  }
}
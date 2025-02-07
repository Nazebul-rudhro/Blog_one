// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_blog_app/model/blog_api_call.dart';
import 'package:my_blog_app/model/blog_model.dart';


class MyHomeState extends StatefulWidget{
const MyHomeState({super.key});
@override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}
class MyHomePageState extends State<MyHomeState> with TickerProviderStateMixin{
  late TabController tabController;
  
  List<BlogModel> _blogList = [];
  bool _isLoading = true;
   
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    tabController = TabController(length: 3, vsync: this);
    _fetchBlogModel();
  }

  // void _fetchBlogModel() async{
  //   try {
  //     final blogs = await Blogapicall.fetchGetList();
  //     _blogList = blogs;
  //     _isLoading = false;
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  //  }


//   void _fetchBlogModel() async {
//   try {
//     final blogs = await Blogapicall.fetchGetList();
//     setState(() {
//       _blogList = blogs;
//       _isLoading = false;
//     });
//   } catch (e) {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }


void _fetchBlogModel() async {
  try {
    final blog = await Blogapicall.fetchGetList();
    setState(() {
      _blogList = blog; 
      _isLoading = false;
    });
  } catch (e) {
    setState(() {
      _isLoading = false;
    });
  }
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
                // Container(
                //   child:_isLoading?ListView.builder( 
                //   itemCount: 2,
                //   itemBuilder: (context, index){
                //     // final blogs = blogList[index];
                //     return Container(
                //       padding: EdgeInsets.symmetric(vertical: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //         Container(
                //           child: Image.network("https://plus.unsplash.com/premium_photo-1738599623097-f630b1e4dab6?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8",
                //           fit: BoxFit.cover,
                //           height: 150,
                //           width: (MediaQuery.of(context).size.width / 2) - 40,
                //           ),
                //         ),
                //         SizedBox(width: 20,),
                //         Container(
                //           width: (MediaQuery.of(context).size.width / 2) - 40,
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text("kjklgajklgjakl",
                //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //               ),
                //               Text(
                //                 "jan 12  " + " 8 min read", 
                //                 style: TextStyle(
                //                   color: Colors.blueGrey,
                //                   fontSize: 13
                //                 ),
                //                 textAlign: TextAlign.end,
                                
                //               ),
                //             ],
                //           ),
                //         )
                //         ],
                //       ),
                //     );
                //   })
                // ),
                
                Container(
                  child: _isLoading ?
                Center(child: CircularProgressIndicator(),)
                : ListView.builder(
                  itemCount: _blogList.length,
                  itemBuilder: (context, index){
                  final blog = _blogList[index];
                  return ListTile(
                    title: Text(blog.id.toString()),
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
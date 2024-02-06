// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';



// void main() => runApp(MaterialApp(
//   home:  Scaffold(
//     appBar:AppBar(
//       title: Text('My first App'),
//       centerTitle: true,
//     ),

//     body: Center(
//       child: Text('Hello net ninjas '),
//     ),

//     floatingActionButton: FloatingActionButton(
//       onPressed: (){},
//       child:Text('click'),
//     ),
//     ),
// ));



// void main() => runApp(MaterialApp(
//   home:  Scaffold(
//     appBar:AppBar(
//       title: Text("My first App"),
//       centerTitle: true,
//       backgroundColor: Colors.red[600],
//     ),

//     body: Center(
//       child: Text('Hello net ninjas '),
//       style: TextStyle(
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//         letterSpacing: 2.0,
//         color: Colors.grey[600],
//         fontFamily: IndieFlower,
//     ),

//     floatingActionButton: FloatingActionButton(
//       onPressed: (){},
//       child:Text('click'),
//       backgroundColor: Colors.red[600 ],
//     ),
//     ),
// ));


// void main() => runApp(MaterialApp(
//   home: Home(),
// ));


// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar:AppBar(
//       title: Text("My first App"),
//       centerTitle: true,
//       backgroundColor: Colors.red[600],
//     ),

//     body: Center(
//       child: Text('Hello net ninjas '),
//       style: TextStyle(
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//         letterSpacing: 2.0,
//         color: Colors.grey[600],
//         fontFamily: IndieFlower,
//     ),

//     floatingActionButton: FloatingActionButton(
//       onPressed: (){},
//       child:Text('click'),
//       backgroundColor: Colors.red[600 ],
//     ),
//     ),
// )
//   }
// }



// void greet(){
//   print('Hello Mitch');
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       home: Scaffold()
//     );
//   }
// }  



void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('My APP Bar'),
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: 
          [
            IconButton
            (onPressed: () {}, 
          icon: Icon(Icons.logout),
          ),
          ],
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(25),
            // child: Text(
            //   'Tonny Maisha',
            //   style: TextStyle(
            //     color:Colors.white,
            //     fontSize: 28,
            //     fontWeight: FontWeight.bold,
                
            //      ),
            // ),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 64,
            ),
          ),
        )
      )
    );
  }
}  

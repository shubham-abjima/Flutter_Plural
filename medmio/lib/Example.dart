// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:medmio/Models/Postmodel.dart';
// import 'package:http/http.dart' as http;

// class homeScreen extends StatefulWidget {
//   const homeScreen({Key? key}) : super(key: key);

//   @override
//   State<homeScreen> createState() => _homeScreenState();
// }

// class _homeScreenState extends State<homeScreen> {
//   var data;
//   Future<void> getUserApi() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

//     if (response.statusCode == 200) {
//       data = jsonDecode(response.body.toString());
//     } else {}
//   }
//   // List<PostModel> postlist = [];
//   // Future<List<PostModel>> getPostApi() async {
//   //   final response =
//   //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
//   //   var data = jsonDecode(response.body.toString());
//   //   if (response.statusCode == 200) {
//   //     for (var i in data) {
//   //       postlist.add(PostModel.fromJson(i));
//   //     }
//   //     return postlist;
//   //   } else {
//   //     return postlist;
//   //   }
//   // }

//   late int tappedIndex;

//   @override
//   Widget build(BuildContext context) {
//     var _currentIndex;
//     return SafeArea(
//         child: Scaffold(
//       bottomNavigationBar: BottomAppBar(
//           child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           IconButton(
//               icon: const ImageIcon(
//                 NetworkImage(
//                     "https://avatars.githubusercontent.com/u/112777230?s=200&v=4"),
//                 size: 30,
//               ),
//               disabledColor: Colors.green,
//               onPressed: _currentIndex == 0
//                   ? null
//                   : () => setState(() => _currentIndex = 0)),
//           IconButton(
//               icon: Icon(
//                 Icons.star,
//                 size: 30,
//               ),
//               disabledColor: Colors.green,
//               onPressed: _currentIndex == 1
//                   ? null
//                   : () => setState(() => _currentIndex = 1)),
//           IconButton(
//               icon: Icon(
//                 Icons.list_alt_outlined,
//                 size: 30,
//               ),
//               disabledColor: Colors.green,
//               onPressed: _currentIndex == 2
//                   ? null
//                   : () => setState(() => _currentIndex = 2)),
//         ],
//       )),
//       appBar: AppBar(
//         leading: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             child: Text("DK"),
//           ),
//         ),
//         title: const Text(
//           "Dileep Kumar",
//           style: TextStyle(fontSize: 15),
//         ),
//         actions: const [
//           Center(child: Text("Annapolis")),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(CupertinoIcons.share),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: getUserApi(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Text('Loading');
//                 } else {
//                   return ListView.builder(
//                       itemCount: data.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: ListTile(
//                             leading: const CircleAvatar(child: Text("PS")),
//                             title: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ReusbaleRow(
//                                   title: 'name',
//                                   value: data[index]['name'].toString(),
//                                 ),
//                                 ReusbaleRow(
//                                   title: 'Username',
//                                   value: data[index]['username'].toString(),
//                                 ),
//                                 ReusbaleRow(
//                                   title: 'address',
//                                   value: data[index]['address']['street']
//                                       .toString(),
//                                 ),
//                                 ReusbaleRow(
//                                   title: 'Lat',
//                                   value: data[index]['address']['geo']['lat']
//                                       .toString(),
//                                 ),
//                                 ReusbaleRow(
//                                   title: 'Lat',
//                                   value: data[index]['address']['geo']['lng']
//                                       .toString(),
//                                 ),
//                                 // Text(
//                                 //   "Prateek Sharma",
//                                 //   style: TextStyle(
//                                 //       fontSize: 14, fontWeight: FontWeight.bold),
//                                 // ),
//                                 // Text(
//                                 //   "09-29-2022 07:00 AM - 07:30 PM",
//                                 //   style: TextStyle(
//                                 //       fontSize: 10, fontWeight: FontWeight.bold),
//                                 // ),
//                                 // Text(
//                                 //   "MRN: 5468752",
//                                 //   style: TextStyle(
//                                 //       fontSize: 12, fontWeight: FontWeight.bold),
//                                 // )
//                               ],
//                             ),
//                             // trailing: Column(
//                             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             //   crossAxisAlignment: CrossAxisAlignment.start,
//                             //   children: const [
//                             //     Text(
//                             //       "DOB: 31-01-1970",
//                             //       style: TextStyle(
//                             //           fontSize: 12,
//                             //           fontWeight: FontWeight.bold),
//                             //     ),
//                             //     Text(
//                             //       "Medicare MD",
//                             //       style: TextStyle(
//                             //           fontSize: 12,
//                             //           fontWeight: FontWeight.bold),
//                             //     )
//                             //   ],
//                             // ),
//                             onTap: () {},
//                           ),
//                         );
//                       });
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class ReusbaleRow extends StatelessWidget {
//   String title, value;
//   ReusbaleRow({Key? key, required this.title, required this.value})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }

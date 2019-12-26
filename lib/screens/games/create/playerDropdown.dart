// import 'package:flutter/material.dart';
// import 'package:app/utils/db.dart';

// class PlayerDropdown extends StatefulWidget {
//   PlayerDropdown({@required this.onSelect});

//   final Function onSelect;

//   @override
//   _PlayerDropdown createState() => _PlayerDropdown();
// }

// class _PlayerDropdown extends State<PlayerDropdown> {
//   DatabaseHelper helper = DatabaseHelper.instance;
//   dynamic players;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _getAllPlayers();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Player>>(
//       future: helper.queryPlayerAll(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.data == null) {
//             return Text('no data');
//           } else {
//             snapshot.data.map((value) {
//               print('ehere');
//             });
//             return DropdownButton<String>(
//                 hint: Text("Joueur à ajouter", style: TextStyle(fontSize: 25)),
//                 iconSize: 24,
//                 icon: Icon(Icons.arrow_downward),
//                 underline: Container(
//                   height: 2,
//                   color: Theme.of(context).primaryColor,
//                 ),
//                 items: snapshot.data
//                     .map((Player player) => DropdownMenuItem<String>(
//                           value: player.username,
//                           child: Text(player.username),
//                         ))
//                     .toList(),
//                 onChanged: (_) {});
//           }
//         } else {
//           return CircularProgressIndicator(); // loading
//         }
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:ppc/Bloc/AppBar.dart';

// class Counter extends StatefulWidget {
//   const Counter({Key? key}) : super(key: key);

//   @override
//   _CounterState createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;
//   final counterBloc = AppBarBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           StreamBuilder(
//             stream: counterBloc.TitelStream,
//             initialData: 0,
//             builder: (context, snapshot) {
//               //  return Text("$_counter");
//               return Text("${snapshot.data}");
//             },
//           ),
//           // ElevatedButton(
//           //   onPressed: () {
//           //     _counter++;
//           //     counterBloc.counterSink.add(_counter);
//           //   },
//           //   child: Text("Increment"),
//           // ) ,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   counterBloc.eventSink.add(AppBarAction.PayPerClick);
//                 },
//                 child: Text("Increment"),
//               ),              ElevatedButton(
//                 onPressed: () {
//                   counterBloc.eventSink.add(AppBarAction.Dashboard);
//                 },
//                 child: Text("decrement"),
//               ),              ElevatedButton(
//                 onPressed: () {
//                   counterBloc.eventSink.add(AppBarAction.Profile);
//                 },
//                 child: Text("Reset"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

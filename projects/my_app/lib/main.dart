// import 'package:flutter/material.dart';
// import "package:my_app/screens/align_widget.dart";
// import "package:my_app/screens/asset_image.dart";
// import "package:my_app/screens/card_widget.dart";
// import "package:my_app/screens/container_widget.dart";
// import "package:my_app/screens/expanded_widget.dart";
// import "package:my_app/screens/flexible_widget.dart";
// import "package:my_app/screens/inkwell_widget.dart";
// import "package:my_app/screens/listtileview.dart";
// import "package:my_app/screens/listview_widget.dart";
// import "package:my_app/screens/row_column_widgets.dart";
// import "package:my_app/screens/safearea_widget.dart";
// import "package:my_app/screens/spacer.dart";
// import "package:my_app/screens/stack_widget.dart";
// import "package:my_app/screens/stateful_widget.dart";
// import "package:my_app/screens/stateless_widget.dart";
// import "package:my_app/screens/wrap_widget.dart";

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: ContainerWidget(),
//       // home: HomeScreen1(),
//       // home: HomeScreen(),
//       // home: SafeAreaWidget(),
//       // home: RowColumnWidgets(),
//       // home: StackWidget(),
//       // home: SpacerWidget(),
//       // home: AlignWidget(),
//       // home: WrapWidget(),
//       // home: WrapWidget(),
//       // home: ExpandedWidget(),
//       // home: FlexibleWidget(),
//       // home: ListViewWidget(),
//       // home: ListTileWidget(),
//       // home: CardWidget(),
//       // home: InkWellWidget(),
//       home: ImageWidget(),
//     );
//   }
// }

// TASK-6 : Create Your First Flutter App–Student ID Card

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Student ID Card"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.account_circle, size: 120, color: Colors.blue),

                SizedBox(height: 15),

                Text(
                  "Ayush Agarwal",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "B.Tech CSE",
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),

                SizedBox(height: 20),

                Text(
                  "Roll No: 101",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

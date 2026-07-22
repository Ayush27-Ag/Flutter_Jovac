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

// TASK-7 : Stateless & Stateful Widgets

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isFollowing ? "Following Profile" : "Flutter Profile"),
        backgroundColor: isFollowing ? Colors.green : Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 140, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              "Ayush Agarwal",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Flutter Developer",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
              "ayush@gmail.com",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 35),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },

              icon: Icon(isFollowing ? Icons.check : Icons.person_outline),
              label: Text(isFollowing ? "Following" : "Follow"),
              style: ElevatedButton.styleFrom(
                backgroundColor: isFollowing ? Colors.green : Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

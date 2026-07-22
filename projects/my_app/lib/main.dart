import 'package:flutter/material.dart';
import "package:my_app/screens/align_widget.dart";
import "package:my_app/screens/asset_image.dart";
import "package:my_app/screens/card_widget.dart";
import "package:my_app/screens/container_widget.dart";
import "package:my_app/screens/expanded_widget.dart";
import "package:my_app/screens/flexible_widget.dart";
import "package:my_app/screens/inkwell_widget.dart";
import "package:my_app/screens/listtileview.dart";
import "package:my_app/screens/listview_widget.dart";
import "package:my_app/screens/row_column_widgets.dart";
import "package:my_app/screens/safearea_widget.dart";
import "package:my_app/screens/spacer.dart";
import "package:my_app/screens/stack_widget.dart";
import "package:my_app/screens/stateful_widget.dart";
import "package:my_app/screens/stateless_widget.dart";
import "package:my_app/screens/wrap_widget.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ContainerWidget(),
      // home: HomeScreen1(),
      // home: HomeScreen(),
      // home: SafeAreaWidget(),
      // home: RowColumnWidgets(),
      // home: StackWidget(),
      // home: SpacerWidget(),
      // home: AlignWidget(),
      // home: WrapWidget(),
      // home: WrapWidget(),
      // home: ExpandedWidget(),
      // home: FlexibleWidget(),
      // home: ListViewWidget(),
      // home: ListTileWidget(),
      // home: CardWidget(),
      // home: InkWellWidget(),
      home: ImageWidget(),
    );
  }
}

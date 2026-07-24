import 'package:flutter/material.dart';
import "package:my_app/screens/BottomSheet/model_bottomsheet.dart";
import "package:my_app/screens/Form/calculator.dart";
import "package:my_app/screens/Form/formfield.dart";
import "package:my_app/screens/Form/textfield_widget.dart";
import "package:my_app/screens/Buttons/stateful_buttons.dart";
import "package:my_app/screens/Buttons/stateless_buttons.dart";
import "package:my_app/screens/Navigation/home_screen.dart";
import "package:my_app/screens/Navigation/bottom_navigation.dart";
import "package:my_app/screens/Navigation/drawer_navigation.dart";
import "package:my_app/screens/Navigation/pass_data_screen1.dart";
import "package:my_app/screens/Navigation/push_navigation.dart";
import "package:my_app/screens/Navigation/screen1.dart";
import "package:my_app/screens/Navigation/screen2.dart";
import "package:my_app/screens/Navigation/screen3.dart";
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
import "package:my_app/screens/Navigation/tabbar_navigation.dart";
import "package:my_app/screens/UI%20Widgets/SnackbarWidget/notifications_widgets.dart";
import "package:my_app/screens/UI%20Widgets/DialogBox/alert_dialog.dart";
import "package:my_app/screens/UI%20Widgets/Tables/table_widget.dart";

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
      // home: ImageWidget(),
      // home: StatelessButtonsWidget(),
      // home:SwitchButton()
      // home:StatefulButtons()
      // home:HomeScreen(),
      // home: PushNvaigation1(),
      // home: DrawerNavigationWidget(),
      // home: BottomNavigationWidget(),
      // home: TabbarNavigationWidget(),
      // home: PassingDataScreen1(),
      // home: TextFieldWidget(),
      // home: Calculator(),
      // home: TextFormFieldWidget(),
      // home: AlertDialogWidget(),
      // home: NotificationsWidgets(),
      // home: BottomSheetWidget(),
      home: TableWidget(),
      routes: {
        'S1': (context) => Screen1(),
        'S2': (context) => Screen2(),
        'S3': (context) => Screen3(),
      },
    );
  }
}

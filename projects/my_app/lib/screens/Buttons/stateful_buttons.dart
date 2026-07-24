import "package:flutter/material.dart";

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isDark = false;
  Color themeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Button"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
                isDark = value;

                if (isDark) {
                  themeColor = Colors.black;
                  print("Dark Theme Enabled");
                } else {
                  themeColor = Colors.white;
                  print("Light Theme Enabled");
                }
              });
            },
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(color: themeColor),
          ),
        ],
      ),
    );
  }
}

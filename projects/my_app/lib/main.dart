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
      title: "User Preferences",
      theme: ThemeData(
        primaryColor: const Color(0xFF5B3FD3),
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
      ),
      home: const UserPreferenceScreen(),
    );
  }
}

class UserPreferenceScreen extends StatefulWidget {
  const UserPreferenceScreen({super.key});

  @override
  State<UserPreferenceScreen> createState() => _UserPreferenceScreenState();
}

class _UserPreferenceScreenState extends State<UserPreferenceScreen> {
  bool notification = true;
  int selectedTheme = 1;
  String theme = "Dark";
  String gender = "Female";
  bool terms = true;
  double fontSize = 20;
  String interest = "Flutter";
  bool saved = true;
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B3FD3),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "User Preferences",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEDE7FF),
                  child: Icon(
                    Icons.notifications_none,
                    color: Color(0xFF5B3FD3),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "Enable Notifications",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Switch(
                  value: notification,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF5B3FD3),
                  onChanged: (value) {
                    setState(() {
                      notification = value;
                    });
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 52),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: "Notifications : "),
                    TextSpan(
                      text: notification ? "Enabled" : "Disabled",
                      style: TextStyle(
                        color: notification ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),

            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFFFF1E6),
                  child: Icon(Icons.palette_outlined, color: Colors.orange),
                ),
                SizedBox(width: 12),
                Text("Choose Theme", style: TextStyle(fontSize: 17)),
              ],
            ),

            const SizedBox(height: 8),

            ToggleButtons(
              borderRadius: BorderRadius.circular(8),
              isSelected: [selectedTheme == 0, selectedTheme == 1],
              selectedColor: Colors.white,
              color: Colors.black,
              fillColor: const Color(0xFF5B3FD3),
              onPressed: (index) {
                setState(() {
                  selectedTheme = index;
                  theme = index == 0 ? "Light" : "Dark";
                });
              },
              children: const [
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.light_mode),
                      SizedBox(width: 8),
                      Text("Light"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dark_mode),
                      SizedBox(width: 8),
                      Text("Dark"),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: "Selected Mode : "),
                  TextSpan(
                    text: theme,
                    style: const TextStyle(color: Color(0xFF5B3FD3)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFFFEEF3),
                  child: Icon(Icons.person_outline, color: Colors.pink),
                ),
                SizedBox(width: 12),
                Text("Select Gender", style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    const Text("Male"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "Other",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    const Text("Other"),
                  ],
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: "Selected Gender : "),
                  TextSpan(
                    text: gender,
                    style: const TextStyle(color: Color(0xFF5B3FD3)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),
            CheckboxListTile(
              value: terms,
              activeColor: Colors.green,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "I accept the "),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
              onChanged: (value) {
                setState(() {
                  terms = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: "Status : "),
                    TextSpan(
                      text: terms ? "Accepted" : "Not Accepted",
                      style: TextStyle(
                        color: terms ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFE8F0FF),
                  child: Text(
                    "A",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
                SizedBox(width: 12),
                Text("Font Size", style: TextStyle(fontSize: 17)),
                SizedBox(width: 5),
                Text("(Sample Text)", style: TextStyle(color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("10"),
                Expanded(
                  child: Slider(
                    min: 10,
                    max: 30,
                    value: fontSize,
                    activeColor: const Color(0xFF5B3FD3),
                    onChanged: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ),
                ),
                const Text("30"),
                const SizedBox(width: 10),
                Text("Current Size : ${fontSize.toInt()}"),
              ],
            ),
            Center(
              child: Text(
                "Flutter is Awesome!",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEDE7FF),
                  child: Icon(Icons.favorite_outline, color: Color(0xFF5B3FD3)),
                ),
                SizedBox(width: 12),
                Text("Choose Your Interests", style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ChoiceChip(
                  label: const Text("Flutter"),
                  selected: interest == "Flutter",
                  selectedColor: const Color(0xFF5B3FD3),
                  labelStyle: TextStyle(
                    color: interest == "Flutter" ? Colors.white : Colors.black,
                  ),
                  onSelected: (value) {
                    setState(() {
                      interest = "Flutter";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("AI"),
                  selected: interest == "AI",
                  selectedColor: const Color(0xFF5B3FD3),
                  labelStyle: TextStyle(
                    color: interest == "AI" ? Colors.white : Colors.black,
                  ),
                  onSelected: (value) {
                    setState(() {
                      interest = "AI";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("Web Development"),
                  selected: interest == "Web Development",
                  selectedColor: const Color(0xFF5B3FD3),
                  labelStyle: TextStyle(
                    color: interest == "Web Development"
                        ? Colors.white
                        : Colors.black,
                  ),
                  onSelected: (value) {
                    setState(() {
                      interest = "Web Development";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("Game Development"),
                  selected: interest == "Game Development",
                  selectedColor: const Color(0xFF5B3FD3),
                  labelStyle: TextStyle(
                    color: interest == "Game Development"
                        ? Colors.white
                        : Colors.black,
                  ),
                  onSelected: (value) {
                    setState(() {
                      interest = "Game Development";
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: "Selected Interest : "),
                  TextSpan(
                    text: interest,
                    style: const TextStyle(color: Color(0xFF5B3FD3)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Quick Actions",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                ActionChip(
                  avatar: const Icon(Icons.refresh, color: Colors.red),
                  label: const Text("Reset"),
                  onPressed: () {
                    setState(() {
                      notification = true;
                      selectedTheme = 1;
                      theme = "Dark";
                      gender = "Female";
                      terms = true;
                      fontSize = 20;
                      interest = "Flutter";
                      saved = false;
                    });
                  },
                ),
                ActionChip(
                  avatar: const Icon(Icons.save, color: Colors.green),
                  label: const Text("Save"),
                  onPressed: () {
                    setState(() {
                      saved = true;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (saved)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Preferences Saved Successfully!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 8),
            const Divider(height: 18),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEDE7FF),
                  child: Icon(Icons.list_alt, color: Color(0xFF5B3FD3)),
                ),
                SizedBox(width: 12),
                Text("Profile Setup Progress", style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: currentStep >= 0
                      ? const Color(0xFF5B3FD3)
                      : Colors.grey.shade300,
                  child: const Text("1", style: TextStyle(color: Colors.white)),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: currentStep >= 1
                        ? const Color(0xFF5B3FD3)
                        : Colors.grey.shade300,
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: currentStep >= 1
                      ? const Color(0xFF5B3FD3)
                      : Colors.grey.shade300,
                  child: const Text("2", style: TextStyle(color: Colors.white)),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: currentStep >= 2
                        ? const Color(0xFF5B3FD3)
                        : Colors.grey.shade300,
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: currentStep >= 2
                      ? const Color(0xFF5B3FD3)
                      : Colors.grey.shade300,
                  child: const Text("3", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Divider(color: Colors.grey, thickness: 1),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 14,
                    ),
                    side: const BorderSide(color: Color(0xFF5B3FD3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(
                      color: Color(0xFF5B3FD3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B3FD3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (currentStep < 2) {
                        currentStep++;
                      }
                    });
                  },
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

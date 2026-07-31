import 'dart:async';

import 'package:flutter/material.dart';
import 'success_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SuccessScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Uploading Assignment",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset("assets/images/upload.png", height: 140),

              const SizedBox(height: 25),

              const Text(
                "Uploading Assignment...",
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 40),

              SizedBox(
                height: 120,
                width: 120,

                child: Stack(
                  fit: StackFit.expand,

                  children: [
                    CircularProgressIndicator(
                      value: 0.65,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation(
                        Colors.deepPurple,
                      ),
                    ),

                    const Center(
                      child: Text(
                        "65%",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_loading.PNG"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 200,
                    maxWidth: MediaQuery.of(context).size.width * 0.85,
                  ),
                  child: Image.asset("assets/images/cloud_logo.PNG"),
                ),
              ),
            ),
            const SizedBox(height: 120),
            const Text(
              "Connect on a deeper level.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffc4a699),
                fontSize: 40,
                fontFamily: "Lofty Goals",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

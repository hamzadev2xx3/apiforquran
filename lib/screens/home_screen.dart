import 'package:apiforquran/screens/api_services.dart';
import 'package:apiforquran/models/ayat_of_the_day.dart';
import 'package:flutter/material.dart';

ApiServices _apiServices = ApiServices();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(top: 50, bottom: 20),
              child: Column(
                children: [
                  FutureBuilder<AyaOfTheday>(
                    future: _apiServices.getAyaOfTheDay(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Icon(Icons.sync_problem);
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          return const CircularProgressIndicator();
                        case ConnectionState.done:
                          return Container(
                            margin: const EdgeInsetsDirectional.all(16),
                            padding: const EdgeInsetsDirectional.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: Column(
                              children: [
                                const Text(
                                  "Quran Aya of the Day",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Divider(
                                  color: Colors.black,
                                  thickness: 0.5,
                                ),
                                Text(
                                  snapshot.data!.arText!,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                                Text(
                                  snapshot.data!.enTran!,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                                RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data!.surNumber!.toString(),
                                          style: const TextStyle(
                                              fontSize: 14), // Padding
                                        ),
                                      ),
                                    ), // WidgetSpan
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data!.surEnName!,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ), // RichText
                              ],
                            ),
                          );
                      }
                    },
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

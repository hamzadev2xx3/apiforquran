import 'package:apiforquran/screens/api_services.dart';
import 'package:flutter/material.dart';

import '../models/surah.dart';
import '../widgets/surah_custom_tile.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quran'),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Text(
                'Surah',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20), //index - 0
              ),
              Text(
                'Sajda',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ), //index - 2
              Text(
                'Juz',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20), //index - 3
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              FutureBuilder(
                future: apiServices.getSurah(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surah = snapshot.data;
                    return ListView.builder(
                      itemCount: surah!.length,
                      itemBuilder: (context, index) => SurahCustomListTile(
                          surah: surah[index], context: context, ontap: () {}),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const Center(
                child: Text('Its abc'),
              ),
              const Center(
                child: Text('Its abcdefg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

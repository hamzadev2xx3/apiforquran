import 'package:flutter/material.dart';
import '../models/surah.dart';

Widget SurahCustomListTile(
    {required Surah surah,
    required BuildContext context,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      //height: 70,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        ),
      ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 40,
                // decoration: const BoxDecoration(
                //shape: BoxShape.circle,
                //   color: Colors.black,
                // ), // BoxDecoration
                child: Text(
                  (surah.number ?? 0).toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(surah.englishNameTranslation!),
                ],
              ),
              //const SizedBox(width: 10),
              Spacer(),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    surah.name!,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(width: 20),
          /*  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surah.englishName!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(surah.englishNameTranslation!),
            ],
          ),*/
          // const Spacer(),
          /*Text(
            surah.name!,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),*/
        ],
      ),
    ),
  );
}

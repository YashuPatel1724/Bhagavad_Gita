import 'dart:ui';

import 'package:bhagwad_gita/BhagwadGita/provider/gita_provider.dart';
import 'package:bhagwad_gita/BhagwadGita/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GitaProvider gitaProvider = Provider.of(context, listen: false);
    GitaProvider gitaProviderTrue = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff401A03),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          'श्रीमद् भगवद्गीता',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  gitaProvider.translateLanguage();
                },
                child: Icon(
                  Icons.translate,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/gita-101.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: ListView.builder(
              itemCount: gitaProvider.gitaList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  gitaProvider.Index(index);
                  Navigator.of(context).pushNamed('/detail');
                },
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  color: Colors.black38,
                  child: ListTile(
                    title: Text(
                      (gitaProvider.languageIndex == 0)
                          ? gitaProvider.gitaList[index].chapterName.Sanskrit
                          : (gitaProvider.languageIndex == 1)
                              ? gitaProvider.gitaList[index].chapterName.Hindi
                              : (gitaProvider.languageIndex == 2)
                                  ? gitaProvider
                                      .gitaList[index].chapterName.English
                                  : gitaProvider
                                      .gitaList[index].chapterName.Gujarati,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          ' ${(gitaProvider.languageIndex == 0)
                        ? chapter[0]
                        : (gitaProvider.languageIndex == 1)
                        ?  chapter[1]
                        : (gitaProvider.languageIndex == 2)
                        ? chapter[2]
                        : chapter[3]} : ${gitaProvider.gitaList[index].Chapter}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          '${(gitaProvider.languageIndex == 0)
                              ? total[0]
                              : (gitaProvider.languageIndex == 1)
                              ?  total[1]
                              : (gitaProvider.languageIndex == 2)
                              ? total[2]
                              : total[3]} : ${shlok[index]}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    leading: Text(
                      '${gitaProvider.gitaList[index].Chapter}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

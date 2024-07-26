import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../provider/gita_provider.dart';
import '../../utils/global.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    GitaProvider gitaProvider = Provider.of(context, listen: false);
    GitaProvider gitaProviderTrue = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff401A03),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Text(
          textAlign: TextAlign.center,
          (gitaProvider.languageIndex == 0)
              ? gitaProvider
                  .gitaList[gitaProviderTrue.SelectedIndex].chapterName.Sanskrit
              : (gitaProvider.languageIndex == 1)
                  ? gitaProvider.gitaList[gitaProviderTrue.SelectedIndex]
                      .chapterName.Hindi
                  : (gitaProvider.languageIndex == 2)
                      ? gitaProvider.gitaList[gitaProviderTrue.SelectedIndex]
                          .chapterName.English
                      : gitaProvider.gitaList[gitaProviderTrue.SelectedIndex]
                          .chapterName.Gujarati,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
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
            color: Colors.black.withOpacity(0.5),
          ),
          SingleChildScrollView(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage(
                                  '${img[gitaProviderTrue.SelectedIndex]}'))),
                    ),
                  ),
                  ...List.generate(
                    gitaProvider
                        .gitaList[gitaProviderTrue.SelectedIndex].Verses.length,
                    (index) => Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black38,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              (gitaProvider.languageIndex == 0)
                                  ? gitaProvider
                                      .gitaList[gitaProviderTrue.SelectedIndex]
                                      .Verses[index]
                                      .language
                                      .Sanskrit
                                  : (gitaProvider.languageIndex == 1)
                                      ? gitaProvider
                                          .gitaList[
                                              gitaProviderTrue.SelectedIndex]
                                          .Verses[index]
                                          .language
                                          .Hindi
                                      : (gitaProvider.languageIndex == 2)
                                          ? gitaProvider
                                              .gitaList[gitaProviderTrue
                                                  .SelectedIndex]
                                              .Verses[index]
                                              .language
                                              .English
                                          : gitaProvider
                                              .gitaList[gitaProviderTrue
                                                  .SelectedIndex]
                                              .Verses[index]
                                              .language
                                              .Gujarati,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Dialog.fullscreen(
                                          backgroundColor: Colors.black,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: RepaintBoundary(
                                                  key: repaintKey,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    alignment: Alignment.center,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'assets/images/c6349862-4970-11ef-8158-0242ac11000e.jpeg'),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          (gitaProvider
                                                                      .languageIndex ==
                                                                  0)
                                                              ? gitaProvider
                                                                  .gitaList[
                                                                      gitaProviderTrue
                                                                          .SelectedIndex]
                                                                  .chapterName
                                                                  .Sanskrit
                                                              : (gitaProvider
                                                                          .languageIndex ==
                                                                      1)
                                                                  ? gitaProvider
                                                                      .gitaList[
                                                                          gitaProviderTrue
                                                                              .SelectedIndex]
                                                                      .chapterName
                                                                      .Hindi
                                                                  : (gitaProvider
                                                                              .languageIndex ==
                                                                          2)
                                                                      ? gitaProvider
                                                                          .gitaList[gitaProviderTrue
                                                                              .SelectedIndex]
                                                                          .chapterName
                                                                          .English
                                                                      : gitaProvider
                                                                          .gitaList[
                                                                              gitaProviderTrue.SelectedIndex]
                                                                          .chapterName
                                                                          .Gujarati,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          (gitaProvider
                                                                      .languageIndex ==
                                                                  0)
                                                              ? gitaProvider
                                                                  .gitaList[
                                                                      gitaProviderTrue
                                                                          .SelectedIndex]
                                                                  .Verses[index]
                                                                  .language
                                                                  .Sanskrit
                                                              : (gitaProvider
                                                                          .languageIndex ==
                                                                      1)
                                                                  ? gitaProvider
                                                                      .gitaList[
                                                                          gitaProviderTrue
                                                                              .SelectedIndex]
                                                                      .Verses[
                                                                          index]
                                                                      .language
                                                                      .Hindi
                                                                  : (gitaProvider
                                                                              .languageIndex ==
                                                                          2)
                                                                      ? gitaProvider
                                                                          .gitaList[gitaProviderTrue
                                                                              .SelectedIndex]
                                                                          .Verses[
                                                                              index]
                                                                          .language
                                                                          .English
                                                                      : gitaProvider
                                                                          .gitaList[gitaProviderTrue
                                                                              .SelectedIndex]
                                                                          .Verses[
                                                                              index]
                                                                          .language
                                                                          .Gujarati,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      RenderRepaintBoundary
                                                          boundary = repaintKey
                                                                  .currentContext!
                                                                  .findRenderObject()
                                                              as RenderRepaintBoundary;

                                                      ui.Image image =
                                                          await boundary
                                                              .toImage();
                                                      ByteData? byteData =
                                                          await image.toByteData(
                                                              format: ui
                                                                  .ImageByteFormat
                                                                  .png) as ByteData;

                                                      Uint8List img = byteData
                                                          .buffer
                                                          .asUint8List();

                                                      final imgPath =
                                                          await getApplicationDocumentsDirectory();
                                                      final file = File(
                                                          "${imgPath.path}/img.png");

                                                      file.writeAsBytes(img);
                                                      ShareExtend.share(
                                                          file.path, 'image');
                                                    },
                                                    icon: const Icon(
                                                      Icons.share,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () async {
                                                      RenderRepaintBoundary
                                                          boundry = repaintKey
                                                                  .currentContext!
                                                                  .findRenderObject()
                                                              as RenderRepaintBoundary;

                                                      ui.Image image =
                                                          await boundry
                                                              .toImage();
                                                      ByteData? byteData =
                                                          await image.toByteData(
                                                              format: ui
                                                                  .ImageByteFormat
                                                                  .png);

                                                      Uint8List img = byteData!
                                                          .buffer
                                                          .asUint8List();

                                                      ImageGallerySaver
                                                          .saveImage(img);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          content: Text(
                                                              'Saved to the gallery!'),
                                                        ),
                                                      );
                                                      Navigator.pop(context);
                                                      ImageGallerySaver
                                                          .saveImage(img);
                                                    },
                                                    icon: const Icon(
                                                      Icons.save_alt,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: (gitaProvider.languageIndex == 0)
                                          ? gitaProvider
                                              .gitaList[gitaProviderTrue
                                                  .SelectedIndex]
                                              .Verses[index]
                                              .language
                                              .Sanskrit
                                          : (gitaProvider.languageIndex == 1)
                                              ? gitaProvider
                                                  .gitaList[gitaProviderTrue
                                                      .SelectedIndex]
                                                  .Verses[index]
                                                  .language
                                                  .Hindi
                                              : (gitaProvider.languageIndex ==
                                                      2)
                                                  ? gitaProvider
                                                      .gitaList[gitaProviderTrue
                                                          .SelectedIndex]
                                                      .Verses[index]
                                                      .language
                                                      .English
                                                  : gitaProvider
                                                      .gitaList[gitaProviderTrue
                                                          .SelectedIndex]
                                                      .Verses[index]
                                                      .language
                                                      .Gujarati,
                                    ));
                                  },
                                  child: Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

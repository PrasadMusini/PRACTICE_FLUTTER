import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class TypeWriterTextPackage extends StatelessWidget {
  const TypeWriterTextPackage({super.key});

  final String loremText =
      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TypeWriter.text(
                  "What is Lorem Ipsum?",
                  maintainSize: true,
                  alignment: Alignment.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: const Duration(milliseconds: 50),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TypeWriter(
                    controller: TypeWriterController(
                      text: loremText,
                      duration: const Duration(milliseconds: 50),
                    ),
                    builder: (context, value) {
                      return AutoSizeText(
                        value.text,
                        maxLines: 2,
                        minFontSize: 18.0,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14.0),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

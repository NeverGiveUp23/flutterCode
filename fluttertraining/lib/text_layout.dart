import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hello World!",
          style: TextStyle(fontSize: 40),
        ),

        Text(
          'Text wrap can wrap without issues',
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        const Text(
          "  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at mauris massa. Suspendisse potenti. Aenean aliquet eu nisl vitae tempus.'"
        ),

        const Divider(),

        RichText(
          text:  TextSpan(
            text: 'Flutter text is ',
            style: GoogleFonts.leckerliOne(
              fontSize: 22, 
              color: Colors.black
              ),
            children: const <TextSpan>[
              TextSpan(
                text: 'Really ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                children: [
                  TextSpan(
                    text: 'Powerful.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                      color: Colors.green,
                      fontSize: 40,
                    )
                  )
                ]
              )
            ]
          ) 
        )
      ],
    );
  }
}
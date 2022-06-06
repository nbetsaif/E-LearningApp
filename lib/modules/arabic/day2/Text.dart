import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Text2 extends StatelessWidget {
  const Text2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf/j2.pdf'),
    );
    Widget pdfView() => PdfView(
      scrollDirection: Axis.vertical,
      controller: pdfController,
    );
    return SafeArea(
      child: Card(
        margin: const EdgeInsetsDirectional.only(top: 100, bottom: 70),
        child: pdfView(),
      ),
    );
  }
}

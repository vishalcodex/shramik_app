import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MembershipCard {
  static Future<pw.Document> createStatement(Uint8List? value) async {
    // pw.TextStyle style =
    //     const pw.TextStyle(fontSize: 10, color: PdfColors.black);
    // final ByteData frontImgBytes =
    //     await rootBundle.load('assets/ui/front.jpeg');
    // final Uint8List frontByteList = frontImgBytes.buffer.asUint8List();
    final Uint8List frontByteList = value!;
    final ByteData backImgBytes = await rootBundle.load('assets/ui/back.jpeg');
    final Uint8List backByteList = backImgBytes.buffer.asUint8List();
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(20),
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Image(
                    pw.MemoryImage(frontByteList),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                    child: pw.Image(
                      pw.MemoryImage(backByteList),
                    ),
                  )
                  // pw.Text(
                  //     "VASAI PRAGATI CO-OPERATIVE CREDIT SOCIETY LTD., ARNALA",
                  //     style: style.copyWith(fontWeight: pw.FontWeight.bold)),
                  // pw.SizedBox(height: 15),
                  // //FROM, BRANCH, REPORT DATE
                  // pw.Row(
                  //     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: pw.CrossAxisAlignment.center,
                  //     children: [
                  //       pw.Text("From :", style: style),
                  //       pw.Text("Branch : ", style: style),
                  //       pw.Text("Report Date", style: style)
                  //     ]),
                  // pw.SizedBox(height: 5),
                  // //TO, ACCOUNT, DATE
                  // pw.Row(
                  //     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: pw.CrossAxisAlignment.center,
                  //     children: [
                  //       pw.Text("To : ", style: style),
                  //       pw.Text("Account Statement",
                  //           style:
                  //               style.copyWith(fontWeight: pw.FontWeight.bold)),
                  //       pw.Text(DateFormat("dd/MM/yyyy").format(DateTime.now()),
                  //           style: style)
                  //     ]),
                  // pw.SizedBox(height: 15),
                  // //AC NO.
                  // pw.Row(children: [
                  //   pw.Text("Ac No. : ",
                  //       textAlign: pw.TextAlign.left, style: style),
                  // ]),
                  // pw.SizedBox(height: 5),
                  // // NAME
                  // pw.Row(children: [
                  //   pw.Text("Name :",
                  //       textAlign: pw.TextAlign.left, style: style),
                  // ]),
                  // pw.SizedBox(height: 15),
                  // pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                  // //HEADER
                  // pw.Container(
                  //   padding: const pw.EdgeInsets.all(5),
                  //   child: pw.Row(children: [
                  //     pw.Expanded(
                  //       child: pw.Center(
                  //         child: pw.Text(
                  //           "Date",
                  //           style: style,
                  //           textAlign: pw.TextAlign.left,
                  //         ),
                  //       ),
                  //     ),
                  //     // pw.Expanded(
                  //     //   child: pw.Center(
                  //     //     child: pw.Text(
                  //     //       "Doc No.",
                  //     //       style: style,
                  //     //       textAlign: pw.TextAlign.left,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     pw.Expanded(
                  //       child: pw.Center(
                  //         child: pw.Text(
                  //           "Transaction",
                  //           style: style,
                  //           textAlign: pw.TextAlign.left,
                  //         ),
                  //       ),
                  //     ),
                  //     pw.Expanded(
                  //       child: pw.Center(
                  //         child: pw.Text(
                  //           "Particulars",
                  //           style: style,
                  //           textAlign: pw.TextAlign.left,
                  //         ),
                  //       ),
                  //     ),
                  //     pw.Expanded(
                  //       child: pw.Center(
                  //         child: pw.Text(
                  //           "Debit",
                  //           style: style,
                  //           textAlign: pw.TextAlign.left,
                  //         ),
                  //       ),
                  //     ),
                  //     pw.Expanded(
                  //       child: pw.Center(
                  //         child: pw.Text(
                  //           "Credit",
                  //           style: style,
                  //           textAlign: pw.TextAlign.left,
                  //         ),
                  //       ),
                  //     ),
                  //     pw.Expanded(
                  //       child: pw.Center(
                  //         child: pw.Text(
                  //           "Balance",
                  //           style: style,
                  //           textAlign: pw.TextAlign.left,
                  //         ),
                  //       ),
                  //     ),
                  //   ]),
                  // ),
                  // pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                  // pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                ]),
          );
        },
      ),
    );

    return pdf;
  }

  static _getCardEntry(String field, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Text(field

                // color: ColorPallete.secondary,
                // weight: FontWeight.w600,
                ),
          ),
          pw.Text(
            " : ",
            // color: ColorPallete.secondary,
            // weight: FontWeight.w600,
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              value,
              // color: ColorPallete.secondary,
              // weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

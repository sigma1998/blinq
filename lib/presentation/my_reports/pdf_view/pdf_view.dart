import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/loading/blinq_loading.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatefulWidget {
  static const String route = '/pdf_view_screen';
  const PdfViewScreen({super.key});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  //
  bool isLoaded = false;

  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    final pdfView = ModalRoute.of(context)!.settings.arguments as PdfViewDetail;

    return Scaffold(
      appBar: MyAppBar(
        title: pdfView.title,
      ),
      body: Stack(
        children: [
          SfPdfViewer.network(
            pdfView.pdf,
            key: _pdfViewerStateKey,
            canShowPageLoadingIndicator: false,
            controller: _pdfViewerController,
            onDocumentLoaded: (PdfDocumentLoadedDetails details) {
              isLoaded = true;
              updateState();
            },
          ),
          if (!isLoaded) const BlinqLoading()
        ],
      ),
    );
  }
}

class PdfViewDetail {
  final String pdf;
  final String title;

  const PdfViewDetail(this.pdf, this.title);
}

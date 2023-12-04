import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class FinishedScreenBloc extends Cubit<GenericBlocState<String>> {
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  final String _pdfName = 'strDamageReports'.tr();

  FinishedScreenBloc(
      {required this.reportBloc, required this.accidentRepository})
      : super(const GenericBlocState<String>(status: Status.loading)) {
    _getPdf();
  }

  void _getPdf() async {
    try {
      final pdf = await accidentRepository.getPdf(reportBloc.reportId);
      emit(GenericBlocState(status: Status.initial, data: pdf));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  void onSendInsurance()async {
    emit(GenericBlocState(status: Status.loading, data: state.data));
    try{

      await accidentRepository.sendToInsurance(reportBloc.reportId);
      emit(GenericBlocState(status: Status.initial, data: state.data));

      NavigationService.showToast(text: 'strSuccess'.tr(), title: 'strReportSent'.tr());

    }catch(e){
      emit(GenericBlocState(status: Status.initial, data: state.data));
    }



  }

  void onSendTelegram() {
    launchUrl(
        Uri.parse(
            "https://t.me/share/url?url=${state.data}&text=$_pdfName"),
        mode: LaunchMode.externalApplication);
  }

  void onSendWhatsApp() {
    launchUrl(Uri.parse(
        "whatsapp://send?text=Check out my report ${state.data}"));
  }

  void onSendEmail() {
    launchUrl(
      Uri(
        scheme: 'mailto',
        query: _encodeQueryParameters(
          <String, String>{
            'subject': _pdfName,
            'body': Uri.decodeComponent(
                "Link : ${state.data}"),
          },
        ),
      ),
    );
  }

  static String _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

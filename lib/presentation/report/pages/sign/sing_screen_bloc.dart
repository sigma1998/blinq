import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand_signature/signature.dart';

class SignScreenBloc extends Cubit<GenericBlocState<bool>>{

  final GlobalKey previewContainer = GlobalKey();
  final HandSignatureControl control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );


  SignScreenBloc():super(const GenericBlocState(status: Status.initial));


}
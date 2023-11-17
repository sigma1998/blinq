// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/dialogs/default_dialog.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/countries_bloc.dart';
import 'bloc/countries_event.dart';

class CountriesDialog extends StatefulWidget {
  //
  const CountriesDialog({super.key});

  @override
  State<CountriesDialog> createState() => _CountriesDialogState();
}

class _CountriesDialogState extends State<CountriesDialog> {
  //
  final bloc = CountriesBloc();

  @override
  void initState() {
    bloc.add(OnLoadCountries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Loading();
        }

        return MyDialog(
          items: state.countries,
        );
      },
    );
  }
}

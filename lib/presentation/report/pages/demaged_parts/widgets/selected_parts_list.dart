
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_bloc.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/bloc/damaged_parts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedPartsList extends StatelessWidget {
  const SelectedPartsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bloc = context.read<DamagedPartsBloc>();
    return BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
      bloc: bloc,
      builder: (context, state) {
        return SizedBox(
          height: 24,
          width: width - 48,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.onSecondary),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: Text(state.carParts.elementAt(index)),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 6,
                );
              },
              itemCount: state.carParts.length),
        );
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama_app/common/style/style.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class DetailPersonalAbsen extends StatefulWidget {
  static const routeName = 'detail-personal-absen';
  static const path = 'detail-personal-absen';
  final String noOrder;
  final String id;
  const DetailPersonalAbsen({
    Key? key,
    required this.noOrder,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPersonalAbsen> createState() => _DetailPersonalAbsenState();
}

class _DetailPersonalAbsenState extends State<DetailPersonalAbsen> {
  @override
  void initState() {
    // Future.microtask(() => context.read<AbsenBloc>().add(
    //     FetchAbsenPerson(noOrder: widget.noOrder, id: widget.id.toString())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: SfCalendar(
        minDate: DateTime(2023),
        maxDate: DateTime.now(),
        view: CalendarView.month,
        todayHighlightColor: softBlueColor,
      ),
    )
            // BlocBuilder<AbsenBloc, AbsenState>(
            // builder: (context, state) {
            //   if (state is GetAbsenSuccess) {
            //     final data = state.dataAbsenEntity.data;
            //     return SfCalendar(view: CalendarView.month,);
            //   }

            // },
            // ),
            ));
  }
}

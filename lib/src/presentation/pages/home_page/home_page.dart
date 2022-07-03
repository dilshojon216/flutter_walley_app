import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_walley_app/src/presentation/bloc/home/home_page_event.dart';
import 'package:flutter_walley_app/src/presentation/bloc/home_page_state.dart';

import '../../bloc/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 1;
  int perPage = 15;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(GetCuratedLoaded(page, perPage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomePageStateLoaded) {
          print(state.photos.length);
          return Center(
            child: Image.network(state.photos[6].src.medium),
          );
        } else if (state is HomePageStateError) {
          print(state.message);
          return Center(
            child: Text('Error ${state.message}'),
          );
        }
        return Container();
      },
    );
  }
}

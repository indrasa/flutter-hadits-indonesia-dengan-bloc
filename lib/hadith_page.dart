import 'package:cobahadits/bloc/hadith_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HadithPage extends StatefulWidget {
  @override
  _HadithPageState createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      context.read<HadithBloc>().add(HadithFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hadith Infinite List')),
      body: BlocBuilder<HadithBloc, HadithState>(
        builder: (context, state) {
          if (state is HadithInitial ||
              state is HadithLoading && state.hadiths.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HadithFailure) {
            return Center(child: Text('Failed to fetch hadiths'));
          } else if (state is HadithSuccess) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hadiths.length,
              itemBuilder: (context, index) {
                final hadith = state.hadiths[index];
                return ListTile(
                  title: Text(hadith.arab),
                  subtitle: Text(hadith.translation),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

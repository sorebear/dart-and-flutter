import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import 'dart:async';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    // THIS IS BAD!!! Don't Do This!
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 6.0,
            )
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Container(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text('${snapshot.data[index]}')
              ), 
            );
          },
        );
      }
    );
  }
}
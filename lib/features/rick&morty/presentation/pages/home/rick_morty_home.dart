import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/remote/remote_rickmorty_bloc.dart';
import '../../bloc/remote/remote_rickmorty_state.dart';
import '../../widget/rick_morty_tile.dart';

class RickMortyHome extends StatelessWidget {
  const RickMortyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteRickMortyBloc, RemoteRickmortyState>(
      builder: (_, state) {
        if (state is RemoteRickMortyLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteRickMortyError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteRickMortyDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return RickMortyWidget(
                rickmorty: state.rickmorty![index],
                // onRickMortyPressed: (article) =>
                //     _onRickMortyPressed(context, article),
              );
            },
            itemCount: state.rickmorty!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}

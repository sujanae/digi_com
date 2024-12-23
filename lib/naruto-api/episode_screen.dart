import 'package:digi_com/naruto-api/api_services.dart';
import 'package:digi_com/naruto-api/episode_model.dart';
import 'package:flutter/material.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({super.key});

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  late Future<List<Episode>> futureEpisodes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureEpisodes = ApiService().fetchEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Naruto Episodes')),
      body: FutureBuilder<List<Episode>>(
        future: futureEpisodes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final episodes = snapshot.data!;
            return ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(episodes[index].title),
                  subtitle: Text(episodes[index].description),
                  trailing: Text(episodes[index].airDate),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

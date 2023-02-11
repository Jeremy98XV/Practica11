import 'package:flutter/material.dart';
import 'package:practica11/services/photo_service.dart';

import '../models/photo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo>? listaDePhotos;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    obtenerPhoto();
  }

  @override
  Widget build(BuildContext conmtext) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Photo'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        child: ListView.builder(
          itemCount: listaDePhotos?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listaDePhotos![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Image(
                          fit: BoxFit.contain,
                          image:
                              NetworkImage(//listaDePhotos![index].thumbnailUrl
                             "https://picsum.photos/id/"+index.toString()+"/200/300" ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  obtenerPhoto() async {
    listaDePhotos = await PhotoService().getPhoto();
    if (listaDePhotos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
}

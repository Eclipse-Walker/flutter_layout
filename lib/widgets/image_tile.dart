import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;
  const ImageTile(
      {super.key,
      required this.imageSource,
      required this.index,
      required this.extent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      height: extent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageSource,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              log('Loading image: $url');
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
            errorWidget: (context, url, error) {
              log('Failed to load image: $url');
              log('Error: $error');
              return Center(
                // child: Icon(Icons.error, color: Colors.red),
                child: Container(),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Image $index',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 11),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

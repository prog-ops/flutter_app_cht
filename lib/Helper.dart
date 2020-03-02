import 'dart:convert';
import 'package:flutter/material.dart';

/**
 * ! loads the json file contents and returns a map
 */
Future<Map<String, dynamic>> loadJsonFileAsMap(BuildContext context, String assetPath) async {
  // todo get the contents of the asset as string
  String messageDetailsString = await DefaultAssetBundle.of(context)
      .loadString(assetPath);

  // todo map the content of the asset as json object
  Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);
  print('MAP $mappedMessages');

  // todo return map
  return mappedMessages;
}
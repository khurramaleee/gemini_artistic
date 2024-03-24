import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemini_artistic/models/Image.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ArtMuseProvider extends ChangeNotifier {
  ImageData? image;
  List<String> _artPrompts = [];
  bool isLoading = false;

  ImageData? getImage() => image;
  List<String> get artPrompts => _artPrompts;

  void setImage(ImageData image) {
    this.image = image;
    notifyListeners();
  }

  void setArtPrompts(List<String> prompts) {
    _artPrompts = prompts;
    isLoading = false;
    notifyListeners();
  }

  Future<void> generateArtPrompts(String imagePath,
      {String? userPrompt}) async {
    isLoading = true;
    notifyListeners();
    try {
      final generativeAi = GenerativeModel(
          model: 'gemini-pro-vision',
          apiKey: "YOUR_API_KEY");
      final imageFile = File(imagePath);
      final imageBytes = await imageFile.readAsBytes();
      final prompt = TextPart(
          "Create artistic descriptions inspired by this image.");
      final imagePart = DataPart('image/jpeg', imageBytes);
      final content = [
        Content.multi([prompt, imagePart])
      ];
      final response = await generativeAi.generateContent(content);
      final prompts = response.text!.split("\n");
      setArtPrompts(prompts);
    } catch (error) {
      print(error);
    }
  }
}

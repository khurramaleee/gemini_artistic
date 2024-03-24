import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemini_artistic/models/Image.dart';
import 'package:gemini_artistic/providers/ArtMuseProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Art Muse',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue, // Add a vibrant color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Widen content
            children: [
              // Visually prominent image area
              Consumer<ArtMuseProvider>(
                builder: (context, provider, child) => provider.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(provider.image!.Imagepath.toString()),
                          width: double.infinity, // Fill width
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: double.infinity, // Maintain layout consistency
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: Text('Select an image')),
                      ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final image = await pickImage();
                  if (image != null) {
                    context.read<ArtMuseProvider>().setImage(
                      ImageData(
                        image.path,
                      ),
                    );
                  }
                },
                child: const Text('Select Image', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepPurpleAccent, // Match app bar
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Artistic style (optional)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (text) => context.read<ArtMuseProvider>().setArtPrompts(text.split(" ")),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final provider = context.read<ArtMuseProvider>();
                  if (provider.image != null) {
                    await provider.generateArtPrompts(
                      provider.image!.Imagepath.toString(),
                      userPrompt: provider.artPrompts.join(" "),
                    );
                  }
                },
                child: const Text('Generate Art Prompts', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepPurpleAccent, // Match app bar
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 20),
              Consumer<ArtMuseProvider>(
                builder: (context, provider, child) => provider.artPrompts.isNotEmpty
                    ? Column(
                        children: [
                          if (provider.isLoading == true)
                            const Center(child: CircularProgressIndicator()),
                          // List each prompt with spacing and potential formatting
                          ...provider.artPrompts.map((prompt) => Text(
                            prompt,
                            style: const TextStyle(fontSize: 16),
                          )).toList(),
                        ],
                      )
                    : const Text('No art prompts generated yet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

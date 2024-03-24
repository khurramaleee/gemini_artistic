# gemini_artistic

This Flutter application demonstrates the seamless integration of Google's cutting-edge Gemini generative AI with Provider state management. Users can either input text prompts or optionally provide an image to generate artistic text descriptions tailored to the content. The app leverages the google_generative_ai package to interact with the Gemini API, empowering you to create innovative and interactive experiences.

## Getting Started:

## Prerequisites:

Flutter development environment set up (refer to https://docs.flutter.dev/get-started/install for detailed instructions).
A Google AI Studio account and an API key for the Gemini model you wish to use (https://cloud.google.com/generative-ai-studio)
Installation:

Clone this repository: git clone https://github.com/khurramaleee/gemini_artistic.git
Navigate to the project directory: cd flutter-gemini-text-image-app
Install dependencies: flutter pub get
Configuration:

Replace YOUR_GEMINI_API_KEY in lib/providers/ArtMuseProvider.dart with your actual API key from Google AI Studio.

Running the App:

Connect a physical device or start an emulator: flutter run

## Features:

Text Input
Users can enter text prompts directly in the app's UI.
Optional Image Input
Users can choose to upload an image from their device's gallery. The Gemini model attempts to analyze the image and generate artistic text descriptions based on its content.
Provider State Management
The app utilizes Provider for efficient state management, ensuring data is accessible and consistent across the UI.
Customizable Prompts
The app can be extended to allow users to specify additional prompt parameters or control the generation style (e.g., creative writing, technical writing).

## Screenshots:
![Uploading Simulator Screenshot - iPhone 15 Pro Max - 2024-03-24 at 13.46.58.png…]()



## Usage:

Launch the app.
Enter text prompts (optional).
If desired, tap the image icon to select an image from your device's gallery.
The generated artistic text descriptions will be displayed on the screen, potentially drawing inspiration from the image content (if provided).

## Contributing:

We welcome contributions to this project! Feel free to open pull requests with bug fixes, enhancements, or new features. Please adhere to standard coding conventions and document your changes clearly.

## License:

This project is licensed under the MIT License (https://opensource.org/license/mit).

# Url Shortener Flutter app

## Overview

This URL shortener flutter app interacts with the TinyURL API to allow users to shorten long URLs, manage their shortened URLs, and view information about each shortened URL. The app provides a user-friendly interface of converting long URLs into shorter and shareable links, this is important because shortened uls are easier to share especially on platforms with character limits or when sharing complex URLs. The app includes three screens:

- Welcome Screen: The welcome screen that introduces the app
- Home Screen: The main interface where users can input a long URL and get a shortened version using TinyURL
- Results Screen: Displays shortened urls and history of previously shortened urls

## Installation

To run this Flutter app, follow these steps:

1.Clone the repository
  `git clone https://github.com/uwituzeb/url-shortener-app.git`
  
2. Navigate to project repository
  `cd url-shortener-app`

3. Install dependencies
   `flutter pub get`

4. Launch the app using a connected device or emulator and start using the app
   `flutter run`

## Usage

- Welcome Screen: Click on the start button to be directed to home screen,
- Home Screen: Enter a long URL and click the button to generate the shortened URL
- Results Screen: The shortened URL will be displayed here and you can copy to clipboard as well as view previous links.

## API Reference

The app uses the TinyURL API to shorten urls. No API key is required.

#### API endpoint

- GET `https://tinyurl.com/api-create.php?url=[YOUR_LONG_URL]` -pass a long URl as a parameter

## Contributing

Fork the repository and submit a pull request with your enhancements or bug fixes.

# Tube Line Status App

This app provides real-time information about the status of London tube lines, including current service status and other relevant details.

## Table of Contents

- [Features](#features)
- [Assumptions](#assumptions)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Configuration](#configuration)
  - [Obtaining API Key](#obtaining-api-key)
  - [Configuring API Key](#configuring-api-key)
  - [KeychainService Usage](#keychainservice-usage)
- [Running the App](#running-the-app)
- [Running Tests](#running-tests)
- [Additional information](#acknowledgements)

## Features

- **All Lines Status:** View the current status of all London tube lines.
- **Individual Line Details:** Access detailed information for each tube line, including its name and current status.
- **User-friendly UI:** Clean and intuitive interface for a seamless user experience.
- **Accessibility:** Supports text scaling, voice-over, and other accessibility features.
- **Testing:** Includes both unit tests and UI tests for robust code coverage.

## Assumptions

1. **Tube Line Status API:** The app assumes that the "tube/status" API endpoint provides live data for all tube lines. Consequently, the status is hardcoded as "Live" in the table view header, reflecting the real-time nature of the information.

2. **Design Inspiration:** The design of this app is inspired by the existing TFL Go app. This decision was made to offer users a familiar and user-friendly interface, particularly for those accustomed to using official Transport for London apps.

## Getting Started

### Prerequisites

- [Xcode](https://developer.apple.com/xcode/) installed on your system.

### Installation

1. Clone the repository:

    ```bash
    $ git clone [https://github.com/yourusername/tube-line-status.git](https://github.com/sarathkumarsankar/TfL-App.git)
    $ cd TfLApp
    ```

2. Open the Xcode project:

    - Open `TfLApp.xcodeproj` in Xcode.

3. Build and run:

    - Press `Cmd + R` or choose "Product > Run" from the menu.

## Configuration

### Obtaining API Key

To fetch tube line status data, you need an API key from [Tube Line Status API Provider](https://api.tfl.gov.uk).

### Configuring API Key

Once you have obtained your API key, follow one of the methods below to configure it in the app:

#### Method 1: Directly in Config.plist

1. Open the project in Xcode.
2. Navigate to the `TfLApp/Config.plist` file.
3. Find the key-value pair: `API_KEY: {YOUR_API_KEY_HERE}`.
4. Replace `YOUR_API_KEY_HERE` with the actual API key obtained.

#### Method 2: Using Xcode Scheme Environment Variable

1. Open your Xcode project.
2. Select the Scheme you use for running the app (e.g., TfLApp).
3. Click on "Edit Scheme..." at the bottom of the scheme dropdown.
4. In the scheme editor, select the "Run" phase from the left sidebar.
5. Click on the "Arguments" tab.
6. Under the "Environment Variables" section, click the "+" button to add a new environment variable.
7. Set the name as `API_KEY` and provide the actual API key value in the value field.

#### KeychainService Usage

For enhanced security, this app utilizes KeychainService to securely store the API key. KeychainService ensures that sensitive information like API keys is stored in a secure manner on the user's device.

When you run the app for the first time after configuring your API key, the app automatically stores the API key securely in the KeychainService. You don't need to perform any manual steps for this process.

The app retrieves the API key from the KeychainService whenever it needs to make requests to the Tube Line Status API. This retrieval process is seamless and ensures that your API key is never exposed or stored in an insecure manner on the device.

The KeychainService can be extended for storing other sensitive information securely in the future. If the app requires additional secure storage, consider leveraging the existing KeychainService implementation for a consistent and secure approach.

**Note:** The API key stored in the KeychainService is encrypted and can only be accessed by the app on the user's device. It provides an added layer of security for handling sensitive information.

## Running the App

After configuring the API key, run the app on a simulator or a physical device using the steps mentioned in the "Getting Started" section.

## Running Tests

Open `TfLApp.xcodeproj` in Xcode:

- Choose the target for unit tests (`TfLAppTests`) from the target selection dropdown.
- Press `Cmd + U` or navigate to "Product > Test" to run the unit tests.
It Verify the ViewModel's interaction with the API manager and its ability to handle data decoding. This test ensures that the ViewModel correctly triggers the API call and processes the result.

For UI tests:

- Choose the target for UI tests (`TfLAppUITests`) from the target selection dropdown.
- Press `Cmd + U` or navigate to "Product > Test" to run the UI tests.

Ensure that the simulator or physical device is selected to run the UI tests on the intended platform.

## Additional information

- **MVVM Architecture:** The app follows the Model-View-ViewModel (MVVM) architectural pattern, promoting a separation of concerns and maintainability in the codebase.
- **Localization:** To enhance the user experience, the app includes localization features, making it adaptable for users from different language backgrounds.
- **Accessibility Features:** The app is designed with accessibility in mind, supporting features such as text scaling and voice-over. This ensures a broader reach and inclusivity for users with varying needs.
- **Utilities and Extension Folders:** The project structure includes utility classes and extension folders. These provide a systematic organization for common, reusable functions and extensions, contributing to a modular and maintainable codebase.
- **Default Colors:** In cases where specific colors for tube lines are not provided, the app defaults to using a blue color scheme.
- **External Fonts:** The app utilizes fonts downloaded from the internet. Consider replacing them with custom fonts as needed for your design requirements.
- **Design Inspiration:** The app's design is inspired by the existing TFL Go app, providing a familiar and user-friendly interface for users accustomed to the official Transport for London apps.
- **API Key Configuration Flexibility:** The README outlines two methods for configuring the API key: directly in the `Config.plist` file or using Xcode Scheme Environment Variables. This flexibility accommodates different preferences and workflows.
  **Comments:** The codebase is well-documented with comments, providing insights into the purpose and usage of important functions, properties, and classes.
- **App Icon:** An app icon, downloaded from the internet, is included. Feel free to replace it with a custom icon that suits your branding.

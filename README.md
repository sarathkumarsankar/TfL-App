# Tube Line Status App

This app provides real-time information about the status of London tube lines, including current service status and other relevant details.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Configuration](#configuration)
  - [Obtaining API Key](#obtaining-api-key)
  - [Configuring API Key](#configuring-api-key)
- [Running the App](#running-the-app)
- [Running Tests](#running-tests)
- [Acknowledgements](#acknowledgements)

## Features

- **All Lines Status:** View the current status of all London tube lines.
- **Individual Line Details:** Access detailed information for each tube line, including its name and current status.
- **User-friendly UI:** Clean and intuitive interface for a seamless user experience.
- **Accessibility:** Supports text scaling, voice-over, and other accessibility features.
- **Testing:** Includes both unit tests and UI tests for robust code coverage.

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

1. Open the project in Xcode.
2. Navigate to `TfLApp/Config.plist`.
3. Find the key-value pair: `API_KEY: {YOUR_API_KEY_HERE}`.
4. Replace `YOUR_API_KEY_HERE` with the actual API key obtained.

OR

1. Open your Xcode project.
2. Select the Scheme.
3. Edit the Scheme and configure the API_KEY environment variable.

## Running the App

After configuring the API key, run the app on a simulator or a physical device using the steps mentioned in the "Getting Started" section.

## Running Tests

Open `TfLApp.xcodeproj` in Xcode:

- Choose the target for unit tests (`TfLAppTests`) from the target selection dropdown.
- Press `Cmd + U` or navigate to "Product > Test" to run the unit tests.

## Acknowledgements

- MVVM architecture
- Localization for enhanced user experience
- Accessibility features for broader user reach
- Unit tests and UI tests for robust code coverage
- Utilities and Extension folders for code organization

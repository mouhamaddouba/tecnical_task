# Technical Task - Flutter Login & Content App

A Flutter application demonstrating proficiency in handling asynchronous operations, state management, and robust error handling.

## Features

### Login Screen

• Username and Password input fields  
• Client-side validation (fields cannot be empty)  
• Mock authorization with simulated API delay (2-3 seconds)  
• Loading indicator during authentication  
• Network connectivity check before authentication  
• Success: Navigate to Content Screen (username: `test`, password: `12345`)  
• Failure: Display error message for invalid credentials  
• Password visibility toggle functionality  

### Content Screen

• Fetches data from JSONPlaceholder API on initial load  
• Displays loading indicator during data fetching  
• Shows list of 10 mock posts on success  
• Shimmer loading effect for better UX  
• Error state with retry functionality  
• Empty state handling  
• Logout button with confirmation dialog to return to Login Screen  
• Session persistence using SharedPreferences  

## Architecture

This project follows Clean Architecture principles with BLoC pattern for state management.

### Project Structure

```
lib/
├── main.dart                              # App entry point
├── app.dart                               # MaterialApp configuration
└── source/
    ├── core/
    │   ├── bloc/                          # Global BLoC configuration
    │   │   ├── app_bloc.dart             # App-level BLoC providers
    │   │   ├── bloc_observer.dart        # Custom BLoC observer
    │   │   └── network/                  # Network connectivity BLoC
    │   ├── dependencies/                  # GetIt dependency injection
    │   │   ├── app_binding.dart          # Feature bindings
    │   │   └── app_dependencies.dart     # Dependency initialization
    │   ├── routes/                        # GoRouter navigation
    │   │   ├── app_pages.dart            # Route definitions
    │   │   └── app_routes.dart           # Route constants
    │   ├── services/                      # API services
    │   │   ├── api_service.dart          # Dio HTTP client
    │   │   └── shared_preferences_service.dart  # Local storage
    │   ├── themes/                        # App themes and colors
    │   │   ├── app_colors_theme.dart     # Color definitions
    │   │   ├── app_fonts_theme.dart      # Font configurations
    │   │   └── app_themes.dart           # Theme setup
    │   ├── utils/                         # Utility functions
    │   │   └── messages_toasts_utils.dart # Toast message helpers
    │   └── values/                        # Constants and enums
    │       ├── constant/
    │       │   ├── app_dimensions.dart   # App dimensions
    │       │   └── app_strings.dart      # String constants
    │       └── enums/
    │           └── state_app_enum.dart   # App state enums
    ├── features/
    │   ├── login/                         # Login feature
    │   │   └── presentation/
    │   │       ├── bloc/                  # LoginBloc, events, states
    │   │       ├── di/                    # Feature DI
    │   │       └── page/                  # LoginPage UI
    │   │           └── views/             # Login sub-views
    │   │               ├── login_button_view.dart
    │   │               ├── login_form_view.dart
    │   │               └── login_header_view.dart
    │   └── content/                       # Content feature
    │       ├── data/
    │       │   ├── models/                # Data models
    │       │   │   └── content_item_model.dart
    │       │   └── repositories/          # Repository pattern
    │       │       └── content_repository.dart
    │       └── presentation/
    │           ├── bloc/                  # ContentBloc, events, states
    │           ├── di/                    # Feature DI
    │           └── page/                  # ContentPage UI
    │               └── views/             # Content sub-views
    │                   ├── content_app_bar_view.dart
    │                   └── content_card_view.dart
    └── layout/                            # Shared layouts
        ├── app_card_shimmer_layout.dart   # Shimmer loading effect
        └── app_status/                    # Status layouts
            ├── app_empty_data_layout.dart
            ├── app_failure_layout.dart
            └── app_loading_layout.dart
```

## Libraries Used

| Library | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^9.1.1 | State management using BLoC pattern |
| `bloc` | ^9.1.0 | Core BLoC library |
| `go_router` | ^17.0.0 | Declarative navigation |
| `get_it` | ^9.2.0 | Dependency injection |
| `equatable` | ^2.0.7 | Value equality for states |
| `dio` | ^5.9.0 | HTTP client for API calls |
| `connectivity_plus` | ^6.1.0 | Network connectivity monitoring |
| `nested` | ^1.0.0 | Nested widget support |
| `bot_toast` | ^4.1.3 | Toast notifications |
| `shared_preferences` | ^2.3.3 | Local storage for session persistence |

## API

Uses JSONPlaceholder - a free online fake REST API:

• **Endpoint**: `GET /posts?_limit=10`  
• **Base URL**: `https://jsonplaceholder.typicode.com`  
• **Response**: Array of post objects with `id`, `title`, `body`, `userId`

## How to Run

### Prerequisites

• Flutter SDK 3.9.2 or higher  
• Dart SDK 3.9.2 or higher

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd tecnical_task
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Test Credentials

• **Username**: `test`  
• **Password**: `12345`

## Design Patterns

• **BLoC Pattern**: Separation of business logic from UI  
• **Repository Pattern**: Abstraction layer for data sources  
• **Dependency Injection**: Using GetIt for loose coupling  
• **Clean Architecture**: Feature-based modular structure  
• **Singleton Pattern**: API service and shared preferences service  

## Error Handling

| Error Type | Location | Display |
|------------|----------|---------|
| Validation Error | LoginBloc | Form field error messages |
| Auth Error | LoginBloc | Toast message with "Invalid Credentials" |
| Network Error | ContentBloc | Error widget with Retry button |
| No Internet | NetworkBloc | Toast message with "No Internet Connection" |
| Empty Data | ContentBloc | Empty state layout |

## State Management

The app uses BLoC pattern with the following BLoCs:

• **LoginBloc**: Manages login form state, validation, and authentication  
• **ContentBloc**: Handles content fetching, retry logic, and logout  
• **NetworkBloc**: Monitors network connectivity status  

## SOLID Principles Applied

• **Single Responsibility**: Each class has one responsibility  
• **Open/Closed**: Repository pattern allows extension without modification  
• **Liskov Substitution**: Abstract repositories can be replaced with implementations  
• **Interface Segregation**: Small, focused interfaces  
• **Dependency Inversion**: Depend on abstractions, not concretions  

## Additional Features

• **Network Connectivity Monitoring**: Real-time network status checking  
• **Session Persistence**: Login state saved using SharedPreferences  
• **Shimmer Loading**: Beautiful loading animation for content cards  
• **Toast Notifications**: User-friendly error and success messages  
• **Responsive UI**: Material Design 3 theme with custom styling  
• **Error Recovery**: Retry functionality for failed network requests  
• **Empty States**: Proper handling of empty data scenarios  

## Screenshots

The app includes:

• Modern Material Design 3 theme  
• Loading indicators for async operations  
• Shimmer loading effects  
• Error states with retry functionality  
• Empty state handling  
• Clean and intuitive UI  
• Toast notifications for user feedback  

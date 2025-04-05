# Project Overview

This is a modular Flutter application using Clean Architecture. The project is divided into several key modules that handle different aspects of the app.

## Modules

### 1. `ts_app`
- **Purpose**: Entry point of the application. Configures routing, dependencies, and global state.
- **Features**: 
  - App setup, routing, and dependency injection.

### 2. `ts_core`
- **Purpose**: Core utilities and services used across the app.
- **Features**:
  - Base classes, error handling, common models, and helper functions.

### 3. `ts_core_ui`
- **Purpose**: Reusable UI components and design elements.
- **Features**:
  - Common UI components (buttons, input fields, etc.), themes, responsive design.

### 4. `ts_feature_auth`
- **Purpose**: Handles user authentication (login, registration).
- **Features**:
  - Authentication services, token management, user session handling.

### 5. `ts_network`
- **Purpose**: Manages all network requests and API calls.
- **Features**:
  - HTTP client setup, interceptors, response/error handling, API authentication.

### 6. `ts_storage`
- **Purpose**: Manages local data persistence (SharedPreferences, SQLite).
- **Features**:
  - Local data storage, caching, secure storage for sensitive data.

## Setup and Run

1. Clone the repo:
```bash
git clone <repository-url>
cd ts_app
```
2. Run project
```bash
flutter_run
```

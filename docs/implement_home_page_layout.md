# Flutter Prompt Library

This document provides **copy-paste ready prompts** for AI coding agents (Claude Code, Gemini CLI, flutter-dev agent)
to accelerate Flutter development while following **Clean Architecture** and **BLoC/MVVM** principles.

---

## Widget & UI Prompts

### 1. Create a Widget with BLoC State Management
```xml
<system>
You are the flutter-dev agent. Highly skilled in MVVM principals.
</system>

<user>
Context: We are developing a Flutter widget for a Pokemon app.  
Task: Create a `Home` widget that:

- Uses BLoC for state management (`HomeBloc`)
- Displays loading, error, and success states
- Shows a list of Pokemon Card
- Implement infinity scroll with limit per page 10
- Follows Material Design guidelines and app color scheme
- Is responsive and accessible

Project conventions:
- folder structure: lib/presentation/
- State management: BLoC
</user>
```

---

## Data Layer Prompts

### 2. Generate Repository + Data Layer
```xml
<user>
Context: I’m implementing the data layer for `Pokemon`.  
Task: Generate:

1. `PokemonModel` with:
    - JSON serialization
    - Entity mapping to `PokemonEntity`
2. `PokemonRemoteDataSource` (fetch via REST) with:
    - Endpoint: `/pokemon/{id}`
    - Error handling (ServerFailure)
    - Fetch return `PokemonModel` fromJson
3. `PokemonRepository` with:
   - Returns `PokemonEntity`

Requirements:
- Place files under lib/features/user_profile/data/
- Use dartz for Either
- Follow Clean Architecture layering
</user>
```

---

## Feature Development Prompts

### 3. Full Feature Scaffold (Data + Domain + Presentation)
```xml
<user>
Context: We are adding a `Home` feature.  
Task: Scaffold the feature following our project structure:

lib/
├── data/
│   ├── datasources/ (API + local)
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/

Generate:
- Entity: `PokemonEntity`
- Repository contract + implementation
- Use case: `GetPokemonListUseCase`
- BLoC: events (LoadPokemonListEvent), states (Loading, Loaded, Error), bloc logic
- UI: `LocationPage` with BlocBuilder
- Unit tests for bloc + widget tests for UI

Conventions:
- State management: BLoC
</user>
```

---

## Response API

### 4. Example Response
```json
{
    "id": 7,
    "name": "Squirtle",
    "height": 5,
    "weight": 90,
    "sprites": {
      "front_default" :  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
      "showdown" : {
        "front_default":  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/7.gif"
      }
    },
    "types": [
        {
          "slot": 1,
          "type": {
            "name": "water"
          }
        }
    ]
}
```

---

## Usage Notes

- Use these prompts directly in **Claude Code**, **Gemini CLI**, or the custom **flutter-dev agent**.
- Always adapt output to match your project’s conventions (folder structure, naming, state management choice).
- Keep this file in your project’s `/docs/` folder as a **living library**.

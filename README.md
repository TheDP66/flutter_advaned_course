[here](https://youtu.be/KbKRKG0gKkc?list=PLUvfjeBvMXmX0Z9MoKm5cZMAfGcoJdbXi)

## Setup project

- Create API config `lib\core\utils\constants.dart`
- Create data_state `lib\core\resourecs\data_state.dart`
- Create use_case `lib\core\usecase\use_case.dart`

## 1. Create new provider

`lib\features\feature_weather\data\data_source\remote\api_provider.dart`

## 2. Create new model

- Go to `https:\\javiercbk.github.io\json_to_dart\` to convert json response to dart
- Paste to `lib\features\feature_weather\data\models\CurrentCityModel.dart`

## 3. Create new entity

`lib\features\feature_weather\domain\entites\CurrentCityEntity.dart`

## 4. Create new repository

`lib\features\feature_weather\domain\repositories\weather_repository.dart`

## 5. Create new repository implement

`lib\features\feature_weather\data\repositories\weather_repository_impl.dart`

## 6. Create new use case

`lib\features\feature_weather\domain\use_cases\get_current_weather_usecase.dart`

## 7. Create presentation bloc

- Go to `lib\features\feature_weather\presentation\bloc\`
- Create these 3 (three) files `home_bloc.dart`, `home_event.dart`, and `home_state.dart`

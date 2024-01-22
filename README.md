[Video resume here](https://youtu.be/uwovUxmHaxQ?list=PLUvfjeBvMXmX0Z9MoKm5cZMAfGcoJdbXi)<br />
[Playlist here](https://www.youtube.com/playlist?list=PLUvfjeBvMXmX0Z9MoKm5cZMAfGcoJdbXi)

## Setup project

- Create API config `lib\core\utils\constants.dart`
- Create data_state `lib\core\resourecs\data_state.dart`
- Create use_case `lib\core\usecase\use_case.dart`

## 1. Create new provider

`lib\features\feature_weather\data\data_source\remote\api_provider.dart`

## 2. Create new model

- Go to `https:\\javiercbk.github.io\json_to_dart\` to convert json response to dart
- Paste to `lib\features\feature_weather\data\models\CurrentCityModel.dart`
- Cut two first section

## 3. Create new entity

- Create file `lib\features\feature_weather\domain\entites\CurrentCityEntity.dart`
- Paste and `extend Equatable`

## 4. Create new repository

`lib\features\feature_weather\domain\repositories\weather_repository.dart`

## 5. Create new repository implement

`lib\features\feature_weather\data\repositories\weather_repository_impl.dart`

## 6. Create new use case

`lib\features\feature_weather\domain\use_cases\get_current_weather_usecase.dart`

## 7. Create presentation bloc

- Go to `lib\features\feature_weather\presentation\bloc\`
- And create these 3 (three) files `home_bloc.dart`, `home_event.dart`, and `home_state.dart`
- Create fetch status file `cw_status.dart` (cw = current weather)

## 8. Create locator / injection

- Create and update `lib\locator.dart`
- Called `await setup();` in `lib\main.dart`

## 9. Call an event

- change `lib\core\widgets\main_wrapper.dart` to `statefull` widget
- write `BlocProvider.of<HomeBloc>(context).add(LoadCwEvent("Tehran"));` to call event
- listen to BlocBuilder api call, see in `main_wrapper.dart` body

## 10. Create screen

`lib\features\feature_weather\presentation\screens\home_screen.dart`

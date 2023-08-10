# nextapps-flutter-template

Nextapps Flutter demo app

## Folder structure

### lib/interface
This folder contains UI layer of the app. Only UI logic should be written in this folder.

### lib/providers
This folder should contain all the business logic of the app. Business logic should be written inside providers.
All Riverpod providers should go here.

### lib/repositories
Files that contain definitions of DAOs and repositories together with providers of those repositories.
The structure of each subfolder should be generated with Mason:

1. In VSCode right click on lib/repositories folder and select "Mason: Make local brick".
2. Choose repository.

If you want to have more than one model in a repository, you can generate new model by selecting **model** brick

For more info check instructions from Mason section of this README.

### lib/infrastructure
What should go here:
- External services configurations (Firebase, Google auth, etc)
- REST server config files

### lib/platform
What should go here:
- platform plugin configurations (device info, accelerometer, etc)

### lib/theme
All colors, sizes, fonts should be defined here.

### lib/utils
The place for keeping all the code that is usable across all application layers.

## VS Code settings

### "dart.lineLength": 1000,

Default 80 lines make using descriptive variable names very hard. Auto-wrapping is therefore disabled. To make code readable use:
#### Commas
Dart analyzer will help you adding commas where necessary.

#### End line comments
If lines are still too long or you want to split them use comment at the end of line for example:

```dart
final a = someLongTest == otherLongTest //
  ? true
  : false;
```
The comment will split remaining lines. This also works with method chaining:

```dart
someLongVariable //
.map()
.where()
.where();
```

## Using Mason

This template includes Mason templates. To use them install Mason and VSCode Mason extension.

### Installing

[link](https://pub.dev/packages/mason/install) [another link](https://github.com/felangel/mason/tree/master/packages/mason_cli#installation)

```sh
$ flutter pub add mason
$ dart pub global activate mason_cli
# in project folder
$ mason get
```

Hint: make sure you have Dart > 2.19 available in your console (it's different installation than in VSC!).

Install [Mason extension](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.mason)

### Usage

- Right click on a folder in Files view in VSC,
- Select "Mason: Make local brick",
- Pick one of installed bricks,
- Make sure you run build_runner and freezed files are generated [install this VS Code extension](https://marketplace.visualstudio.com/items?itemName=GaetSchwartz.build-runner),
- Edit files.

### Model brick

This brick creates a Freezed model.

### Repository brick

This brick creates a repository folder structure, repository file, default Freezed model, and a repository provider. Repository implements RepositoryInterface to make it easier to not forget to implement common operations on a resource.

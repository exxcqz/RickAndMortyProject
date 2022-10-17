# RickAndMorty

<p align="center">
        <img src="img/characters.png" width="300" height="650">
        <img src="img/locations.png" width="300" height="650">
        <img src="img/episodes.png" width="300" height="650">
        <img src="img/character.png" width="300" height="650">
        <img src="img/filter.png" width="300" height="650">
</p>

## How to build

1. Open `RickAndMorty.xcodeproj` in last Xcode version.
1. Press `Cmd+R` or select `Product > Run` in menu.

## Analyzing

1. Install [Swiftlint](https://github.com/realm/swiftlint):

    ```bash
    brew install swiftlint
    ```
  
1. Press `⌘+Shift+B` or select `Product > Analyze` in menu.

## Generate

Pull templates

```bash
generamba template install
```

### Module

```bash
./Scripts/generamba_script.sh module %Name%
```

### Service

```bash
./Scripts/generamba_script.sh service %Name%
```

### Component

```bash
./Scripts/generamba_script.sh component %Name%
```

```bash
./Scripts/generamba_script.sh component %ModuleName% %Name%
```

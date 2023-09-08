# CCMDesignSystem

Módulo responsável pela camada de Network.
Library utilizada: `CCMNetwork`

## Instalação

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/AlexandreBCardoso/CCMDesignSystem.git", .upToNextMajor(from: "1.0.0"))
]
```

## Como usar?
Instanciar a classe `ThemeRepository` passando as seguintes informações: uidFirebase e NetworkClient.
```swift
ThemeRepository(uidFirebase: String, network: NetworkClient)
```

Para obter uma lista de Theme, chamar:
```swift
ThemeRepository.fetchThemeList
```

Para obter um Theme específico, chamar:
```swift
ThemeRepository.fetchTheme(id)
```

Instanciar a classe `ThemeComponentRepository` passando as seguintes informações: uidFirebase e NetworkClient.
```swift
ThemeComponentRepository(uidFirebase: String, network: NetworkClient)
```

Para obter uma lista de ThemeComponent, informar o themeId:
```swift
ThemeComponentRepository.fetchThemeComponentList(themeId)
```

Para obter um ThemeComponent específico, informar o id:
```swift
ThemeComponentRepository.fetchThemeComponent(id)
```

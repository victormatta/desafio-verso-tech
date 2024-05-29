# PokeVerso

PokeVerso é um aplicativo Flutter que consome a API da PokéAPI para exibir informações sobre diferentes Pokémon. Este aplicativo inclui funcionalidades como favoritar Pokémon e exibir detalhes individuais de cada Pokémon.

## Funcionalidades

- Exibição de uma lista de Pokémon.
- Exibição de detalhes individuais de cada Pokémon.
- Favoritar e desfavoritar Pokémon.
- Tratamento de erros e feedback ao usuário.

## Tecnologias Utilizadas

- [Flutter](https://flutter.dev/)
- [Provider](https://pub.dev/packages/provider) para gerenciamento de estado.
- [CachedNetworkImage](https://pub.dev/packages/cached_network_image) para carregamento de imagens em cache.
- [PokéAPI](https://pokeapi.co/) para dados dos Pokémon.

## Como Executar o Projeto

### Pré-requisitos

- Flutter instalado na sua máquina. Você pode seguir o guia oficial de instalação do Flutter [aqui](https://flutter.dev/docs/get-started/install).
- Acesso à internet para consumir a API da PokéAPI.

### Passos para Execução

1. **Clone o repositório**

   ```sh
   git clone https://github.com/seu-usuario/poke_verso.git
   cd poke_verso

2. **Instale as dependências**

   ```sh
   flutter pub get

2. **Execute o aplicativo**

   ```sh
   flutter run

## **Estrutura do Projeto**

    poke_verso/
    │
    ├── lib/
    │   ├── components/
    │   │   └── poke_card.dart
    │   │   └── poke_details_widget.dart
    │   │   └── poke_grid_item.dart
    │   ├── exceptions/
    │   │   └── http_exception.dart
    │   ├── model/
    │   │   └── poke_model.dart
    │   ├── utils/
    │   │   └── routes.dart
    │   ├── view-model/
    │   │   └── poke_viewmodel.dart
    │   ├── view/
    │   │   └── poke_overview_page.dart
    │   │   └── poke_detail_page.dart
    │   └── main.dart
    │
    └── pubspec.yaml

## Contribuição

- Sinta-se à vontade para contribuir com este projeto. Você pode abrir uma issue ou enviar um pull request.

## Licença

- Este projeto está licenciado sob a Licença MIT. Veja o arquivo LICENSE para mais detalhes.
# Hielitos Gourmet

Hielitos Gourmet es una aplicación en Flutter diseñada para mostrar y gestionar un menú de sabores de hielitos artesanales. La aplicación cuenta con funcionalidades que permiten a los usuarios visualizar el menú, ajustar cantidades en inventario y modificar el menú. Diseñada idealmente para vendedores ambulantes, facilitando la distribución de su menu en base al inventario actual.

## Características

- **Ver Menú**: Muestra una lista de los sabores disponibles, separados en categorías de "Sabores Gourmet" y "Sabores Frutales". La interfaz se adapta al tamaño de la pantalla, mostrando el menú en un formato de columnas en dispositivos más grandes.
- **Modificar Menú**: Acceso a la pantalla de inventario, donde los usuarios pueden ajustar la cantidad de cada sabor disponible.
- **Compatibilidad con diferentes tamaños de pantalla**: La interfaz de usuario se adapta a distintos tamaños de pantalla para brindar una experiencia consistente en dispositivos móviles y tablets.
- **Interfaz intuitiva y diseño atractivo**: El diseño incluye gradientes de color, tipografía personalizada y componentes estilizados para mejorar la experiencia del usuario.

## Tecnologías utilizadas

- **Flutter**: Framework de desarrollo multiplataforma.
- **Dart**: Lenguaje de programación utilizado en Flutter.
- **Google Fonts**: Para incluir una fuente personalizada en la aplicación (Pacifico).
- **Diseño responsivo**: Se utilizó `MediaQuery` y `OrientationBuilder` para adaptar la interfaz a diferentes dispositivos.

## Estructura de Archivos

### `home.dart`

- **Descripción**: Pantalla principal de la aplicación, que permite a los usuarios visualizar el menú y acceder a la sección de modificación.
- **Funciones clave**:
  - `_verify()`: Verifica la cantidad de sabores seleccionados y ajusta la imagen del menú según el tamaño.
  - `_showMenu()`: Muestra un diálogo emergente con el menú, que incluye las categorías "Gourmet" y "Frutal".

### `upgrade.dart`

- **Descripción**: Pantalla de gestión de inventario que permite modificar las cantidades de cada sabor.
- **Funciones clave**:
  - `_listaBotones()`: Botones para navegar y para "Iniciar" o "Cerrar día".
  - `_tablaSabores()`: Genera tablas para las categorías "Gourmet" y "Frutal", con iconos que permiten incrementar o decrementar la cantidad de sabores.

## Instalación

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/AimLion/hielitos-gourmet.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd hielitos-gourmet
   ```
3. Clona este repositorio en tu máquina local:
   ```bash
   flutter pub get
   ```
4. Ya estará listo para ejecutar el proyecto, utiliza el siguiente comando:
   ```bash
   flutter run
   ```

## Personalización

Puedes agregar o modificar los sabores disponibles del menu actualizando las listas `items` y `itemsA` en el archivo `values.dart`.

## Créditos y Copyright

- Desarrollador: Manuel Segundo
- Framework: Flutter

© Copyright 2024 Manuel Segundo
Todos los derechos reservados. Este proyecto se muestra únicamente para fines de portafolio personal y está prohibida su redistribución, modificación o uso comercial sin el permiso expreso del autor.

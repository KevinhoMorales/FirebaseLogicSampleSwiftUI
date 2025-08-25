# FirebaseLogicSampleSwiftUI

Proyecto de ejemplo demostrando cómo estructurar una app SwiftUI con **Firebase Logic** —en este caso, autenticación (email/password) y mensajes generados por IA (Firebase AI Logic)— de forma clara, modular y escalable.

---

##  Características principales

- **MVVM limpio**: separación clara entre UI (`Views`), lógica (`ViewModel`) y lógica de negocio (`Services`).
- **Firebase Authentication**: login con email y contraseña usando un `AuthService`.
- **Firebase AI Logic**: mensaje de bienvenida generado dinámicamente con Gemini (AI) mediante `AIService`.
- **Manejo de estado UI**: `isLoading` para indicar carga, alertas para errores e interfaz Reactiva con SwiftUI.
- **Navegación condicional**: al autenticarse correctamente, redirige automáticamente al `HomeView` mostrando el mensaje generado por IA.

---

##  Tecnologías usadas

- SwiftUI (iOS)
- Combine / `ObservableObject`, `@Published`
- Firebase iOS SDK (`FirebaseAuth`, `FirebaseAI`, `FirebaseAppCheck` opcional)
- Arquitectura MVVM + Services/Repositories

---

##  Estructura del proyecto

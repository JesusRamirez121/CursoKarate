# API Karate — pruebas del servicio de mascotas

Pruebas de API con [Karate DSL](https://karatelabs.github.io/karate/) 1.5.0 + JUnit 5, sobre el servicio demo `pets-demo/`.

## Requisitos
- Java 17 o superior.
- Node.js 20 o superior (para el servicio demo).
- Gradle wrapper incluido (`./gradlew` o `gradlew.bat`).

## 1. Levantar el servicio demo

En una terminal aparte, desde la raíz del repositorio:

```bash
cd pets-demo
npm ci
node app.js
```

Verifica que responda en http://localhost:3001/ y que la documentación esté en http://localhost:3001/api-docs.

## 2. Ejecutar las pruebas

Desde esta carpeta:

```bash
./gradlew test            # Windows: gradlew.bat test
```

Se ejecutan dos runners:

| Runner | Feature | Escenarios |
|---|---|---|
| `AuthRunner` | `examples/feature/authentication.feature` | Basic auth y Bearer token |
| `TestRunner` | `examples/feature/pets.feature` | Crear, buscar, actualizar (PUT y PATCH), borrar y crear en lote (Scenario Outline) |

La URL base está en `src/test/resources/karate-config.js` (`http://localhost:3001`).

## 3. Reportes

- Karate: `build/karate-reports/karate-summary.html`
- JUnit XML: `build/test-results/test/`

## Notas
- Las pruebas crean y borran mascotas en el servicio demo. Si una ejecución se corta a mitad, pueden quedar mascotas de prueba en `pets-demo/pets.json`.
- La integración continua está en `.github/workflows/karate-test.yml` (raíz del repositorio): levanta el servicio demo y ejecuta `./gradlew test`.

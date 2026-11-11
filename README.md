# CursoKarate

Material del curso de automatización de API con Karate DSL.

| Carpeta | Contenido |
|---|---|
| `api-karate-test-automation/` | Proyecto Gradle con las pruebas Karate (features, runners y configuración). Ver su [README](api-karate-test-automation/README.md). |
| `pets-demo/` | Servicio Node/Express de mascotas que las pruebas consumen (puerto 3001). Ver [README](pets-demo/README.MD). |
| `PetsDemo.postman_collection.zip` | Colección de Postman incluida (no revisada en esta corrección). |
| `.github/workflows/karate-test.yml` | Integración continua: levanta `pets-demo` y ejecuta las pruebas Karate. |

## Inicio rápido

```bash
# 1. Servicio demo
cd pets-demo && npm ci && node app.js

# 2. Pruebas (en otra terminal)
cd api-karate-test-automation && ./gradlew test
```

En Windows usa `npm ci`, `node app.js` y `gradlew.bat test`.

# SearXNG Service (Listo Para Subir)

Esta carpeta esta preparada para desplegar SearXNG como servicio aparte (Render, Docker o Podman), y luego conectarlo con tu API `motorsrch`.

## 1) Deploy en Northflank / Fly / otros

Hay dos formas válidas (no mezcles contexto y Dockerfile):

| Plataforma | Root / working directory | Dockerfile |
|------------|--------------------------|------------|
| Raíz del repo | `/` o vacío | `/Dockerfile` |
| Solo carpeta `deploy-service` | `deploy-service` | `Dockerfile` (este directorio) |

- **Build context** debe incluir los archivos que copia el Dockerfile (si el contexto es casi vacío, revisa el directorio raíz del build).
- Variable de entorno: `SEARXNG_SECRET_KEY=<una_clave_larga_aleatoria>`
- Asegúrate de desplegar el **último commit** de `main` (no uno antiguo).

## 2) Deploy en Render (servicio aparte)

Usa estos valores al crear el servicio:

- Runtime: `Docker`
- Dockerfile Path: `Dockerfile` o `deploy-service/Dockerfile`
- Docker Build Context: `.`
- Health Check Path: `/`

Variables de entorno recomendadas:

- `SEARXNG_SECRET_KEY=<una_clave_larga_aleatoria>`

Cuando quede live, copia su URL:

- Ejemplo: `https://motor-searxng.onrender.com`

## 3) Conectar tu API MotorSRCH (servicio principal)

En el servicio `motorsrch` agrega:

- `ENABLE_SEARXNG=1`
- `SEARXNG_AS_PRIMARY=1`
- `SEARXNG_URL=https://motor-searxng.onrender.com`

Haz redeploy y prueba:

- `https://motorsrch.onrender.com/search?q=apple&limit=3`

## 4) Ejecutar local con Docker/Podman

Desde esta carpeta:

```bash
docker build -t motor-searxng -f Dockerfile ..
docker run --rm -p 8088:8080 -e SEARXNG_SECRET_KEY=dev-secret motor-searxng
```

o con Podman:

```bash
podman build -t motor-searxng -f Dockerfile ..
podman run --rm -p 8088:8080 -e SEARXNG_SECRET_KEY=dev-secret motor-searxng
```

Prueba JSON:

```bash
curl "http://localhost:8088/search?q=apple&format=json"
```

# SearXNG Service (Listo Para Subir)

Esta carpeta esta preparada para desplegar SearXNG como servicio aparte (Render, Docker o Podman), y luego conectarlo con tu API `motorsrch`.

## 1) Deploy en Northflank / Fly / otros

- **Build context:** `/` (raíz del repo)
- **Dockerfile:** `/Dockerfile` (también existe `deploy-service/Dockerfile` con el mismo contenido relativo a esa carpeta)

Variable de entorno:

- `SEARXNG_SECRET_KEY=<una_clave_larga_aleatoria>`

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

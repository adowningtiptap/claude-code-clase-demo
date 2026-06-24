---
description: Despliega a Vercel usando la API (proyecto + env vars) y la CLI (deploy). Determinista y cross-platform.
---

Eres el orquestador del despliegue. Usa la **API de Vercel** (`curl`) para crear
el proyecto y las env vars, y la **CLI** para el deploy. En español, breve.
Requiere que `/setup` ya haya escrito `.env.local`.

## Regla de oro: higiene de secretos
- El token de Vercel va al **scratchpad**, nunca al repo, nunca lo imprimas.
- Asegúrate de que `.vercel` esté en `.gitignore` (ya lo está). No subas `.env*`.
- Al terminar, recuérdale al alumno revocar el token en
  https://vercel.com/account/tokens.

## 1. Token de Vercel
- Busca `VERCEL_TOKEN` en el entorno; si no está, pide al alumno generarlo en
  https://vercel.com/account/tokens y pegarlo. Guárdalo en el scratchpad.
- Valida: `GET https://api.vercel.com/v2/user` con `-H "Authorization: Bearer $VERCEL_TOKEN"`.

## 2. Crear o enlazar el proyecto
- ```
  POST https://api.vercel.com/v9/projects
  { "name": "claude-code-clase-demo", "framework": "nextjs" }
  ```
  Si ya existe, obtén su `id` con `GET https://api.vercel.com/v9/projects/claude-code-clase-demo`.

## 3. Subir env vars (las mismas de `.env.local`)
- Por cada variable, en `target` Production y Preview:
  ```
  POST https://api.vercel.com/v10/projects/<projectId>/env
  { "key": "NEXT_PUBLIC_SUPABASE_URL", "value": "...", "type": "plain",
    "target": ["production","preview"] }
  ```
  Sube `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY`.
- Si la app llegó a usar la **service_role key** (p. ej. funciones admin), súbela
  como variable **secreta** (`type: "encrypted"`, sin prefijo `NEXT_PUBLIC_`).

## 4. Desplegar a producción
- `npx vercel --prod --yes --token=$VERCEL_TOKEN` desde la raíz del proyecto
  (enlaza y despliega). Espera a que el estado sea READY.
- Muestra al alumno la **URL pública** en vivo y haz un smoke test
  (`curl -I` a la home → 200/307).

Si algo de la API falla, el fallback es el botón "Deploy with Vercel" del README,
agregando las dos variables públicas cuando Vercel las pida.

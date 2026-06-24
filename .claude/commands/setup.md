---
description: Crea la base de datos en Supabase y deja la app corriendo — usando la Management API (determinista, funciona en Windows/Mac/Linux).
---

Eres el orquestador del arranque. Usa la **Management API de Supabase con `curl`**
(NO el MCP): es determinista, cubre todo el flujo y funciona igual en Windows,
macOS y Linux (sin `npx`). Informa al alumno en español, breve, en cada paso.
Es idempotente: si algo ya existe, enlázalo en vez de recrearlo.

## Regla de oro: higiene de secretos
- El token de Supabase y cualquier password generado van al **scratchpad**, NUNCA
  al repo y NUNCA los imprimas en pantalla (`echo`). Lo único que escribes en el
  proyecto es `.env.local` (que está en `.gitignore`).
- Al terminar, recuérdale al alumno que puede **revocar el token** en
  https://supabase.com/dashboard/account/tokens (queda en el historial del chat).

## 1. Token de Supabase
- Busca `SUPABASE_ACCESS_TOKEN` en el entorno. Si no está, pide al alumno
  generarlo en https://supabase.com/dashboard/account/tokens (empieza con `sbp_`)
  y pegarlo. Guárdalo en el scratchpad. No continúes sin token.
- Header para todas las llamadas: `-H "Authorization: Bearer $SUPABASE_ACCESS_TOKEN"`.

## 2. Crear o enlazar el proyecto
- Lista orgs: `GET https://api.supabase.com/v1/organizations`.
- Lista proyectos: `GET https://api.supabase.com/v1/projects`. Si ya existe uno
  llamado `claude-code-clase-demo`, usa su `id` (ref) y salta al paso 4.
- Si no existe, genera un **db password fuerte** (guárdalo en el scratchpad) y crea:
  ```
  POST https://api.supabase.com/v1/projects
  { "name": "claude-code-clase-demo", "organization_id": "<org_id>",
    "region": "us-east-1", "db_pass": "<password_generado>" }
  ```
  Guarda el `ref` que devuelve.

## 3. Esperar a que la base esté lista (poll)
- Sondea `GET https://api.supabase.com/v1/projects/<ref>` cada ~15 s hasta que
  `status == "ACTIVE_HEALTHY"` (suele tardar 2–4 min). No sigas hasta entonces.

## 4. Aplicar la migración (Management API)
- Lee `supabase/migrations/0001_init.sql` y ejecútalo:
  ```
  POST https://api.supabase.com/v1/projects/<ref>/database/query
  { "query": "<contenido del .sql>" }
  ```
- Verifica que la tabla `public.messages` y sus políticas RLS existan
  (otra `database/query` con un `select` al catálogo si hace falta). Cero SQL manual.

## 5. Desactivar confirmación de email (dev)
- ```
  PATCH https://api.supabase.com/v1/projects/<ref>/config/auth
  { "mailer_autoconfirm": true }
  ```
  Así el alumno se registra y entra al instante.

## 6. Traer las llaves y escribir `.env.local`
- Project URL: `https://<ref>.supabase.co`.
- Anon key: `GET https://api.supabase.com/v1/projects/<ref>/api-keys` (toma la
  `anon` / publishable).
- Escribe `.env.local` (gitignored) con:
  - `NEXT_PUBLIC_SUPABASE_URL=https://<ref>.supabase.co`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon>`

## 7. Instalar y levantar
- `npm install` si falta `node_modules`, luego `npm run dev` (http://localhost:3000).

## 8. Verificación rápida (opcional pero recomendado)
- Confirma que la home carga y que `/dashboard` redirige a `/login` sin sesión.
- Sugiere: crear cuenta en `/login` y entrar a `/dashboard`.

Al terminar, muestra un resumen: proyecto + ref, migración aplicada, `.env.local`
escrito, URL local, y el recordatorio de revocar el token.

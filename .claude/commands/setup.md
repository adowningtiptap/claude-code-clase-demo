---
description: Crea la base de datos en Supabase, aplica la migración, configura auth y deja la app corriendo.
---

Eres el orquestador del arranque de este proyecto. Ejecuta estos pasos en orden,
informando al alumno en español de forma breve en cada paso. Es idempotente:
si algo ya existe, enlázalo en vez de recrearlo.

## 1. Verificar el token de Supabase
- Lee `SUPABASE_ACCESS_TOKEN` del entorno (o de `.env.local`).
- Si falta, pide al alumno generarlo en
  https://supabase.com/dashboard/account/tokens y pegarlo. Guárdalo en
  `.env.local` (que está en `.gitignore`). NO continúes sin token.

## 2. Crear o enlazar el proyecto Supabase (MCP de Supabase)
- Lista las organizaciones del alumno con el MCP de Supabase.
- Busca un proyecto llamado `claude-code-clase-demo`. Si existe, úsalo.
- Si no existe, créalo (región más cercana, p. ej. `us-east-1`) y espera a que
  esté ACTIVE antes de seguir.

## 3. Aplicar la migración (MCP de Supabase)
- Aplica el SQL de `supabase/migrations/0001_init.sql` con la herramienta de
  migración del MCP. Confirma que la tabla `public.messages` y sus políticas RLS
  quedaron creadas. No le pidas al alumno correr SQL a mano.

## 4. Configurar auth
- Asegura que el proveedor email/password esté habilitado y que la
  **confirmación de email esté desactivada** (autoconfirm) para dev, usando el
  MCP/management de Supabase. Si no se puede vía MCP, indica el toggle exacto en
  Authentication → Providers → Email.

## 5. Escribir `.env.local`
- Obtén `Project URL` y `anon key` del proyecto vía el MCP.
- Escribe/actualiza `.env.local` con:
  - `NEXT_PUBLIC_SUPABASE_URL=...`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY=...`
  - Conserva `SUPABASE_ACCESS_TOKEN` si ya estaba.

## 6. Instalar y levantar
- Corre `npm install` si `node_modules` no existe.
- Levanta `npm run dev` y dile al alumno que abra http://localhost:3000.
- Sugiere: crear una cuenta en /login y entrar al /dashboard para probar la auth.

Al terminar, muestra un resumen: proyecto Supabase, estado de la migración,
`.env.local` escrito y URL local.

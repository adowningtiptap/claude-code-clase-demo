# Contexto del proyecto (para Claude Code)

Proyecto de **clase / demo**. Stack: **Next.js 16** (App Router, TS) +
**Supabase** (DB + Auth) + **Vercel**.

## ⚡ Onboarding automático (LEER PRIMERO)

Si acabas de clonar/abrir este repo y **NO existe `.env.local`** (o falta
`NEXT_PUBLIC_SUPABASE_URL`), el proyecto aún no está configurado. En ese caso,
**ejecuta el flujo del comando `/setup`** (ver `.claude/commands/setup.md`) para
crear la base de datos en Supabase, aplicar la migración, configurar la auth y
escribir `.env.local`. No le pidas al alumno correr SQL ni copiar llaves a mano.

Para desplegar, usa el flujo de `/deploy` (`.claude/commands/deploy.md`).

## Aprovisionamiento (API, no MCP)

- `/setup` y `/deploy` usan la **Management API de Supabase** y la **API/CLI de
  Vercel** con tokens (`curl`). Es el camino determinista que cubre todo el flujo
  y funciona igual en Windows, macOS, Linux y Codespaces (sin `npx`).
- **Higiene de secretos:** tokens y passwords van al **scratchpad**, nunca al
  repo y nunca a pantalla. Lo único que se escribe en el proyecto es `.env.local`
  (gitignored). Recuérdale al alumno revocar los tokens al terminar.
- `.mcp.json` deja los MCP HTTP de Supabase/Vercel (OAuth) disponibles como
  **conveniencia opcional** para explorar la DB en clase ("muéstrame mis tablas"),
  pero el provisioning lo hace la API.

## Convenciones

- `lib/supabase/server.ts` → Server Components / Route Handlers / Server Actions.
- `lib/supabase/client.ts` → componentes con `"use client"`.
- `lib/supabase/middleware.ts` + `proxy.ts` → refrescan sesión y protegen
  rutas que empiezan con `/dashboard` (convención `proxy` de Next 16).
- Auth: **email + contraseña**, confirmación de email desactivada en dev.
- Variables en `.env.local` (nunca commitear). Las escribe `/setup`.
- Esquema en `supabase/migrations/`.

## Tablas

- `messages` — mensajes demo. Lectura pública; escritura solo del dueño
  (`user_id = auth.uid()`) vía RLS.

## Cómo correr (si ya está configurado)

```bash
npm install
npm run dev   # http://localhost:3000
```

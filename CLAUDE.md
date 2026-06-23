# Contexto del proyecto (para Claude Code)

Este es un proyecto de **clase / demo**. Stack:

- **Next.js 15** (App Router, TypeScript)
- **Supabase** como base de datos (Postgres) — clientes en `lib/supabase/`
- **Vercel** para el deploy

## Convenciones

- Usa `lib/supabase/server.ts` en Server Components / Route Handlers.
- Usa `lib/supabase/client.ts` en componentes con `"use client"`.
- Las variables de entorno van en `.env.local` (nunca commitear). Ver `.env.example`.
- El esquema de la base vive en `supabase/migrations/`.

## Cómo correr

```bash
npm install
npm run dev        # http://localhost:3000
```

## Tablas

- `messages` — lista de mensajes demo (solo lectura pública vía RLS).

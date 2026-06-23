# Claude Code · Clase Demo

Kit de arranque autónomo: **Next.js 16 + Supabase (DB + Auth) + Vercel**.
Con Claude Code instalado, pegas el link del repo y el agente arma toda la base
del proyecto por ti. Sin SQL manual, sin copiar llaves a mano.

---

## 🚀 La forma fácil (un solo prompt)

1. Instala Claude Code:

   ```bash
   curl -fsSL https://claude.ai/install.sh | bash    # Mac/Linux
   # irm https://claude.ai/install.ps1 | iex          # Windows (PowerShell)
   ```

2. En una carpeta vacía, corre `claude` y pega este prompt:

   > Clona y configura este proyecto: https://github.com/adowningtiptap/claude-code-clase-demo

3. Claude clona el repo, lee `CLAUDE.md` y arranca el `/setup` solo. Te pedirá
   **una sola cosa**: tu *Access Token* de Supabase
   (genéralo en https://supabase.com/dashboard/account/tokens y pégalo).

4. Listo: Claude crea la base de datos, corre la migración, configura la auth,
   escribe `.env.local` y levanta la app en http://localhost:3000.

5. Para publicar, dile a Claude **"despliega"** (comando `/deploy`): hará el
   deploy en Vercel (un OAuth de un clic) y te dará la URL en vivo.

---

## 💻 En GitHub Codespaces (cero instalación)

Abre el repo en Codespaces (botón **Code → Codespaces**). Node, git y Claude Code
ya vienen listos. Luego corre `claude` y escribe `/setup`.

---

## 🛠️ Comandos del kit

- `/setup` — crea la DB en Supabase, corre la migración, configura auth y escribe
  `.env.local`.
- `/deploy` — despliega a Vercel (crea proyecto, sube env vars, publica).

## 🤖 Ideas para la clase (pídeselas a Claude Code)

- "Agrega un formulario para insertar un mensaje nuevo (ligado a mi usuario)."
- "Crea una tabla `tareas` y una página `/tareas` protegida que la liste."
- "Cambia el diseño de la página de inicio."

## 📁 Estructura

```
app/                  # Next.js App Router (home, login, dashboard protegido)
lib/supabase/         # clientes Supabase (server, browser, middleware)
middleware.ts         # refresca sesión y protege rutas
supabase/migrations/  # esquema SQL (lo aplica /setup automáticamente)
.claude/commands/     # comandos /setup y /deploy
.mcp.json             # MCP de Supabase y Vercel
.devcontainer/        # entorno Codespaces (cero instalación)
CLAUDE.md             # contexto + onboarding automático
```

## 🚀 Fallback: deploy manual con botón

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fadowningtiptap%2Fclaude-code-clase-demo&env=NEXT_PUBLIC_SUPABASE_URL,NEXT_PUBLIC_SUPABASE_ANON_KEY)

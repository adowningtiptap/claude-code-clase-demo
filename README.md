# Claude Code · Clase Demo

Starter **Next.js 15 + Supabase**, listo para desplegar en **Vercel**. Pensado
para una clase de Claude Code: clonas, configuras 2 llaves, y arrancas.

La página de inicio lee una lista de mensajes **en vivo desde Supabase**.

---

## 🚀 Deploy en 1 clic (Vercel)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fadowningtiptap%2Fclaude-code-clase-demo&env=NEXT_PUBLIC_SUPABASE_URL,NEXT_PUBLIC_SUPABASE_ANON_KEY&envDescription=Llaves%20de%20tu%20proyecto%20Supabase%20(Project%20Settings%20%E2%86%92%20API))

Vercel te pedirá las dos variables de Supabase durante el deploy.

---

## 🧑‍💻 Correr localmente

Requisitos: **Node 20+** y **git**.

```bash
git clone https://github.com/adowningtiptap/claude-code-clase-demo.git
cd claude-code-clase-demo
npm install
cp .env.example .env.local   # rellena tus llaves de Supabase
npm run dev                  # http://localhost:3000
```

---

## 🗄️ Configurar Supabase (una vez)

1. Crea un proyecto en [supabase.com](https://supabase.com).
2. **SQL Editor** → pega y ejecuta el contenido de
   [`supabase/migrations/0001_init.sql`](supabase/migrations/0001_init.sql).
   (Crea la tabla `messages` con datos de ejemplo.)
3. **Project Settings → API** → copia:
   - `Project URL` → `NEXT_PUBLIC_SUPABASE_URL`
   - `anon` `public` key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
4. Pega esas dos en tu `.env.local` (local) y en
   **Vercel → Project Settings → Environment Variables** (producción).

---

## 🤖 Usar con Claude Code

```bash
# Instalar Claude Code (binario nativo, sin Node):
curl -fsSL https://claude.ai/install.sh | bash    # Mac/Linux
# irm https://claude.ai/install.ps1 | iex          # Windows (PowerShell)

cd claude-code-clase-demo
claude
```

Ideas para la clase, pídeselas a Claude Code:

- "Agrega un formulario para insertar un mensaje nuevo en Supabase."
- "Crea una tabla `tareas` y una página `/tareas` que la liste."
- "Cambia el diseño de la página de inicio."

El archivo [`CLAUDE.md`](CLAUDE.md) le da contexto del proyecto a Claude Code.

---

## 📁 Estructura

```
app/                  # Next.js App Router (página + estilos)
lib/supabase/         # clientes de Supabase (server + browser)
supabase/migrations/  # esquema SQL de la base
.env.example          # plantilla de variables de entorno
vercel.json           # config de Vercel
CLAUDE.md             # contexto del proyecto para Claude Code
```

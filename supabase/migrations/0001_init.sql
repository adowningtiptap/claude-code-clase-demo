-- Tabla demo para la clase: una lista de mensajes pública de solo lectura.
-- Copia/pega este SQL en el SQL Editor de Supabase, o aplícalo con la CLI.

create table if not exists public.messages (
  id          bigint generated always as identity primary key,
  content     text not null,
  created_at  timestamptz not null default now()
);

-- Activamos Row Level Security (buena práctica en Supabase).
alter table public.messages enable row level security;

-- Política: cualquiera puede LEER los mensajes (demo pública).
create policy "messages_select_public"
  on public.messages
  for select
  using (true);

-- Datos de ejemplo para que la página no aparezca vacía.
insert into public.messages (content) values
  ('¡Hola desde Supabase! 👋'),
  ('Este mensaje vino de la base de datos.'),
  ('Edita este proyecto con Claude Code y vuelve a desplegarlo.');

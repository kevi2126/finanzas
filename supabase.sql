-- Pega esto en Supabase → SQL Editor → New query → Run (solo una vez).
-- Crea una tabla privada: nadie puede leerla directo, solo con tu código secreto.
create table if not exists public.finanzas_sync (
  code text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.finanzas_sync enable row level security;
-- (sin políticas: el acceso directo a la tabla queda bloqueado)

create or replace function public.get_state(p_code text) returns jsonb
language sql security definer set search_path = public as $$
  select data from public.finanzas_sync where code = p_code and length(p_code) >= 24;
$$;

create or replace function public.put_state(p_code text, p_data jsonb) returns void
language plpgsql security definer set search_path = public as $$
begin
  if length(p_code) < 24 then raise exception 'codigo invalido'; end if;
  insert into public.finanzas_sync(code, data, updated_at) values (p_code, p_data, now())
  on conflict (code) do update set data = excluded.data, updated_at = now();
end $$;

revoke all on function public.get_state(text) from public;
revoke all on function public.put_state(text, jsonb) from public;
grant execute on function public.get_state(text) to anon, authenticated;
grant execute on function public.put_state(text, jsonb) to anon, authenticated;

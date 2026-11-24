-- ============================================================================
-- SCRIPT DE CONFIGURACIÓN SUPABASE: LEADS CAR AUDIO & LUCES BI-LED BOGOTÁ
-- ============================================================================

-- 1. Crear la tabla principal de leads
create table if not exists public.leads_car_audio (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  nombre text not null,
  whatsapp text not null,
  correo text not null,
  vehiculo_interes text,
  utm_source text default 'organico_bogota',
  origen_url text
);

-- Asegurar columna origen_url si la tabla ya fue creada previamente con el esquema básico
alter table public.leads_car_audio add column if not exists origen_url text;
alter table public.leads_car_audio add column if not exists utm_source text default 'organico_bogota';

-- 2. Índices de rendimiento para consultas comerciales y filtrado por fecha/WhatsApp
create index if not exists idx_leads_car_audio_created_at
  on public.leads_car_audio (created_at desc);

create index if not exists idx_leads_car_audio_whatsapp
  on public.leads_car_audio (whatsapp);

-- 3. Habilitar seguridad a nivel de fila (Row Level Security - RLS)
alter table public.leads_car_audio enable row level security;

-- 4. Política RLS: Permitir inserción pública desde el formulario / Cloudflare Pages Function
drop policy if exists "Permitir insercion publica de leads" on public.leads_car_audio;
create policy "Permitir insercion publica de leads"
  on public.leads_car_audio
  for insert
  to anon, authenticated
  with check (true);

-- 5. Política RLS: Lectura restringida exclusivamente a usuarios autenticados / service_role
drop policy if exists "Lectura exclusiva para administradores autenticados" on public.leads_car_audio;
create policy "Lectura exclusiva para administradores autenticados"
  on public.leads_car_audio
  for select
  to authenticated
  using (true);

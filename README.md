# 🚗 Funnel "Sin Salida" (Squeeze Page) — Pantallas CarPlay/Android Auto & Luces Bi-LED Bogotá

Aplicación web de alta conversión (**CRO**) y **SEO Técnico Local para Bogotá**, diseñada bajo arquitectura de **Cero Fugas (Gated Funnel)** y lista para desplegar en **Cloudflare Pages + Cloudflare Pages Functions (`/functions/api/lead.js`) + Supabase + Resend**.

---

## 📁 Estructura del Proyecto

- `index.html` — Squeeze Page con SEO Técnico Local (JSON-LD `AutoRepair`, `LocalBusiness`, `Product` con `AggregateRating`, `FAQPage`), Hero Above-the-Fold, Anatomía Exacta de las 5 piezas, Selector de Compatibilidad por Marca/Modelo en Bogotá, Comparadores Antes/Después, Combos de Precios y Acordeón SEO.
- `src/main.js` — Lógica interactiva de pestañas por marca, sliders comparadores Antes/Después, validación accesible post-interacción (`:user-invalid` + ARIA sync) y envío asíncrono al endpoint serverless con redirección automática a WhatsApp en 2 segundos.
- `src/style.css` — Estilos Tailwind CSS + reglas modernas de accesibilidad y animaciones nativas.
- `public/images/` — Ilustraciones técnicas de alta resolución para cada componente del kit (`hero-qled-biled-bogota.svg`, `pantalla-qled-carplay.svg`, `bisel-oem-medida.svg`, `arnes-plug-and-play-canbus.svg`, `camara-reversa-ahd-170.svg`, `kit-bi-led-corte-perfecto.svg`, y comparativas Antes/Después).
- `functions/api/lead.js` — Endpoint Serverless de **Cloudflare Pages Functions** (`POST /api/lead`) que:
  1. Valida los datos del cliente (`nombre`, `whatsapp` colombiano de 10 dígitos iniciando en `3`, `correo`, `vehiculo_interes`).
  2. Inserta el registro en la tabla `public.leads_car_audio` de **Supabase**.
  3. Dispara notificación inmediata por correo HTML a **`jordancamiloparra@gmail.com`** vía **Resend API** con botón directo para abrir chat en WhatsApp (`https://wa.me/57[whatsapp]`).
- `supabase_setup.sql` — Script SQL completo para crear la tabla `public.leads_car_audio`, índices y políticas RLS.
- `wrangler.toml` & `.dev.vars.example` — Configuración lista para Cloudflare Pages.

---

## 🚀 Pasos de Configuración y Despliegue

### 1. Configurar la Base de Datos en Supabase
1. Abre el **SQL Editor** de tu proyecto en Supabase.
2. Copia y ejecuta el contenido de [`supabase_setup.sql`](./supabase_setup.sql).

### 2. Configurar Variables de Entorno Locales
Crea un archivo `.dev.vars` en la raíz copiando `.dev.vars.example`:

```bash
cp .dev.vars.example .dev.vars
```

Completa tus credenciales reales:
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY` (o `SUPABASE_SERVICE_ROLE_KEY`)
- `RESEND_API_KEY`
- `NOTIFICATION_EMAIL="jordancamiloparra@gmail.com"`
- `COMMERCIAL_WHATSAPP="573100000000"` (tu número comercial de WhatsApp donde aterrizará el cliente tras registrarse)

### 3. Compilar y Probar Localmente
```bash
npm install
npm run build
npx wrangler pages dev dist
```

### 4. Desplegar en Cloudflare Pages
Para subir el proyecto directamente a Cloudflare Pages:

```bash
npm run build
npx wrangler pages deploy dist --project-name=car-audio-bogota
```

Configura las variables secretas en producción desde tu terminal o en el Dashboard de Cloudflare Pages (*Settings → Environment Variables*):

```bash
npx wrangler pages secret put SUPABASE_URL --project-name=car-audio-bogota
npx wrangler pages secret put SUPABASE_ANON_KEY --project-name=car-audio-bogota
npx wrangler pages secret put RESEND_API_KEY --project-name=car-audio-bogota
```

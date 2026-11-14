# Mis Finanzas Ruta (app para iPhone y Android)

App web instalable (PWA). Para tenerla en el celular necesita estar publicada en una dirección https.
Los archivos publicados solo tienen el calendario de pagos (sin tu nombre ni número de contrato). Tus registros se guardan en el celular y, si activas la sincronización, en tu propia base de datos de Supabase.

## 1. Publicarla gratis (elige una)
- **Netlify Drop**: https://app.netlify.com/drop → crea cuenta gratis y arrastra la carpeta `app-finanzas-auto`. Te da un link `https://algo.netlify.app`.
- **GitHub Pages**: sube esta carpeta a un repositorio y activa Pages en Settings → Pages.

## 2. Instalarla
- **iPhone**: abre el link en **Safari** → Compartir → "Agregar a pantalla de inicio".
- **Android**: abre el link en **Chrome** → ⋮ → "Instalar app".
- Usa siempre el ícono instalado: en iPhone, Safari y el ícono guardan datos por separado.

## 3. Sincronizar iPhone + Android (opcional, recomendado)
1. Crea cuenta gratis en https://supabase.com y un proyecto nuevo.
2. SQL Editor → pega el contenido de `supabase.sql` (o usa el botón "Copiar código SQL" de la app) → Run.
3. Project Settings → API: copia **Project URL** y la clave **anon / publishable**.
4. En el primer celular: Inicio → Ajustes → pega URL y clave → "Activar".
5. Toca "Copiar clave para mi otro celular", mándatela (ej. WhatsApp a ti mismo) y pégala en el otro celular → "Unir este celular".

Se sincroniza al abrir la app, tras cada cambio y cada minuto. Sin internet guarda en el celular y sube después.
Nota: Supabase pausa proyectos gratis tras ~7 días sin uso; si pasa, entra a supabase.com y dale "Restore".

## Recordatorios
Pestaña **Auto** → "Agregar a mi calendario": mensualidades, TDC (con día de pago) y pagos fijos con alarmas.

## Respaldo
Ajustes → "Descargar respaldo" de vez en cuando.

## Probar en la computadora
```
python -m http.server 8765 --directory app-finanzas-auto
```
y abre http://localhost:8765

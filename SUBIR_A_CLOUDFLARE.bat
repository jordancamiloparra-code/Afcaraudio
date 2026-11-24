@echo off
title Despliegue Permanente en Cloudflare - AF Lujos Automotrices
color 0B
cd /d "%~dp0"

echo ============================================================================
echo   ACTUALIZANDO PAGINA EN CLOUDFLARE (CON DISEÑO, CSS E IMAGENES)
echo   Cuenta ID: a5cb69e42d7f52beaa0e8cad4eb8f837
echo ============================================================================
echo.

set CLOUDFLARE_ACCOUNT_ID=a5cb69e42d7f52beaa0e8cad4eb8f837

echo 1. Compilando version final de produccion (dist)...
call npm run build

echo.
echo 2. Iniciando sesion en tu cuenta de Cloudflare (si aun no has autorizado)...
call npx.cmd wrangler login

echo.
echo 3. Actualizando tu proyecto actual 'long-heart-426d.jordancamiloparra.workers.dev' con todos los estilos e imagenes...
call npx.cmd wrangler deploy --assets=./dist --name=long-heart-426d --compatibility-date=2024-11-01

echo.
echo 4. Subiendo tambien a Cloudflare Pages ('af-lujos-automotrices.pages.dev')...
call npx.cmd wrangler pages project create af-lujos-automotrices --production-branch=main
call npx.cmd wrangler pages deploy dist --project-name=af-lujos-automotrices

echo.
echo ============================================================================
echo   LISTO! Recarga https://long-heart-426d.jordancamiloparra.workers.dev
echo ============================================================================
pause

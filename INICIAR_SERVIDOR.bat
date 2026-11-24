@echo off
title Servidor AF Lujos Automotrices (Local + Enlace Publico Cloudflare)
color 0A
cd /d "%~dp0"

echo ============================================================================
echo   INICIANDO SERVIDOR AF LUJOS AUTOMOTRICES
echo   1. Servidor Local: http://localhost:3000
echo   2. Generando enlace publico en Cloudflare (espera 5 segundos)...
echo ============================================================================
echo.

:: Iniciar servidor local Vite en segundo plano si no esta corriendo
start "Vite Local Server - AF Lujos" /min cmd /c "npm run dev"

:: Esperar 3 segundos a que el puerto 3000 este listo
timeout /t 3 /nobreak >nul

echo Conectando con Cloudflare Tunnel...
echo Copia el enlace que termina en .trycloudflare.com que aparecera en el recuadro:
echo.
npx.cmd -y cloudflared tunnel --url http://localhost:3000
pause

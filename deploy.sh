#!/bin/bash

echo "🚀 Iniciando despliegue de Consitech..."

# Verificar que estamos en el directorio correcto
if [ ! -f "package.json" ]; then
    echo "❌ Error: No estás en el directorio del proyecto (no se encuentra package.json)"
    exit 1
fi

echo "📦 Construyendo el proyecto..."
yarn build

if [ $? -eq 0 ]; then
    echo "✅ Build completado exitosamente"
else
    echo "❌ Error durante el build"
    exit 1
fi

echo "🔄 Reiniciando PM2..."
pm2 restart consitech-react

if [ $? -eq 0 ]; then
    echo "✅ PM2 reiniciado exitosamente"
else
    echo "❌ Error al reiniciar PM2"
    exit 1
fi

echo "🎉 ¡Despliegue completado!"
echo "📱 Puedes verificar el sitio en: https://consitech.com.ar"

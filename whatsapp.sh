# 1. Nos aseguramos de estar en el directorio correcto
cd /var/www/consitech.com.ar

# 2. Guardamos una copia de seguridad del package.json actual
cp package.json package.json.backup

# 3. Eliminamos los módulos y archivos de bloqueo
rm -rf node_modules
rm -rf package-lock.json

# 4. Limpiamos la caché de npm
npm cache clean --force

# 5. Instalamos solo las dependencias necesarias para Puppeteer
sudo apt-get update
sudo apt-get install -y \
    libgbm-dev \
    libasound2 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    xdg-utils \
    wget

# 6. Instalamos las dependencias una por una en orden específico
npm install --save react@^18.2.0
npm install --save react-dom@^18.2.0
npm install --save react-scripts@5.0.1
npm install --save express@^4.18.2
npm install --save cors@^2.8.5
npm install --save dotenv@^16.3.1
npm install --save socket.io@^4.7.2
npm install --save qrcode@^1.5.3
npm install --save whatsapp-web.js@^1.23.0

# 7. Reconstruimos los módulos de node
npm rebuild

# 8. Verificamos la instalación
npm ls --depth=0

# Usa la imagen base de Node.js
FROM node:20
# Establece el directorio de trabajo en el contenedor
WORKDIR /usr/src/app
# Copia los archivos de configuración del proyecto
COPY package*.json ./
# Instala las dependencias
RUN npm install
# Copia el resto de los archivos del proyecto
COPY . .
# Construye la aplicación
RUN npm run build
# Usa una imagen de servidor web para servir la aplicación construida
FROM nginx:alpine
# Copia los archivos construidos al directorio de Nginx
COPY --from=0 /usr/src/app/dist /usr/share/nginx/html
# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 80
# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
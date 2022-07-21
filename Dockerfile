FROM node:alpine AS lothyriel-homepage
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM nginx:alpine
COPY --from=lothyriel-homepage /app/dist/lothyriel-homepage /usr/share/nginx/html
EXPOSE 80
FROM node:18 AS build
WORKDIR /app
COPY backend/package*.json ./
RUN npm install
COPY backend .

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
CMD ["node", "server.js"]

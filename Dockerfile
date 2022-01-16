FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# result of build will be in /app/build, nothing else is needed

# to start new stage, just write FROM again:
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
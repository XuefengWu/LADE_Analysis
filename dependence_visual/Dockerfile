# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM tiangolo/node-frontend:10 as build-stage

WORKDIR /app

RUN npm install yarn --registry http://registry.cnpmjs.org

COPY package*.json /app/

RUN rm package-lock.json
RUN ls

RUN npm config set registry https://registry.npm.taobao.org/
RUN npm install --registry http://registry.cnpmjs.org

COPY ./ /app/

RUN npm run build

# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:1.15

COPY --from=build-stage /app/build/ /usr/share/nginx/html

# Copy the default nginx.conf provided by tiangolo/node-frontend
COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf
# ---- Dependencies ----
# FROM node:12-alpine AS dependencies
# WORKDIR /app
# COPY package.json ./
# RUN yarn install

# # ---- Build ----
# FROM dependencies AS build
# WORKDIR /app
# COPY . /app
# RUN yarn build

# FROM nginx:1.16-alpine
# COPY --from=build /app/dist /usr/share/nginx/html
# EXPOSE 80
# CMD [ "nginx", "-g", "daemon off;" ]

FROM nginx

# 拷贝dist文件下的文件到nginx中html中，也可以指定目录
COPY dist /usr/share/nginx/html/

# 将自定义的nginx配置文件拷贝到nginx目录中
COPY nginx.conf /etc/nginx/

# 启动nginx
RUN service nginx start

# 导出端口
EXPOSE 80
# ---- Dependencies ----
FROM nginx

# 拷贝dist文件下的文件到nginx中html中，也可以指定目录
COPY dist /usr/share/nginx/html/

# 将自定义的nginx配置文件拷贝到nginx目录中
COPY nginx.conf /etc/nginx/

# 启动nginx
RUN service nginx start

# docker build -t subweb-local:latest .
# docker run -d --restart=always -p 58080:80 subweb-local:latest 
# 导出端口
EXPOSE 80
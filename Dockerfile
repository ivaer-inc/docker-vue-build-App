# 拉取Nginx基础镜像
FROM nginx:latest

# 作者
MAINTAINER IVA "admin@ivaer.com"

ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/{TZ} /etc/localtime && echo "{TZ}" > /etc/timezone

RUN npm run build

# copy编译好的文件到Nginx容器
COPY /dist /www/iva.com/

# 自定义Nginx.conf文件
COPY nginx.conf /etc/nginx/nginx.conf

# 暴露对外服务的端口
EXPOSE 80

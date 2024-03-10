FROM nginx:stable-alpine
RUN VERSION=$(curl --silent -qI https://github.com/cheeaun/phanpy/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}');
RUN wget https://github.com/cheeaun/phanpy/releases/download/$VER/phanpy-dist.tar.gz|tar -zxvf /usr/share/nginx/html/ -C
RUN chmod o+r -R /usr/share/nginx/html
RUN apk update && apk upgrade

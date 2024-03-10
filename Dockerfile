FROM nginx:stable-alpine
RUN ls -lah /usr/share/nginx/html/
RUN wget -c https://github.com/cheeaun/phanpy/releases/download/$(curl --silent -qI https://github.com/cheeaun/phanpy/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}')/phanpy-dist.tar.gz -O - | tar -zxvf - -C /usr/share/nginx/html/
RUN chmod o+r -R /usr/share/nginx/html
RUN apk update && apk upgrade

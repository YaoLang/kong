#!/bin/bash

#输入学校码
read -p "Enter your school code :" code


#输入环境，DEV，TEST，PRO
read -p "Enter the environment, (DEV,TEST,PRO) default PRO :" env


declare -A map=(["DEV"]="class-dev.test.seewo.com" ["TEST"]="class.test.seewo.com" ["PRO"="class.seewo.com"])

host = map[$env]
echo $host



#输入文件存储路径

echo 学校码$code
echo 环境$env


#启动nginx
docker run -d -p 80:80 -p 443:443 --name eclass-resource-ng \
-v $PWD:/var/www/html/petweb \
registry-public.cvte.com/easiclass/eclass-local-resource-nginx

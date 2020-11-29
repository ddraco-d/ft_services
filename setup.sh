minikube delete

minikube start --vm-driver=virtualbox
minikube addons enable metallb

eval $(minikube docker-env)

kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/volumes.yaml

docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx.yaml

docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql.yaml

docker build -t pma srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin.yaml

docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress.yaml

docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps.yaml

docker build -t influxdb_image srcs/influxdb
kubectl apply -f srcs/influxdb.yaml

docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/grafana.yaml

minikube dashboard

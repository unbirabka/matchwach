# Welcome to matchwatch!

Hi! repo ini di buat untuk keperluan pribadi


# Diagram

![This is an image](https://github.com/unbirabka/matchwach/raw/main/jamtangan.jpg)

## Create files and folders

> Jelaskan komponen-komponen & service-service yang ada pada infrastructure tersebut!

- monitoring
-- metric apps dan resource infra menggunakan grafana & promotheus 
-- log centralize menggunakan kibana & elastic
-- archive log juga metric akan disimpan pada google storage

- data
-- untuk database menggunakan mysql cluster dengan replikasi master-master menggunakan galera
-- untuk messaging queue menggunakan rabbitmq

- kubernetes
-- untuk web server pada kubernetes menggunakan ingress-nginx
-- untuk autoscale menggunakan keda yang terintegrasi dengan native hpa k8s

- vpn
-- untuk vpn menggunakan pritunl

- loadbalancer/failover
-- untuk failover menggunakan haproxy
---
> Jelaskan flow / process user dapat mengakses layanan Jamtangan.com!

- flow user access to jamtangan.com
-- user mengunjungi web url jamtangan.com
-- selanjutnya request di proses cloud-dns dengan policy geolocation untuk di sesuaikan dengan region user
-- request diteruskan ke haproxy
-- request diteruskan ke ingress-nginx
-- request teruskan ke service app
-- request di proses oleh service dan juga db
-- selanjutnya jika proses sudah selesai maka result akan di kirim kembali ke user
---
> Jika ada infrastrucure yg bermasalah di salah satu region, bagaimana caranya agar layanan tetap dapat diakses di semua region?

disini saya menggunakan HAProxy sebagai tools untuk keperluan failover, di masing-masing haproxy pada masing-masing region akan di set backend dengan 3 endpoint
-- india
```
server 1 india primary
server 2 indoneisa backup
server 3 siangpore backup
```
-- indonesia
```
server 1 indonesia primary
server 2 india backup
server 3 siangpore backup
```
-- singapore
```
server 1 singapore primary
server 2 india backup
server 3 indonesia backup
```
jika pada region singapore terjadi masalah maka haproxy akan switch server 1 singapore ke server 2 india sebagai backup, begitupun implementasi pada region lain

---
>Jelaskan HA dan DRC plan untuk infrastructure ini!
- HA & DRC
-- untuk apps high availability dan DRC kita menggunakan HPA untuk horizontal autoscale
-- untuk autoscale pods menggunakan keda sebagai tools untuk triger autoscal berdasarkan event
-- selain itu pada nodepool k8s worker juga kita set autoscale dengan implementasi multi zone
-- lalu untuk database kita menggunakan db replication master-master dengan galera, dan masing2 replication terletak pada zone/region berbeda


# 起動方法

```
$ git clone https://github.com/jinwatanabe/Rails6_MySQL_env.git
$ cd Rails6_MySQL_env
$ docker-compose build
$ docker-compose up
```

初回起動の際には別タブを開いて以下のコマンドを実行する

```
$ docker exec -it rails sh
$ rake db:create
$ rake db:migrate
```

# Railsコンテナに入る

```
$ docker exec -it rails sh
```

# MySQLコンテナに入いる

```
$ docker exec -it db sh
$ mysql -u root -p
$ use mysql;
```

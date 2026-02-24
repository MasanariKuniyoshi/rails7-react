# Rails 7 + React 18 + TypeScript 4 + MySQL 8

Frontend
- Node 14.17.1-alpine
- React 18.3
- TypeScript 4.9.5

Backend
- Ruby 3.2.1
- Ruby on Rails 7.0  

Database
- MySQL 8.0

Docker compose にて実装

### 初回構築

```bash
$ make build
```

### サーバーの起動

```bash
$ make serve
```

### サーバー内でシェルの実行

サーバーを起動した状態で以下を実行

- ruby

```bash
$ docker compose exec api bash
```

- node

```bash
$ docker compose exec front /bin/sh
```

## 構成

docker compose で構成

- ruby [ruby:3.2.1](https://hub.docker.com/_/ruby)
- node [node:14.17.1-alpine](https://hub.docker.com/_/node)
- mysql [mysql:8.0](https://hub.docker.com/_/mysql)

.DEFAULT_GOAL := help

build: ## build develoment environment
	docker compose build
	docker compose run --rm api bundle install
	docker compose run --rm api bin/rails db:create
	docker compose run --rm api bin/rails db:schema:load
	docker compose run --rm api bin/rails db:seed
	docker compose run --rm front npm install

serve: ## Run Server
	docker compose up -d
	docker compose exec front npm start

api-log: ## Tail api log
	docker compose logs api -f

db-log: ## Tail postgres log
	docker compose logs postgres -f

front-log: ## Tail postgres log
	docker compose logs front -f

shell: ## Run shell
	docker compose exec api bash

console: ## Run Rails Console
	docker compose exec api bin/rails c

migrate: ## Run db:migrate
	docker compose exec api bin/rails db:migrate

migrate-status: ## Run db:migrate:status
	docker compose exec api bin/rails db:migrate:status

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

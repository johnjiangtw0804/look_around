
#
# PostgreSQL Environment Variables
#
.EXPORT_ALL_VARIABLES:
DB_HOST ?= localhost
DB_PORT ?= 5432
DB_USER ?= jonathan
DB_PASSWORD ?= john0804
DB_NAME ?= look_around
DATABASE_URL ?= sslmode=disable host=${DB_HOST} port=${DB_PORT} user=${DB_USER} password=${DB_PASSWORD} dbname=${DB_NAME}

#
# postgres
#
stop-pg:
	@echo "stop postgres..."
	@docker stop look-around-pg | true

start-pg:stop-pg
	@echo "restart postgres..."
	@docker run -d --rm --name look-around-pg \
				-p 5432:5432 -e POSTGRES_DB=look_around \
				-e POSTGRES_USER=jonathan -e POSTGRES_PASSWORD=john0804 \
				postgres:13.4-alpine
restart-pg: stop-pg
run:
	echo ${DATABASE_URL}
	@go run main.go
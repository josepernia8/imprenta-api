.DEFAULT_GOAL := help

init:
	docker-compose up -d

kill:
	docker-compose down

restart:
	docker-compose restart

logs:
	docker-compose logs -f imprenta_db

del:
	docker volume rm imprenta-api_pg_12_data

#############################################################
# "Help Documentation"
#############################################################

help:
	@echo "  Database Container Commands"
	@echo "  |"
	@echo "  |_ help (default)              - Show this message"
	@echo "  |"
	@echo "  |_ Manage Database:"
	@echo "  |  init                        - Spin up db with docker"
	@echo "  |  kill                        - Stop/remove db container and network associated with it"
	@echo "  |  restart                     - Restart db container"
	@echo "  |  logs                        - Show db logs"
	@echo "  |  del                         - Delete database schema (removing docker voume)"
	@echo "  |_____________________________________________________________________________________________ "
	@echo " "

.PHONY:
	init
	kill
	restart
	logs
	del

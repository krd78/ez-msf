clean:
	@bash configure -r

stop:
	docker stop ezmsf_msfdb_1

config:
	@bash configure -a

run:
	docker-compose run msfconsole

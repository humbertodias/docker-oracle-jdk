build:
	docker build . --env-file jdk-11.env -t hldtux/oracle-jdk-11

push:
	docker hldtux/oracle-jdk-11
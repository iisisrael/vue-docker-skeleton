cli-build:
	docker build --build-arg "USER_ID=$$(id -u)" --build-arg "GROUP_ID=$$(id -g)" -t my_project_cli:1.0.0 - < ./docker/cli.dockerfile
cli:
	docker run -v ./:/vue-cli -it my_project_cli:1.0.0

dev-build:
	docker build -f ./docker/dev.dockerfile -t my_project_dev:1.0.0 app
dev:
	docker run -v ./app:/app -p 8080:8080 -it my_project_dev:1.0.0

stage-build:
	docker build -f ./docker/deploy.dockerfile -t my_project_staging:1.0.0 app
stage:
	docker run -p 80:80 my_project_staging:1.0.0

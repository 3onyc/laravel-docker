# Port on host to listen on
PORT=8080
# App name, used in docker image name
APP=laravel
# Used in docker image name <VENDOR>>/<APP>-prod
VENDOR=acme
# User in Dockerfile
MAINTAINER=Foo <foo@acme.tld>
# Name for the `make run` docker container
CONTAINER=$(VENDOR)-$(APP)-web
# your UID on the host, nginx/hhvm will run as this UID so they can read/write files.
UID=1000

dev: prod
	cp Dockerfile.dev Dockerfile
	make _rewrite
	[[ $$(docker images | grep $(VENDOR)/$(APP)-dev | wc -l) -eq 1 ]]  || docker build -t $(VENDOR)/$(APP)-dev .
	rm Dockerfile

prod:
	cp Dockerfile.prod Dockerfile
	make _rewrite
	[[ $$(docker images | grep $(VENDOR)/$(APP)-prod | wc -l) -eq 1 ]] || docker build -t $(VENDOR)/$(APP)-prod .
	rm Dockerfile

_rewrite:
	sed -i 's/__MAINTAINER__/$(MAINTAINER)/g' Dockerfile
	sed -i 's/__VENDOR__/$(VENDOR)/g' Dockerfile
	sed -i 's/__APP__/$(APP)/g' Dockerfile
	sed -i 's/__UID__/$(UID)/g' Dockerfile

run: dev
	mkdir -p app/storage/logs/dev/{nginx,hhvm}
	docker run --detach \
			   --publish $(PORT):80 \
			   --volume `pwd`:/var/www/ \
			   --volume `pwd`/app/storage/logs/dev:/var/log \
			   --name=$(CONTAINER) \
			   $(VENDOR)/$(APP)-dev

clean:
	docker rm -f $(CONTAINER) || true
	docker rmi $(VENDOR)/$(APP)-dev || true
	docker rmi $(VENDOR)/$(APP)-prod || true


.PHONY: _rewrite prod dev run clean

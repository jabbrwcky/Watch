COMMIT=$(shell git rev-parse HEAD)
SHORTCOMMIT=$(shell git rev-parse --short HEAD)

.PHONY: image push

image: Dockerfile
	docker build --tag quay.dc.xing.com/qa/watch:$(SHORTCOMMIT) --label com.xing.git.sha1=$(COMMIT) .

push:
	docker push quay.dc.xing.com/qa/watch:$(SHORTCOMMIT)


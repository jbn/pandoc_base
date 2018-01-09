PANDOC_VERSION=2.0.6

.PHONY: image
image:
	docker build \
		--build-arg PANDOC_VERSION=$(PANDOC_VERSION) \
		-t generativist/pandoc_base:$(PANDOC_VERSION) .
	
	docker tag \
		generativist/pandoc_base:$(PANDOC_VERSION) \
		generativist/pandoc_base:latest
	
	docker push generativist/pandoc_base:latest


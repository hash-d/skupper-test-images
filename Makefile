SHELL = /bin/sh
PODMAN = podman
FORMAT_OPTIONS = --format docker
DEST_REPO = quay.io/dhashimo

IMAGES = \
	docker.io/svagi/nghttp2 \
	docker.io/nginxinc/nginx-unprivileged \
	docker.io/ssorj/quiver \
	docker.io/library/postgres \
	docker.io/library/redis
#	docker.io/maistra/examples-bookinfo-productpage-v1:0.12.0 \
#	docker.io/maistra/examples-bookinfo-ratings-v1:0.12.0 \
#	docker.io/maistra/examples-bookinfo-details-v1:0.12.0 \
#	docker.io/maistra/examples-bookinfo-reviews-v3:0.12.0 \
#	docker.io/library/mongo:5.0 \

#	docker.io/nginxinc/nginx-unprivileged:stable-alpine \

all:
	@echo "Use 'make everything' for building and copying everything to the DEST_REPO".
	@echo Normal use, however, is to select individual targets.
	@echo Check file contents for additional details.
	@echo TODO


nghttp2:
	$(PODMAN) build $(FORMAT_OPTIONS) --file Dockerfile.nghttp2 --tag $(DEST_REPO)/nghttp2

images: $(IMAGES)

# For each image, get only the last part of the URL
$(IMAGES): TARGET = $(shell echo "$@" | sed s_.*/__ )
$(IMAGES):
	@echo skopeo copy -format v2s1 docker://$@ $(DEST_REPO)/$(TARGET)

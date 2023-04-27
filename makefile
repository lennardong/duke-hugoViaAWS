# Define variables
HUGO_VERSION := 0.111.3
AWS_REGION := ap-southeast-2
S3_BUCKET := duke-hugo-s3

# Define commands
hugo:
	cd /tmp && \
	wget https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz && \
	tar -xzf hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz && \
	mv hugo /usr/bin/hugo && \
	cd -

hugo_macOS:
	brew install hugo

build:
	rm -rf public
	hugo

deploy:
	aws s3 sync public/ s3://$(S3_BUCKET)/ --region $(AWS_REGION) --delete

.PHONY: hugo build deploy

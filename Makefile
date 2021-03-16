.SILENT:

default: help


b: build
build: #: (b) Build Docker image
	docker build --tag hugo-tailwind .

s: start
start: #: (s) Start Docker container for development
	docker run \
		--name hugo-tailwind \
		--publish 1313:1313 \
		--rm \
		--volume ${PWD}:/app \
		hugo-tailwind \
		hugo server --bind 0.0.0.0 --debug

sh: shell
shell: #: (sh) Interactive shell
	docker exec --interactive --tty hugo-tailwind sh

compile: #: Compile website for production
	docker run \
		--env NODE_ENV="production" \
		--rm \
		--volume ${PWD}:/app \
		hugo-tailwind \
		hugo --debug

help: color=$(shell printf "\033[1;34m")
help: no_color=$(shell printf "\033[0m")
help: #: Show help
	grep "#:" Makefile* | \
	grep -v "grep" | \
	sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/${color}\1${no_color}\2/g"

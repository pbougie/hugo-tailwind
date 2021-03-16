# [Hugo-Tailwind](https://github.com/pbougie/hugo-tailwind)


## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop)


## CLI

- Build Docker image: `make build`
- Start Docker container for development: `make start`
- Interactive shell: `make shell`
- Compile website for production: `make compile`


## Reproduce

### Clone the repo

    git clone -n https://github.com/pbougie/hugo-tailwind.git
    cd hugo-tailwind

### Hugo + Tailwind CSS only

    git checkout 894adadcd876c4cb5f677ff8a5cefeb340c5294a
    make build
    make start

This works as expected. See results at [localhost:1313](http://localhost:1313/). Press `CTRL-C` to stop.

### Hugo + Tailwind CSS + Tailwind JIT

    git checkout e645864fc9eca4fe19eb5183c12a124ad7509723
    make build
    make start

This does not work.

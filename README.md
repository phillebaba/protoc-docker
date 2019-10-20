# Protoc Docker
Helper docker image to use protoc with many different languages.

[Docker Hub](https://hub.docker.com/r/phillebaba/protoc-docker)

## Supported Languages
* Go
* Javascript
* Typescript

## Usage
The entrypoint is set to protoc so all you need to do is pass the options and mount the project.
```bash
docker run --rm -v ${PWD}:${PWD} -w ${PWD} phillebaba/protoc-docker:6a297cf --js_out=import_style=commonjs,binary:.
```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

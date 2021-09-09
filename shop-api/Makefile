.PHONY: gomodgen
gomodgen:
	chmod u+x gomod.sh
	./gomod.sh


.PHONY: build
build: gomodgen
	export GO111MODULE=on
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

.PHONY: clean
clean:
	rm -rf ./bin ./vendor go.sum

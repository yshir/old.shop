.PHONY: gomodgen
gomodgen:
	chmod u+x gomod.sh
	./gomod.sh

.PHONY: build
build: gomodgen
	chmod u+x gobuild.sh
	./gobuild.sh

.PHONY: clean
clean:
	rm -rf ./bin ./vendor go.sum

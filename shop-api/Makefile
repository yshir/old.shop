.PHONY: gomodgen
gomodgen:
	chmod u+x gomod.sh && ./gomod.sh

.PHONY: build
build: gomodgen
	chmod u+x gobuild.sh && ./gobuild.sh
	chmod u+x fnbuild.sh && ./fnbuild.sh

.PHONY: clean
clean:
	rm -rf ./bin ./vendor *.test *.tmp

.PHONY: todo
todo:
	cat .private/TODO.md

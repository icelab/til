build: node_modules
	node --harmony build.js

node_modules: package.json
	npm install

.PHONY: build

all: dist/app.js \
	 .static \
	 .packages

.static: dist $(shell find static/ -type f)
	@ rsync -r static/ dist/

dist/app.js: $(shell find src -type f -name '*.elm')
	elm-make src/App.elm --yes --warn --output=$@

.packages: elm-package.json
	elm package install --yes
	touch $@

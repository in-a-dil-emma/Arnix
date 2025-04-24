files_scss := $(wildcard *.scss)
output_scss := $(foreach file,$(files_scss),$(shell basename -s .scss $(file)))
files_ts := $(wildcard *.ts)
output_ts := $(foreach file,$(files_ts),$(shell basename -s .ts $(file)))

all:
	mkdir -p compiled
	@make $(output_scss)
	@make $(output_ts)

deploy: all
	rm -rf ../docs/*
	cp -r compiled ../docs/compiled
	cp -r images ../docs/images
	cp *.html ../docs/

$(output_scss):
	sassc -t compressed $@.scss > compiled/$@.css

$(output_ts):
	tsc -t es6 --outFile compiled/$@.js $@.ts

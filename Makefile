BASE_DIR=$(CURDIR)
INPUT_DIR=$(BASE_DIR)/content
OUTPUT_DIR=$(BASE_DIR)/output
THEME_DIR=$(BASE_DIR)/theme

INPUT_FILES=$(shell find $(INPUT_DIR) -not -name "README.rst" -name '*.rst')
OUTPUT_FILES = $(foreach INPUT_FILE, $(INPUT_FILES), $(OUTPUT_DIR)/$(shell dirname $(INPUT_FILE) | xargs basename)/index.html)

%.html : $(INPUT_FILES)
	@echo 'Generating html presentation file $@'
	$(shell dirname $@ | xargs mkdir -p)
	@landslide -q -l table -i -r -t $(THEME_DIR) $< -d $@

build: clean $(OUTPUT_FILES)

github: build
	ghp-import $(OUTPUT_DIR)
	git push origin gh-pages

clean:
	@echo 'Removing old html presentation files.'
	@rm -rf $(OUTPUT_DIR)/*

watch:
	while inotifywait $(INPUT_FILES); do make build; done

.PHONY: clean, build, github, watch

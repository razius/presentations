SHELL:=/bin/bash

INPUT_DIR=content/
OUTPUT_DIR=output/
THEME_DIR=theme/

INPUT_FILES=$(shell find $(INPUT_DIR) -not -name "README.rst" -name '*.rst')
OUTPUT_FILES=$(INPUT_FILES:$(INPUT_DIR)%.rst=$(OUTPUT_DIR)%.html)

# OUTPUT_FILES = $(foreach INPUT_FILE, $(INPUT_FILES), $(OUTPUT_DIR)/$(shell dirname $(INPUT_FILE) | xargs basename)/index.html)

%.html:
	@echo 'Generating html presentation file $@.'
	$(shell dirname $@ | xargs mkdir -p)
	@landslide -q -l table -i -r -t $(THEME_DIR) $(patsubst $(OUTPUT_DIR)%.html, $(INPUT_DIR)%.rst, $@) -d $@

build: clean $(OUTPUT_FILES)

index: build
	@echo 'Generating index file.'
	$(shell echo '<h2>Presentations</h2><ul>' > $(OUTPUT_DIR)/index.html)
	$(shell cd $(OUTPUT_DIR) && find . -type d ! -name '.' -exec basename {} \; | xargs -L 1 -I '{}' echo '<li><a href="{}">{}</a></li>' >> $(OUTPUT_DIR)/index.html)
	$(shell echo '</ul>' >> $(OUTPUT_DIR)/index.html)

github: build
	ghp-import $(OUTPUT_DIR)
	git push origin gh-pages

clean:
	@echo 'Removing old html presentation files.'
	@rm -rf $(OUTPUT_DIR)/*

watch:
	@echo "Watching $(INPUT_DIR) for file changes."
	@while inotifywait -q -r $(INPUT_DIR) $(THEME_DIR); do make build; done

.PHONY: build, index, github, clean, watch

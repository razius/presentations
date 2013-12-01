# find . -not -name "README.md" -name "*.md" -exec landslide -r -t theme/ {} -d test/index.html \;
# dir=${a%/*}
# file=${a##*/}
MD_FILES = $(shell find . -not -name "README.md" -name "*.md")
HTML_FILES = $(MD_FILES:.md=.html)

.PHONY: all

%.html : %.md
	@echo 'Generating html presentation file for $<'
	@landslide -r -t theme/ $< -d $@

all: clean $(HTML_FILES)

clean:
	@echo 'Removing old html presentation files.'
	rm $(HTML_FILES)

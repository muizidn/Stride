SCRIPTS_DIR=scripts

start:
	bash $(SCRIPTS_DIR)/install_prerequisite.sh
	make update exec

exec: build run

run:
	swift run --skip-build

test:
	bash $(SCRIPTS_DIR)/test.sh

build:
	bash $(SCRIPTS_DIR)/build.sh

update:
	swift package update

clean:
	swift package clean

generate-xcodeproj:
	bash $(SCRIPTS_DIR)/generate-xcodeproj.sh
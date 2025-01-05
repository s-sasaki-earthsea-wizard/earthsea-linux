# Description: The main Makefile for the project.

# Define the directories paths
ROOT_DIR := $(shell pwd)
MAKEFILES_DIR := makefiles
CONFIG_DIR := configs

# Read the configuration file
include $(MAKEFILES_DIR)/system.mk
include $(MAKEFILES_DIR)/cli.mk
include $(MAKEFILES_DIR)/gui.mk
include $(MAKEFILES_DIR)/data.mk

# ------------------------------
# Other Tools
# ------------------------------

# TBD

# ------------------------------
# Help
# ------------------------------

# The .PHONY rule keeps make from doing something with a file named clean.
.PHONY: help

# The help target is the default target. When you run make with no arguments, it will be the target that is built.
.DEFAULT_GOAL := help

help:  # Show all available commands
	@echo "Usage: make [TARGET]\n"
	@echo "🌐System-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" $(MAKEFILES_DIR)/system.mk | column -t -c 2 -s ':#'
	@echo "\n🌐CLI tool-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" $(MAKEFILES_DIR)/cli.mk | column -t -c 2 -s ':#'
	@echo "\n🌐GUI tool-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" $(MAKEFILES_DIR)/gui.mk | column -t -c 2 -s ':#'
	@echo "\n🌐GIS Data-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" $(MAKEFILES_DIR)/data.mk | column -t -c 2 -s ':#'
	@echo "\nFor more information, see the README.md file."
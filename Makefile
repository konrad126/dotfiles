.DEFAULT_GOAL := help

.PHONY: help copy link macos
SHELL=/usr/bin/env bash

GREEN=\033[0;32m
YELLOW=\033[0;33m
RED=\033[0;31m
STOP=\033[0m

help: ## Help Dialog
	@echo -e "${RED}"
	@cat script/prompt.txt
	@echo -e "${STOP}"
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/:/'`); \
	printf "%-30s %s\n" "" ; \
	printf "%-30s %s\n" "Target" "Help" ; \
	printf "%-30s %s\n" "------" "----" ; \
	for help_line in $${help_lines[@]}; do \
        IFS=$$':' ; \
        help_split=($$help_line) ; \
        help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
        help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
        printf '\033[36m'; \
        printf "%-30s %s" $$help_command ; \
        printf '\033[0m'; \
        printf "%s\n" $$help_info; \
    done

copy: ## Copy dotfiles
	@echo -e "${YELLOW} Copyig files ${STOP} \n"
	@./script/process-files.sh `pwd` files copy
	@echo -e "\n${YELLOW} Done ${STOP}"

link: ## Link dotfiles (symbolic links)
	@echo -e "${YELLOW} Linking files ${STOP} \n"
	./script/process-files.sh `pwd` files link
	@echo -e "\n${YELLOW} Done ${STOP}"

macos: ## Setup mac-os specifics
	@echo -e "${YELLOW} Sourcing... ${STOP} \n"
	source macos/macos
	@echo -e "\n${YELLOW} Done ${STOP}"
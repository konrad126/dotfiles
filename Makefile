.DEFAULT_GOAL := help

.PHONY: help copy link macos macos-brew-packages macos-brew-install setup-mac
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

setup-mac: link macos-brew-install macos-brew-packages macos ## Setup mac
	@echo -e "\n${GREEN} Done. Your mac is ready to use! ${STOP}"

copy: ## Copy dotfiles
	@echo -e "\n${YELLOW} Copyig files ${STOP} \n"
	@./script/process-files.sh `pwd` files copy
	@echo -e "\n${GREEN} Done ${STOP}"

link: ## Link dotfiles (symbolic links)
	@echo -e "\n${YELLOW} Linking files ${STOP} \n"
	./script/process-files.sh `pwd` files link
	@echo -e "\n${GREEN} Done ${STOP}"

macos: ## Setup mac-os specifics
	@echo -e "\n${YELLOW} Setting up mac-os specifics... ${STOP} \n"
	source macos/macos
	@echo -e "\n${GREEN} Done ${STOP}"

macos-brew-packages: ## Install brew packages
	@echo -e "\n${YELLOW} Installing pacakges... ${STOP} \n"
	./macos/brew
	@echo -e "\n${GREEN} Done ${STOP}"

macos-brew-install: ## Install brew package manager
	@echo -e "\n${YELLOW} Installing brew package manager... ${STOP} \n"
	sh macos/brew-install
	@echo -e "\n${GREEN} Done ${STOP}"
SERVICE=docker-desktop-fix.service
TEMPLATE=${SERVICE}.template

SYSTEMD_DIR=/etc/systemd/system
INSTALLED_SERVICE=$(SYSTEMD_DIR)/$(SERVICE)

.PHONY: help
help:
	@echo "Fix for running Docker Desktop in Ubuntu 24.04 LTS"
	@echo
	@echo "Targets:"
	@echo "  install  - Installs the service file under $(SYSTEMD_DIR)"
	@echo "  enable   - Enables such service"
	@echo
	@echo "Both targets must be run with priviledges (sudo)"

$(SERVICE): $(TEMPLATE)
	sed "s:PWD:$(shell pwd):g" $^ > $@

$(INSTALLED_SERVICE): $(SERVICE)
	cp $< $@

.PHONY: install
install: $(INSTALLED_SERVICE)

.PHONY: enable
enable: $(INSTALLED_SERVICE)
	systemctl enable $(SERVICE)

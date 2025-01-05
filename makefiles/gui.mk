# ------------------------------
# Install GUI Tools
# ------------------------------

install_qgis:  # Install QGIS
	sudo mkdir -p /etc/apt/keyrings
	sudo wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg
	cat configs/qgis.conf | envsubst | sudo tee /etc/apt/sources.list.d/qgis.sources > /dev/null
	sudo apt update
	sudo apt install -y qgis qgis-plugin-grass
	sudo apt install -y qgis-server
	sudo apt install -y python3-qgis
	
install_cloudcompare:  # Install CloudCompare
	flatpak install flathub
	org.cloudcompare.CloudCompare
	flatpak run org.cloudcompare.CloudCompare

install_gui_tools:  # Install GUI tools
	install_qgis
	install_cloudcompare

gui-help:  # Show GUI tool-related commands
	@echo "GUI tool-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" ${MAKEFILE_LIST} | grep -v "help" | column -t -c 2 -s ':#'
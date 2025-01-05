# ------------------------------
# Download GIS Data
# ------------------------------

download_natural_earth: create_attribution # Download Natural Earth basic data
	mkdir -p $(NATURAL_EARTH_DIR)
	wget -P $(NATURAL_EARTH_DIR) https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip
	wget -P $(NATURAL_EARTH_DIR) https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/physical/ne_10m_rivers_lake_centerlines.zip
	cd $(NATURAL_EARTH_DIR) && find . -name "*.zip" -exec unzip {} \;

# ------------------------------
# Data Help
# ------------------------------

data-help:  # Show data-related commands
	@echo "Data-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" ${MAKEFILE_LIST} | grep -v "help" | column -t -c 2 -s ':#'
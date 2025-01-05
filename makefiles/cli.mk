# ------------------------------
# Install Command Line Tools
# ------------------------------

install_python:  # Install Python
	sudo apt-get install -y python3 python3-pip python3-venv

install_gee:  # Install Google Earth Engine
	pip install earthengine-api

install_gcloud_cli:  # Install Google Cloud CLI
	curl https://sdk.cloud.google.com | bash
	exec -l $SHELL
	gcloud init

install_pdal:  # Install PDAL
	git clone https://github.com/PDAL/PDAL.git /PDAL
	cd /PDAL && mkdir build && cd build && \
	cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release && \
	make -j$(nproc) && make install && ldconfig

install_command_line_tools:  # Install command line tools
	install_python
	install_gee
	install_gcloud_cli
	install_pdal

# ------------------------------
# CLI Help
# ------------------------------

cli-help:  # Show CLI tool-related commands
	@echo "CLI tool-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" ${MAKEFILE_LIST} | grep -v "help" | column -t -c 2 -s ':#'
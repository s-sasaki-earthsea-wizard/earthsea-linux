# ------------------------------
# System setup
# ------------------------------

apt_update:  # Update the apt-get package list and upgrade the system
	sudo apt-get update
	sudo apt-get upgrade

install_system_dependencies: # Install system dependencies
	sudo apt-get install -y \
    build-essential \
    cmake gcc g++ git curl wget\
    libpq-dev gdal-bin libgdal-dev \
    libboost-all-dev libjsoncpp-dev libtiff-dev libgeotiff-dev \
	flatpak snapd gnupg software-properties-common\
    && rm -rf /var/lib/apt/lists/*

setup:  # Setup the system
	apt_update
	install_system_dependencies

# ------------------------------
# System Help
# ------------------------------

system-help:  # Show system-related commands
	@echo "System-related commands:"
	@egrep "^(.+)\:\s+#\s(.+)" ${MAKEFILE_LIST} | grep -v "help" | column -t -c 2 -s ':#'
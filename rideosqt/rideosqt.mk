################################################################################
#
# RIDEOSQT
#
################################################################################

RIDEOSQT_VERSION = 1.0
RIDEOSQT_SITE = $(TOPDIR)/package/rideosqt/RideOS
RIDEOSQT_SITE_METHOD = local
RIDEOSQT_DEPENDENCIES = qt6base qt6declarative qt6serialport qt6shadertools qt6svg
RIDEOSQT_CMAKE = YES
RIDEOSQT_CMAKE_TOOLCHAIN_FILE = $(HOST_DIR)/share/buildroot/toolchainfile.cmake

# Build commands using CMake
define RIDEOSQT_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/cmake \
        -DCMAKE_TOOLCHAIN_FILE=$(RIDEOSQT_CMAKE_TOOLCHAIN_FILE) \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=$(STAGING_DIR)/usr \
        .
    cd $(@D) && $(MAKE)
endef

# Installation commands for the binary
define RIDEOSQT_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/appRideOS $(TARGET_DIR)/usr/bin/rideosqt
endef

# Define as a generic package
$(eval $(generic-package))


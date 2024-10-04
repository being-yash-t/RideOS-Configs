MY_QT_PROJECT_SITE = /buildroot_output/rideosqt/RideOS
MY_QT_PROJECT_DEPENDENCIES = qt6 # Adjust if using Qt6

define MY_QT_PROJECT_BUILD_CMDS
    cd $(@D) && cmake -DCMAKE_TOOLCHAIN_FILE=$(CMAKE_TOOLCHAIN_FILE) .
    cd $(@D) && make
endef

define MY_QT_PROJECT_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/appRideOS $(TARGET_DIR)/usr/bin/appRideOS
endef

$(eval $(generic-package))

# Inherit common Fluid stuff
$(call inherit-product, vendor/fluid/config/common.mk)

# Inherit Fluid car device tree
$(call inherit-product, device/fluid/car/fluid_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

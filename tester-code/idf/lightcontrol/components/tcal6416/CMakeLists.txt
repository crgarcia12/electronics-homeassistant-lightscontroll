include($ENV{IDF_PATH}/tools/cmake/version.cmake)

set(srcs "src/tcal6416.c")
set(public_requires)

# Handle different IDF versions and I2C driver components
if("${IDF_VERSION_MAJOR}.${IDF_VERSION_MINOR}" VERSION_GREATER_EQUAL "5.3")
    # ESP-IDF 5.3+ has dedicated I2C driver component
    list(APPEND public_requires "esp_driver_i2c")
else()
    # Older ESP-IDF versions use the general driver component
    list(APPEND public_requires "driver")
endif()

idf_component_register(SRCS ${srcs}
                       INCLUDE_DIRS "include"
                       REQUIRES "driver"
                       REQUIRES ${public_requires})

# Add compile definitions for version information
target_compile_definitions(${COMPONENT_LIB} PUBLIC
    TCAL6416_VERSION_MAJOR=1
    TCAL6416_VERSION_MINOR=0
    TCAL6416_VERSION_PATCH=0)
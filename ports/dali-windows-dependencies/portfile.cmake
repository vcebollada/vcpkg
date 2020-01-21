vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vcebollada/windows-dependencies
    REF f9c02931cfd7a5d9b576da0dd71943a233af9347
    SHA512 9840e9e435f42e478b21cb3b53c68b4662d73afbfafae08845cabde5569a0011a59f8c0fccc9467fb60def97ddbcd358ca0a65a42901c6a06f988e8c4f805e94
    HEAD_REF master
)

set(VCPKG_BUILD_SHARED_LIBS OFF)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}/build"
    PREFER_NINJA
    OPTIONS -DUSE_VCPKG=1
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

#Install the license file.
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

vcpkg_fixup_cmake_targets(CONFIG_PATH share/${PORT} TARGET_PATH share/${PORT})

vcpkg_copy_pdbs()

# Copy the cmake configuration files to the 'installed' folder
file( COPY "${CURRENT_PACKAGES_DIR}/share" DESTINATION ${CURRENT_INSTALLED_DIR} )


### VCC remove!!!!!!!     
MESSAGE ("        config path : [ " ${CONFIG_PATH} " ]")
MESSAGE ("        target path : [ " ${TARGET_PATH} " ]")
MESSAGE ("               port : [ " ${PORT} " ]")
MESSAGE ("     package folder : [ " ${CURRENT_PACKAGES_DIR} " ]")
MESSAGE ("   installed folder : [ " ${CURRENT_INSTALLED_DIR} " ]")
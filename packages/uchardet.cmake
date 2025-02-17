ExternalProject_Add(uchardet
    GIT_REPOSITORY https://github.com/freedesktop/uchardet.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
        -DBUILD_SHARED_LIBS=OFF
        -DBUILD_STATIC=ON
        -DBUILD_BINARY=OFF
        -DCMAKE_BUILD_TYPE=Release
        -DTARGET_ARCHITECTURE=${TARGET_CPU_FAMILY}
    BUILD_COMMAND ${CMAKE_MAKE_PROGRAM}
    INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(uchardet)
cleanup(uchardet install)

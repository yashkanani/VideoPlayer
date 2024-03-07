cmake_minimum_required(VERSION 3.16)

project(VideoPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Multimedia Qml Quick widgets)

qt_add_resources(RESOURCE_FILES resources.qrc)

qt_add_executable(appVideoPlayer
    main.cpp
    applicationinitializer.h
    applicationinitializer.cpp
    passwordmanager.h
    passwordmanager.cpp
    passwordfilereader.h
    passwordfilereader.cpp
    ${RESOURCE_FILES}
)

qt_add_qml_module(appVideoPlayer
    URI VideoPlayer
    VERSION 1.0
    QML_FILES
        Main.qml
        VideoViewer.qml
        PINPad.qml
        CustomIconButton.qml
)



set_target_properties(appVideoPlayer PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appVideoPlayer PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Multimedia
    Qt::Qml
    Qt::Quick
    Qt::Widgets
)

install(TARGETS appVideoPlayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

cmake_minimum_required(VERSION 3.14)

project(qttextspeechtest LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick TextToSpeech REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick TextToSpeech REQUIRED)

if(ANDROID)
    add_library(qttextspeechtest SHARED
      main.cpp
      speechclient.cpp
      qml.qrc
    )
else()
    add_executable(qttextspeechtest
      main.cpp
      speechclient.cpp
      qml.qrc
    )
endif()

target_compile_definitions(qttextspeechtest
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(qttextspeechtest
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick Qt${QT_VERSION_MAJOR}::TextToSpeech)

install(FILES qttextspeechtest.desktop DESTINATION share/applications)
install(TARGETS qttextspeechtest DESTINATION bin)

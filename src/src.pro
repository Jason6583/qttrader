######################################################
# FILES
#####################################################

SOURCES += LaunchPluginDialog.cpp
HEADERS += LaunchPluginDialog.h
SOURCES += main.cpp
SOURCES += qttrader.cpp
HEADERS += qttrader.h
SOURCES += Setup.cpp
HEADERS += Setup.h

######################################################
# QMAKE SETTINGS
#####################################################

#DEFINES += QT_NO_DEBUG_OUTPUT QT_NO_WARNING_OUTPUT

TEMPLATE = app
CONFIG += qt thread warn_on
CONFIG(debug, debug|release): DEFINES += DEBUG _DEBUG

QMAKE_RPATHDIR += "$${INSTALL_LIB_DIR}"
message("Using QMAKE_RPATHDIR=$$QMAKE_RPATHDIR")

QMAKE_CXXFLAGS += -rdynamic -ffast-math

INCLUDEPATH += /usr/local/qwt-5.2.2/include
INCLUDEPATH += /usr/local/include/ta-lib 
INCLUDEPATH += ../lib

LIBS += -L/usr/lib
LIBS += -L../lib -lQTTRADER
LIBS += -L/usr/local/qwt-5.2.2/lib -lqwt

TARGET = qttrader

message("Using INCLUDEPATH=$$INCLUDEPATH")
message("Using LIBS=$$LIBS")

target.path = "$${INSTALL_BIN_DIR}"
INSTALLS += target

MOC_DIR += build
OBJECTS_DIR += build

QT += core
QT += gui
QT += sql
QT += network

!exists(./build){
  system(echo $(mkdir) build)
}

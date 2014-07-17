# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = SailLevel

CONFIG += sailfishapp

SOURCES += src/SailLevel.cpp \
    settings.cpp

OTHER_FILES += qml/SailLevel.qml \
    qml/cover/CoverPage.qml \
    qml/pages/LevelPage.qml \
    rpm/SailLevel.changes.in \
    rpm/SailLevel.spec \
    rpm/SailLevel.yaml \
    translations/*.ts \
    SailLevel.desktop \
    qml/items/Cross.qml \
    qml/items/LevelItem.qml

CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/SailLevel-fi.ts

HEADERS += \
    settings.h


TARGET = harbour-saillevel

CONFIG += sailfishapp

SOURCES += src/harbour-saillevel.cpp \
    src/settings.cpp

OTHER_FILES += qml/SailLevel.qml \
    qml/cover/CoverPage.qml \
    qml/pages/LevelPage.qml \
    rpm/harbour-saillevel.spec \
    rpm/harbour-saillevel.changes \
    rpm/harbour-saillevel.yaml \
    translations/*.ts \
    qml/items/Cross.qml \
    qml/items/LevelItem.qml \
    harbour-saillevel.desktop



CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-saillevel-fi.ts

HEADERS += \
    src/settings.h


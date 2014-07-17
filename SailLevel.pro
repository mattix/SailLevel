TARGET = SailLevel

CONFIG += sailfishapp

SOURCES += src/SailLevel.cpp \
    settings.cpp

OTHER_FILES += qml/SailLevel.qml \
    qml/cover/CoverPage.qml \
    qml/pages/LevelPage.qml \
    rpm/SailLevel.spec \
    rpm/SailLevel.yaml \
    translations/*.ts \
    SailLevel.desktop \
    qml/items/Cross.qml \
    qml/items/LevelItem.qml \
    rpm/SailLevel.changes


CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/SailLevel-fi.ts

HEADERS += \
    settings.h


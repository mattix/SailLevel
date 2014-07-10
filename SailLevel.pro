TARGET = SailLevel

CONFIG += sailfishapp

SOURCES += src/main.cpp

OTHER_FILES += \
    rpm/SailLevel.changes.in \
    rpm/SailLevel.spec \
    rpm/SailLevel.yaml \
    translations/*.ts \
    SailLevel.desktop \
    qml/CoverPage.qml \    
    qml/LevelPage.qml \
    qml/SailLevel.qml

# CONFIG += sailfishapp_i18n
# TRANSLATIONS +=


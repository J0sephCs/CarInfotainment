QT += quick qml location positioning

SOURCES += \
        main.cpp \
        musicdata.cpp \
        radialbar.cpp

resources.files = main.qml
resources.prefix = /$${TARGET}
RESOURCES += resources \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/ConstantsModule


# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    LinearGauge.qml \
    MPH_Gauge.qml \
    MusicPlayer.qml \
    RPM_Gauge.qml \
    TmpGauge.qml \
    main.qml \
    ConstantsModule/Constants.qml \
    ConstantsModule/qmldir \
    Images/140.png \
    Images/30.png \
    Images/50.png \
    Images/70.png \
    Images/90.png \
    Images/arrow-0.png \
    Images/arrow-45.png \
    Images/arrow-90.png \
    Images/arrow-round.png \
    Images/navi.png \
    Images/phone.png \
    Images/play.png \
    Images/setup.png \
    fonts/DejaVuSans.qpf2 \
    musicData.json

HEADERS += \
    ConstantsModule/Constants.h \
    musicdata.h \
    radialbar.h

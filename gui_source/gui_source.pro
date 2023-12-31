QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = xapkd

macx {
    TARGET = XAPKD
}

TEMPLATE = app

include(../build.pri)

XCONFIG += use_dex
XCONFIG += use_archive
XCONFIG += use_pdf

CONFIG += c++11

SOURCES +=\
        guimainwindow.cpp \
        dialogabout.cpp \
        main_gui.cpp \
        dialogoptions.cpp

HEADERS  += \
        guimainwindow.h \
        ../global.h \
        dialogabout.h \
        dialogoptions.h

FORMS    += \
        guimainwindow.ui \
        dialogabout.ui \
        dialogoptions.ui \
        dialogdirectoryscan.ui


!contains(XCONFIG, archive_widget) {
    XCONFIG += archive_widget
    include(../archive_widget/archive_widget.pri)
}

win32 {
    RC_ICONS = ../icons/main.ico
    CONFIG -= embed_manifest_exe
    QMAKE_MANIFEST = windows.manifest.xml
}

macx {
    ICON = ../icons/main.icns
}

RESOURCES += \
    resources.qrc

DISTFILES += \
    ../changelog.txt \
    ../release_version.txt \
    CMakeLists.txt

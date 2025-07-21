/****************************************************************************
** Meta object code from reading C++ file 'radialbar.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.9.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../radialbar.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'radialbar.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.9.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN9RadialBarE_t {};
} // unnamed namespace

template <> constexpr inline auto RadialBar::qt_create_metaobjectdata<qt_meta_tag_ZN9RadialBarE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "RadialBar",
        "sizeChanged",
        "",
        "startAngleChanged",
        "spanAngleChanged",
        "minValueChanged",
        "maxValueChanged",
        "valueChanged",
        "dialWidthChanged",
        "backgroundColorChanged",
        "foregroundColorChanged",
        "progressColorChanged",
        "textColorChanged",
        "suffixTextChanged",
        "penStyleChanged",
        "dialTypeChanged",
        "textFontChanged",
        "size",
        "startAngle",
        "spanAngle",
        "minValue",
        "maxValue",
        "value",
        "dialWidth",
        "backgroundColor",
        "foregroundColor",
        "progressColor",
        "textColor",
        "suffixText",
        "showText",
        "penStyle",
        "Qt::PenCapStyle",
        "dialType",
        "DialType",
        "textFont",
        "FullDial",
        "MinToMax",
        "NoDial"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'sizeChanged'
        QtMocHelpers::SignalData<void()>(1, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'startAngleChanged'
        QtMocHelpers::SignalData<void()>(3, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'spanAngleChanged'
        QtMocHelpers::SignalData<void()>(4, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'minValueChanged'
        QtMocHelpers::SignalData<void()>(5, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'maxValueChanged'
        QtMocHelpers::SignalData<void()>(6, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'valueChanged'
        QtMocHelpers::SignalData<void()>(7, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'dialWidthChanged'
        QtMocHelpers::SignalData<void()>(8, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'backgroundColorChanged'
        QtMocHelpers::SignalData<void()>(9, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'foregroundColorChanged'
        QtMocHelpers::SignalData<void()>(10, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'progressColorChanged'
        QtMocHelpers::SignalData<void()>(11, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'textColorChanged'
        QtMocHelpers::SignalData<void()>(12, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'suffixTextChanged'
        QtMocHelpers::SignalData<void()>(13, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'penStyleChanged'
        QtMocHelpers::SignalData<void()>(14, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'dialTypeChanged'
        QtMocHelpers::SignalData<void()>(15, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'textFontChanged'
        QtMocHelpers::SignalData<void()>(16, 2, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'size'
        QtMocHelpers::PropertyData<qreal>(17, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 0),
        // property 'startAngle'
        QtMocHelpers::PropertyData<qreal>(18, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 1),
        // property 'spanAngle'
        QtMocHelpers::PropertyData<qreal>(19, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 2),
        // property 'minValue'
        QtMocHelpers::PropertyData<qreal>(20, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 3),
        // property 'maxValue'
        QtMocHelpers::PropertyData<qreal>(21, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 4),
        // property 'value'
        QtMocHelpers::PropertyData<qreal>(22, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 5),
        // property 'dialWidth'
        QtMocHelpers::PropertyData<int>(23, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 6),
        // property 'backgroundColor'
        QtMocHelpers::PropertyData<QColor>(24, QMetaType::QColor, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 7),
        // property 'foregroundColor'
        QtMocHelpers::PropertyData<QColor>(25, QMetaType::QColor, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 8),
        // property 'progressColor'
        QtMocHelpers::PropertyData<QColor>(26, QMetaType::QColor, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 9),
        // property 'textColor'
        QtMocHelpers::PropertyData<QColor>(27, QMetaType::QColor, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 10),
        // property 'suffixText'
        QtMocHelpers::PropertyData<QString>(28, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 11),
        // property 'showText'
        QtMocHelpers::PropertyData<bool>(29, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet),
        // property 'penStyle'
        QtMocHelpers::PropertyData<Qt::PenCapStyle>(30, 0x80000000 | 31, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag | QMC::StdCppSet, 12),
        // property 'dialType'
        QtMocHelpers::PropertyData<DialType>(32, 0x80000000 | 33, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag | QMC::StdCppSet, 13),
        // property 'textFont'
        QtMocHelpers::PropertyData<QFont>(34, QMetaType::QFont, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 14),
    };
    QtMocHelpers::UintData qt_enums {
        // enum 'DialType'
        QtMocHelpers::EnumData<DialType>(33, 33, QMC::EnumFlags{}).add({
            {   35, DialType::FullDial },
            {   36, DialType::MinToMax },
            {   37, DialType::NoDial },
        }),
    };
    return QtMocHelpers::metaObjectData<RadialBar, qt_meta_tag_ZN9RadialBarE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject RadialBar::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN9RadialBarE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN9RadialBarE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN9RadialBarE_t>.metaTypes,
    nullptr
} };

void RadialBar::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<RadialBar *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->sizeChanged(); break;
        case 1: _t->startAngleChanged(); break;
        case 2: _t->spanAngleChanged(); break;
        case 3: _t->minValueChanged(); break;
        case 4: _t->maxValueChanged(); break;
        case 5: _t->valueChanged(); break;
        case 6: _t->dialWidthChanged(); break;
        case 7: _t->backgroundColorChanged(); break;
        case 8: _t->foregroundColorChanged(); break;
        case 9: _t->progressColorChanged(); break;
        case 10: _t->textColorChanged(); break;
        case 11: _t->suffixTextChanged(); break;
        case 12: _t->penStyleChanged(); break;
        case 13: _t->dialTypeChanged(); break;
        case 14: _t->textFontChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::sizeChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::startAngleChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::spanAngleChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::minValueChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::maxValueChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::valueChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::dialWidthChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::backgroundColorChanged, 7))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::foregroundColorChanged, 8))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::progressColorChanged, 9))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::textColorChanged, 10))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::suffixTextChanged, 11))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::penStyleChanged, 12))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::dialTypeChanged, 13))
            return;
        if (QtMocHelpers::indexOfMethod<void (RadialBar::*)()>(_a, &RadialBar::textFontChanged, 14))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<qreal*>(_v) = _t->getSize(); break;
        case 1: *reinterpret_cast<qreal*>(_v) = _t->getStartAngle(); break;
        case 2: *reinterpret_cast<qreal*>(_v) = _t->getSpanAngle(); break;
        case 3: *reinterpret_cast<qreal*>(_v) = _t->getMinValue(); break;
        case 4: *reinterpret_cast<qreal*>(_v) = _t->getMaxValue(); break;
        case 5: *reinterpret_cast<qreal*>(_v) = _t->getValue(); break;
        case 6: *reinterpret_cast<int*>(_v) = _t->getDialWidth(); break;
        case 7: *reinterpret_cast<QColor*>(_v) = _t->getBackgroundColor(); break;
        case 8: *reinterpret_cast<QColor*>(_v) = _t->getForegroundColor(); break;
        case 9: *reinterpret_cast<QColor*>(_v) = _t->getProgressColor(); break;
        case 10: *reinterpret_cast<QColor*>(_v) = _t->getTextColor(); break;
        case 11: *reinterpret_cast<QString*>(_v) = _t->getSuffixText(); break;
        case 12: *reinterpret_cast<bool*>(_v) = _t->isShowText(); break;
        case 13: *reinterpret_cast<Qt::PenCapStyle*>(_v) = _t->getPenStyle(); break;
        case 14: *reinterpret_cast<DialType*>(_v) = _t->getDialType(); break;
        case 15: *reinterpret_cast<QFont*>(_v) = _t->getTextFont(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setSize(*reinterpret_cast<qreal*>(_v)); break;
        case 1: _t->setStartAngle(*reinterpret_cast<qreal*>(_v)); break;
        case 2: _t->setSpanAngle(*reinterpret_cast<qreal*>(_v)); break;
        case 3: _t->setMinValue(*reinterpret_cast<qreal*>(_v)); break;
        case 4: _t->setMaxValue(*reinterpret_cast<qreal*>(_v)); break;
        case 5: _t->setValue(*reinterpret_cast<qreal*>(_v)); break;
        case 6: _t->setDialWidth(*reinterpret_cast<int*>(_v)); break;
        case 7: _t->setBackgroundColor(*reinterpret_cast<QColor*>(_v)); break;
        case 8: _t->setForegroundColor(*reinterpret_cast<QColor*>(_v)); break;
        case 9: _t->setProgressColor(*reinterpret_cast<QColor*>(_v)); break;
        case 10: _t->setTextColor(*reinterpret_cast<QColor*>(_v)); break;
        case 11: _t->setSuffixText(*reinterpret_cast<QString*>(_v)); break;
        case 12: _t->setShowText(*reinterpret_cast<bool*>(_v)); break;
        case 13: _t->setPenStyle(*reinterpret_cast<Qt::PenCapStyle*>(_v)); break;
        case 14: _t->setDialType(*reinterpret_cast<DialType*>(_v)); break;
        case 15: _t->setTextFont(*reinterpret_cast<QFont*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *RadialBar::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *RadialBar::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN9RadialBarE_t>.strings))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int RadialBar::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 15;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    }
    return _id;
}

// SIGNAL 0
void RadialBar::sizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void RadialBar::startAngleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void RadialBar::spanAngleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void RadialBar::minValueChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void RadialBar::maxValueChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void RadialBar::valueChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void RadialBar::dialWidthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void RadialBar::backgroundColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void RadialBar::foregroundColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void RadialBar::progressColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void RadialBar::textColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void RadialBar::suffixTextChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void RadialBar::penStyleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void RadialBar::dialTypeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void RadialBar::textFontChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}
QT_WARNING_POP

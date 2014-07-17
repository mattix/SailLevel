#include "settings.h"

Settings::Settings(QObject *parent) :
    QObject(parent)
{
    this->qSettings = new QSettings("mattix", "SailLevel", this);
    this->currentCalibrationFixX = this->qSettings->value("fixX", 0.0).toDouble();
    this->currentCalibrationFixY = this->qSettings->value("fixY", 0.0).toDouble();
}

double Settings::calibrationFixX()
{
    return this->currentCalibrationFixX;
}

void Settings::setcalibrationFixX(double fixX)
{
    this->currentCalibrationFixX = fixX;
    this->qSettings->setValue("fixX", fixX);
    calibrationFixXChanged();
}

double Settings::calibrationFixY()
{
    return this->currentCalibrationFixY;
}

void Settings::setcalibrationFixY(double fixY)
{
    this->currentCalibrationFixY = fixY;
    this->qSettings->setValue("fixY", fixY);
    calibrationFixYChanged();
}

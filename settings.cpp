#include "settings.h"

Settings::Settings(QObject *parent) :
    QObject(parent)
{
    this->qSettings = new QSettings("mattix", "SailLevel", this);
}

double Settings::calibrationFixX()
{
    return this->currentCalibrationFixX;
}

void Settings::setcalibrationFixX(double fixX)
{
    this->currentCalibrationFixX = fixX;
    calibrationFixXChanged();
}

double Settings::calibrationFixY()
{
    return this->currentCalibrationFixY;
}

void Settings::setcalibrationFixY(double fixY)
{
    this->currentCalibrationFixY = fixY;
    calibrationFixYChanged();
}

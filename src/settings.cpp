#include "settings.h"

Settings::Settings(QObject *parent) :
    QObject(parent)
{
    this->qSettings = new QSettings("harbour-saillevel", "SailLevel", this);
    loadSettings();
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

void Settings::loadSettings()
{
    this->currentCalibrationFixX = this->qSettings->value("fixX", 0.0).toDouble();
    calibrationFixXChanged();
    this->currentCalibrationFixY = this->qSettings->value("fixY", 0.0).toDouble();
    calibrationFixYChanged();
}

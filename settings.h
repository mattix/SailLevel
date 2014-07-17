#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double calibrationFixX READ calibrationFixX WRITE setcalibrationFixX NOTIFY calibrationFixXChanged)
    Q_PROPERTY(double calibrationFixY READ calibrationFixY WRITE setcalibrationFixY NOTIFY calibrationFixYChanged)
public:
    explicit Settings(QObject *parent = 0);
    double calibrationFixX();
    void setcalibrationFixX(double fixX);
    double calibrationFixY();
    void setcalibrationFixY(double fixY);
private:
    QSettings *qSettings;
    double currentCalibrationFixX, currentCalibrationFixY;
signals:
    void calibrationFixXChanged();
    void calibrationFixYChanged();

public slots:

};

#endif // SETTINGS_H

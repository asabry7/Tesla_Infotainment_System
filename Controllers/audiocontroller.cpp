#include "audiocontroller.h"

AudioController::AudioController(QObject *parent)
    : QObject{parent}
{
    m_volumeLevel = 54;
}

int AudioController::volumeLevel() const
{
    return m_volumeLevel;
}

void AudioController::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    emit volumeLevelChanged();
}

void AudioController::incrementVolumeLevel(const int& val)
{
    int newLevel = m_volumeLevel + val;
    if( newLevel < 0 )
    {
        newLevel = 0;
    }

    else if( newLevel > 100 )
    {
        newLevel = 100;
    }
    setVolumeLevel(newLevel);
}


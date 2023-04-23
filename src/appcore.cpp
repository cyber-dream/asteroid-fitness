#include "appcore.h"

AppCore::AppCore(QObject* parent) : QObject(parent)
{
    connect(this, &AppCore::updateStartButtonIcon, this, &AppCore::receiveFromQml);
}

void AppCore::receiveFromQml()
{
    // We increase the counter and send a signal with its value
    ++m_counter;
    emit sendToQml("Test");
}

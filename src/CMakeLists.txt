add_library(asteroid-helloworld main.cpp stepstracker.cpp stepstracker.h sensorthread.cpp sensorthread.h resources.qrc)
set_target_properties(asteroid-helloworld PROPERTIES PREFIX "" SUFFIX "")

target_link_libraries(asteroid-helloworld PUBLIC
	AsteroidApp)

install(TARGETS asteroid-helloworld
	DESTINATION ${CMAKE_INSTALL_BINDIR})

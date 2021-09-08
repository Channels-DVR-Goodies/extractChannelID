cmake_minimum_required( VERSION 3.10 )

project( extractChannelIDs )

add_executable( extractChannelIDs extractChannelIDs.c emitChannel.c emitChannel.h)
target_link_libraries( extractChannelIDs m cjson )

install( TARGETS extractChannelIDs
         RUNTIME DESTINATION /usr/bin)
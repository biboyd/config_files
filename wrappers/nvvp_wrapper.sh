#!/bin/bash

if [ $HOSTNAME == 'Otis' ]
then
	export PATH="/usr/lib/jvm/java-8-openjdk/jre/bin:$PATH"
	exec /opt/cuda/bin/nvvp "$@"
else
	nvvp
fi

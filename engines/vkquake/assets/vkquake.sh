#!/bin/bash

# Default config.cfg files for both Steam version of Quake and for
# vkQuake are really bad.
#
# TODO: detect screen resolution, because vkQuake's desktop resolution
#       mode and default resolution detection are broken.
#
if [ ! -f share/quake/id1/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/id1/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/id1/config.cfg
fi

if [ ! -d share/quake/id1/music ] ; then
    LD_PRELOAD="" ln -rsf ./rerelease/id1/music ./share/quake/id1/music
fi

if [ ! -e share/quake/id1/pak0.pak ] ; then
    echo "id1 pak0.pak link broken"
    if [ -f Id1/PAK0.PAK ] ; then
        echo "Found Id1/PAK0.PAK"
        LD_PRELOAD="" ln -rsf ./Id1/PAK0.PAK ./share/quake/id1/pak0.pak
        LD_PRELOAD="" ln -rsf ./Id1/PAK1.PAK ./share/quake/id1/pak1.pak
    fi
fi

if [ ! -f share/quake/rerelease/id1/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/rerelease/id1/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/rerelease/id1/config.cfg
fi

if [ ! -d share/quake/rerelease/id1/music ] ; then
    LD_PRELOAD="" ln -rsf ./rerelease/id1/music ./share/quake/rerelease/id1/music
fi

if [ ! -f share/quake/rogue/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/rogue/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/rogue/config.cfg
fi

if [ ! -d share/quake/rogue/music ] ; then
    LD_PRELOAD="" ln -rsf ./rerelease/rogue/music ./share/quake/rogue/music
fi

if [ ! -f share/quake/rerelease/rogue/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/rerelease/rogue/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/rerelease/rogue/config.cfg
fi

if [ ! -d share/quake/rerelease/rogue/music ] ; then
    LD_PRELOAD="" ln -rsf ./rerelease/rogue/music ./share/quake/rerelease/rogue/music
fi

if [ ! -f share/quake/hipnotic/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/hipnotic/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/hipnotic/config.cfg
fi

if [ ! -d share/quake/hipnotic/music ] ; then
    LD_PRELOAD="" ln -rsf ./rerelease/hipnotic/music ./share/quake/hipnotic/music
fi

if [ ! -f share/quake/rerelease/hipnotic/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/rerelease/hipnotic/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/rerelease/hipnotic/config.cfg
fi

if [ ! -d share/quake/rerelease/hipnotic/music ] ; then
    LD_PRELOAD="" ln -rsf ./rerelease/hipnotic/music ./share/quake/rerelease/hipnotic/music
fi

if [ ! -f share/quake/dopa/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/dopa/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/dopa/config.cfg
fi

if [ ! -f share/quake/rerelease/dopa/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/rerelease/dopa/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/rerelease/dopa/config.cfg
fi

if [ ! -f share/quake/rerelease/mg1/config.cfg ] ; then
	cp -f share/quake/default.lux.cfg share/quake/rerelease/mg1/config.cfg
	sed -i "s|%USER%|$USER|" share/quake/rerelease/mg1/config.cfg
fi

if [[ "$*" == *rerelease* ]]
then
    if [ ! -d share/quake/rerelease/QuakeEX.kpf ] ; then
        echo "Linking Quake kpf"
        ln -rsf ./rerelease/QuakeEX.kpf share/quake/rerelease/QuakeEX.kpf
    fi
    echo "Running re-release $2"
    ./vkquake -basedir share/quake/rerelease "$@"
else
    echo "Running non re-release"
    ./vkquake -basedir share/quake "$@"
fi

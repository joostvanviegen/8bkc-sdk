PocketSprite SDK
================

This is the SDK for the PocketSprite device.

WARNING
-------

At the moment, this is still very much in development. The basics are here, but things like the sound API and the
tile-based renderer can have their APIs changed at any time.

USING THIS
----------
You can read the documentation of the SDK and the various APIs it provides [here](http://pocketsprite-sdk.readthedocs.io/en/latest/).

[![Documentation Status](https://readthedocs.org/projects/pocketsprite-sdk/badge/?version=latest)](http://pocketsprite-sdk.readthedocs.io/en/latest/?badge=latest)

USING THE DOCKER CONTAINER
----------
Run from the folder of the app you are compiling:
docker run -v ./:/builddir 8bkc-builder

If you are using windows specify the full path instead of ./

If you need selinux support:
docker run -v ./:/builddir:z 8bkc-builder

#!/bin/bash

find . -depth 2 -name '.*' -exec cp -r {} ~/ \;


#!/bin/sh
export NODE_OPTIONS=--max_old_space_size=8192
env node zenbot.js $@

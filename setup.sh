#!/bin/bash

gannoy create -d $DIM -K $K -p /data table
gannoy-db -d /data

#!/bin/bash
set -e

# Use aarch32 repo because it also has aarch64
git clone --depth 1 https://github.com/openjdk/jdk8u openjdk

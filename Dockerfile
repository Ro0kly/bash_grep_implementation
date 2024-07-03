FROM ubuntu:latest

RUN apt-get update -y

RUN apt-get install -y gcc make check lcov valgrind
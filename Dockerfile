FROM danielguerra/alpine-sdk:2.6
MAINTAINER Daniel Guerra
ADD ./build /bin/build
CMD /bin/sh

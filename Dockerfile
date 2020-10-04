FROM debian:10
RUN apt update
#Install git
RUN apt install -y git && mkdir /root/esp && mkdir /builddir
#Intall esp-idf toolchain
RUN apt install -y gcc wget make libncurses-dev\
        flex bison gperf python python-pip\
        python-setuptools python-serial\
        python-cryptography python-future\
        python-pyparsing libffi-dev libssl-dev\
        vim-common
RUN cd /root/esp && git clone -b release/v3.3 --recursive https://github.com/espressif/esp-idf.git && \
        /root/esp/esp-idf/install.sh
#Install pocketsprite sdk
RUN apt install -y libgd-dev libxml2-dev imagemagick
RUN cd /root/esp && \
        git clone --recursive https://github.com/PocketSprite/8bkc-sdk.git
#Finishing up
ENV POCKETSPRITE_PATH=/root/esp/8bkc-sdk
ENV IDF_PATH=/root/esp/esp-idf
#ENV IDF_TOOLS_PATH="/root/.espressif/tools"
ENV PATH="/root/esp/esp-idf/components/esptool_py/esptool:${PATH}"
ENV PATH="/root/esp/esp-idf/components/espcoredump:${PATH}"
ENV PATH="/root/esp/esp-idf/components/partition_table/${PATH}"
ENV PATH="/root/esp/esp-idf:${PATH}"
ENV PATH="/root/.espressif/tools/xtensa-esp32-elf/1.22.0-96-g2852398-5.2.0/xtensa-esp32-elf/bin:${PATH}"
ENV PATH="/root/.espressif/tools/openocd-esp32/v0.10.0-esp32-20190313/openocd-esp32/bin/:${PATH}"
ENV PATH="/root/.espressif/tools/esp32ulp-elf/2.28.51.20170517/esp32ulp-elf-binutils/bin/:${PATH}"

VOLUME /builddir
CMD cd /builddir && make
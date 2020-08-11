FROM loads/alpine:3.8

LABEL maintainer="johnyn"

###############################################################################
#                                INSTALLATION
###############################################################################

# 设置固定的项目路径
ENV WORKDIR /var/www/main

# 添加应用可执行文件，并设置执行权限
ADD ./main   $WORKDIR/main
RUN chmod +x $WORKDIR/main
ADD config   $WORKDIR/config

###############################################################################
WORKDIR $WORKDIR
CMD ./main

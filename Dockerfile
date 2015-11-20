FROM centos:6
MAINTAINER "Jose Fonseca" <jfonseca@vmware.com>
ENV container docker

RUN yum -y update && yum clean all
RUN yum -y install zlib-devel libX11-devel make cmake && yum clean all

# https://www.softwarecollections.org/en/scls/rhscl/python27/
RUN yum -y localinstall https://www.softwarecollections.org/en/scls/rhscl/python27/epel-6-x86_64/download/rhscl-python27-epel-6-x86_64.noarch.rpm
RUN yum -y install python27-python && yum clean all
RUN /usr/bin/scl enable python27 true

# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/
RUN yum -y localinstall https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/epel-6-x86_64/download/rhscl-devtoolset-3-epel-6-x86_64.noarch.rpm
RUN yum -y install devtoolset-3-gcc devtoolset-3-binutils devtoolset-3-gcc-c++ && yum clean all
RUN /usr/bin/scl enable devtoolset-3 true

# Make sure the above SCLs are already enabled
ENTRYPOINT ["/usr/bin/scl", "enable", "python27", "devtoolset-3", "--"]
CMD ["/usr/bin/scl", "enable", "python27", "devtoolset-3", "--", "/bin/bash"]

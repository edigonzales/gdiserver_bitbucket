#!/bin/bash

# Update system
#apt-get update
#apt-get --yes dist-upgrade

# Add ubuntugis-unstable apt repository and keys
# Port 80 b/c of firewall.
#add-apt-repository --yes ppa:ubuntugis/ubuntugis-unstable
#apt-key adv --keyserver hkp://keyserver.ubuntu.com:80/ --recv-key 314DF160
#apt-get update

# Create a source and apps directory.
#mkdir ~/sources
#mkdir ~/Apps

# Install and configure PostGIS
#apt-get --yes install postgis postgresql-9.3-postgis-2.1
#apt-get --yes install pgadmin3

# Compile and install QGIS Master
#apt-get --yes build-dep qgis
#apt-get --yes install libqscintilla2-dev cmake-curses-gui cmake-qt-gui gdal-bin python-gdal python-qscintilla2 git

# Download NTv2 grids and copy to /usr/share/proj/
#apt-get --yes install proj-bin zip curl
#curl -O http://www.swisstopo.admin.ch/internet/swisstopo/de/home/products/software/software.parsys.7090.downloadList.55545.DownloadFile.tmp/chenyx06ntv2.zip
#unzip -d /usr/share/proj/ chenyx06ntv2.zip CHENYX06a.gsb

#apt-get --yes install gdal-bin
#gdalversion=`gdalinfo --version | awk -F ' '  '{ print $2 }' | awk -F . '{ print $1 "." $2 }'`
#echo "4149,CH1903,6149,CH1903,6149,9122,7004,8901,1,0,6422,1766,1,9603,674.374,15.056,405.346,,,," >> /usr/share/gdal/$gdalversion/gcs.override.csv

#git clone https://github.com/qgis/QGIS.git ~/sources/qgis_master
#mkdir ~/sources/qgis_master/build
#cd ~/sources/qgis_master/build
#cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/qgis_master -DCMAKE_INSTALL_RPATH=/usr/local/qgis_master/lib -DENABLE_TESTS=OFF -DWITH_SERVER=OFF -DWITH_CUSTOM_WIDGETS=ON -DWITH_PYSPATIALITE=ON -DWITH_QSPATIALITE=ON
#make -j2
#make install
#cd ~
#/usr/local/qgis_master/lib/qgis/crssync

# Install some additional stuff
#apt-get --yes install vim
#apt-get --yes install subversion
#apt-get --yes install geany
#apt-get --yes install qt4-designer qt4-qtconfig python-qt4-sql libqt4-sql-psql qt4-dev-tools
#apt-get --yes install python-psycopg2

# PDAL (w/ all its dependencies)
# laszip
#apt-get install --yes autoconf build-essential cmake docbook-mathml docbook-xsl libboost-dev libboost-all-dev libboost-filesystem-dev libboost-timer-dev libcgal-dev libcunit1-dev libgdal-dev libgeos++-dev libgeotiff-dev libgmp-dev libjson0-dev libjson-c-dev liblas-dev libmpfr-dev libopenscenegraph-dev libpq-dev libproj-dev libxml2-dev postgresql-server-dev-9.3 xsltproc git build-essential wget
#cd ~
#wget https://github.com/LASzip/LASzip/releases/download/v2.2.0/laszip-src-2.2.0.tar.gz
#tar xvfz laszip-src-2.2.0.tar.gz -C ~/sources/
#cd ~/sources/laszip-src-2.2.0/
#./configure
#make 
#make install
#cd ~
#mkdir /usr/local/include/laszip
#cp /usr/local/include/las*.hpp /usr/local/include/laszip/

# liblas
#cd ~
#wget http://download.osgeo.org/liblas/libLAS-1.8.0.tar.bz2
#tar xvfj libLAS-1.8.0.tar.bz2 -C ~/sources/
#mkdir ~/sources/libLAS-1.8.0/build
#cd ~/sources/libLAS-1.8.0/build
#cmake .. -DWITH_GDAL=ON -DWITH_GEOTIFF=ON -DWITH_LASZIP=ON -DWITH_UTILITIES=ON
#make
#make install
#cd ~

# points2grid 
#git clone https://github.com/CRREL/points2grid.git ~/sources/points2grid
#mkdir ~/sources/points2grid/build
#cd ~/sources/points2grid/build
#cmake .. -DWITH_GDAL=ON 
#make
#make install
#cd ~

# hexer
#git clone https://github.com/hobu/hexer.git ~/sources/hexer
#mkdir ~/sources/hexer/build
#cd ~/sources/hexer/build
#cmake .. -DCMAKE_BUILD_TYPE=Release
#make
#make install
#cd ~

# pdal
#git clone https://github.com/PDAL/PDAL.git ~/sources/pdal
#mkdir ~/sources/pdal/build
#cd ~/sources/pdal/build
#cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_PLUGIN_HEXBIN=ON -DBUILD_PLUGIN_P2G=ON -DBUILD_PLUGIN_PGPOINTCLOUD=ON -DBUILD_PLUGIN_PYTHON=ON -DBUILD_PLUGIN_SQLITE=ON -DWITH_APPS=ON -DWITH_GEOTIFF=ON -DWITH_LASZIP=ON
#make -j2
#make install
#cd ~

# I think we need to to the java/groovy stuff at the end
# since gvm needs to write some lines into .bashrc on 
# the last line.

# Install Oracle Java (silent option for accepting license)
#add-apt-repository --yes ppa:webupd8team/java
#apt-get update
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#apt-get --yes install oracle-java8-installer

# Install native JAI
#cd ~
#wget https://www.dropbox.com/s/7mwcvtreipufy0u/jai-1_1_3-lib-linux-amd64-jdk.bin?dl=0 -O jai-1_1_3-lib-linux-amd64-jdk.bin
#cp jai-1_1_3-lib-linux-amd64-jdk.bin /usr/lib/jvm/java-8-oracle/
#cd /usr/lib/jvm/java-8-oracle/
#sudo su
#sh ./jai-1_1_3-lib-linux-amd64-jdk.bin >/dev/null < <(echo y) >/dev/null < <(echo y)
#sudo su stefan
#cd ~

#cd ~
#wget https://www.dropbox.com/s/arpsxaumi0f9hzp/jai_imageio-1_1-lib-linux-amd64-jdk.bin?dl=0 -O jai_imageio-1_1-lib-linux-amd64-jdk.bin
#sed s/+215/-n+215/ jai_imageio-1_1-lib-linux-amd64-jdk.bin > jai_imageio-1_1-lib-linux-amd64-jdk-fixed.bin
#cp jai_imageio-1_1-lib-linux-amd64-jdk-fixed.bin /usr/lib/jvm/java-8-oracle/
# _POSIX2_VERSION=199209 sh ./jai_imageio-1_1-lib-linux-amd64-jdk-fixed.bin >/dev/null < <(echo y) >/dev/null < <(echo y)
#cd ~

# Maven
#cd ~
#wget http://mirror.switch.ch/mirror/apache/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -O apache-maven-3.3.3-bin.tar.gz
#tar xvfz apache-maven-3.3.3-bin.tar.gz -C ~/Apps/
#chown -R stefan:stefan ~/Apps/apache-maven-3.3.3/
#chmod +rx -R ~/Apps/apache-maven-3.3.3/
#echo "export PATH=$PATH:/home/stefan/Apps/apache-maven-3.3.3/bin" >> /home/stefan/.bashrc
#cd ~

# GVM
#cd ~
#curl -s get.gvmtool.net | bash
#source "/home/stefan/.gvm/bin/gvm-init.sh"
#chown -R stefan:stefan ~/.gvm
#echo "gvm_auto_answer=true" >> ~/.gvm/etc/config
#cd ~

# Groovy
#cd ~
#gvm install groovy

# Gradle
#cd ~
#gvm install gradle

# Geoscript


# Eclipse
# DOES NOT WORK! Direct LINK needed!!!!
#cd ~
#wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz&mirror_id=1208 -O eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz
#tar xvfz eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz ~/Apps/
#cd ~

# Fonts...



# eclipse...

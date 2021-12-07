sudo mkdir -p /opt/oracle
cd /opt/oracle

# TODO: 인터넷 경로로 다운받아 압축푸는 방법으로 변경
mv instantclient-basic-linux.x64-11.2.0.4.0.zip /opt/oracle
mv instantclient-sqlplus-linux.x64-11.2.0.4.0.zip /opt/oracle
cd /opt/oracle
unzip instantclient-basic-linux.x64-11.2.0.4.0.zip
unzip instantclient-sqlplus-linux.x64-11.2.0.4.0.zip
cd /opt/oracle/instantclient_11_2
ln -s libclntsh.so.11.1 libclntsh.so
ln -s libocci.so.11.1 libocci.so
sudo apt-get update
sudo apt-get install libaio1
sh -c "echo /opt/oracle/instantclient_11_2 > /etc/ld.so.conf.d/oracle-instantclient.conf"
sudo ldconfig
export LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2:$LD_LIBRARY_PATH
export PATH=/opt/oracle/instantclient_11_2:$PATH
#! bin/sh
KDC=kerberos.example.com
KHOST=hdfs.example.com
KSN=hdfs
REALM=EXAMPLE.COM
KTAB=/hdfs.keytab
DBNAME=docker

echo "[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log
[libdefaults]
 default_realm = $REALM
 dns_lookup_realm = false
 dns_lookup_kdc = false
 ticket_lifetime = 24h
 forwardable = true
[realms]
 $REALM = {
  kdc = $KDC
  admin_server = $KDC
 }
 [domain_realm]
 .example.com = $REALM
 example.com = $REALM" | tee /etc/krb5.conf

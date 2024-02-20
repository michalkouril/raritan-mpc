#!/bin/bash

# unsupportedjar=base64_com_sun_ssl.jar
# /usr/bin/java -Djava.security.properties=./java.security --patch-module jdk.unsupported=$unsupportedjar -Djdk.tls.client.cipherSuites=SSL_RSA_WITH_RC4_128_MD5  -Dcom.sun.net.ssl.checkRevocation=false  -Xmn128M -Xmx512M -XX:MaxHeapFreeRatio=70 -XX:MinHeapFreeRatio=50 -classpath sMpc.jar:AmpPb.jar:jaws.jar:sClientLib.jar:sFoxtrot.jar:jsse.jar --add-opens=java.desktop/java.awt=ALL-UNNAMED --add-exports jdk.unsupported/com.sun.net.ssl.internal.ssl=ALL-UNNAMED --add-exports java.base/sun.security.jca=ALL-UNNAMED --add-exports java.base/sun.security.ssl=ALL-UNNAMED --add-exports java.security.jgss/sun.security.jgss=ALL-UNNAMED com.raritan.rrc.ui.RRCApplication

MPC=5.0.6.5.29
NAME=RaritanClient5

# java -jar packr-all-4.0.0.jar 
java -jar Packr-4.1.0-SNAPSHOT-all.jar \
     --platform mac \
     --jdk OpenJDK21U-jdk_aarch64_mac_hotspot_21.0.2_13.tar.gz \
     --executable $NAME \
     --icon $MPC/Raritan.icns \
     --classpath $MPC/Java/AmpPb.jar \
     --classpath $MPC/Java/sMpc.jar \
     --classpath $MPC/Java/jaws.jar \
     --classpath $MPC/Java/sClientLib.jar \
     --classpath $MPC/Java/sFoxtrot.jar \
     --classpath $MPC/Java/jsse.jar \
     --classpath $MPC/Java/base64_com_sun_ssl.jar \
     --resources $MPC/Java/java.security \
     --mainclass com.raritan.rrc.ui.RRCApplication \
     --vmargs Djava.security.properties=../Resources/java.security \
     --vmargs "patch-module=jdk.unsupported=../Resources/base64_com_sun_ssl.jar" \
     --vmargs Djdk.tls.client.cipherSuites=SSL_RSA_WITH_RC4_128_MD5 \
     --vmargs Dcom.sun.net.ssl.checkRevocation=false   \
     --vmargs Xmn128M  \
     --vmargs Xmx512M  \
     --vmargs XX:MaxHeapFreeRatio=70  \
     --vmargs XX:MinHeapFreeRatio=50  \
     --vmargs "add-opens=java.desktop/java.awt=ALL-UNNAMED"  \
     --vmargs "add-exports=jdk.unsupported/com.sun.net.ssl.internal.ssl=ALL-UNNAMED"  \
     --vmargs "add-exports=java.base/sun.security.jca=ALL-UNNAMED"  \
     --vmargs "add-exports=java.base/sun.security.ssl=ALL-UNNAMED"  \
     --vmargs "add-exports=java.security.jgss/sun.security.jgss=ALL-UNNAMED" \
     --output $NAME.app

     # --useZgcIfSupportedOs \

echo "Don't forget to edit $NAME.app/Contents/Resources/$NAME.json -- ensure double '--' in front of patch and add"

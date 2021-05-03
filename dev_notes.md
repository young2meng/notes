
# cmd 

标签（空格分隔）： notes

---

# open topic
构建、scons、make、configure
openwrt make project
rootfs

# tpm question
?
	-hi	hierarchy (o, p)
		o owner, p platform
?
an RSA 2048 sha256 storage key under the primary key

 ?  -ipem   PEM format key pair
how to sign and read public part?
if needs to persistent?
    s1: generate key pair
    s2: read public part
    s3: after sign?

sign without TPM

考虑用其他pkcs11 替代该库，比较大:
https://github.com/irtimmer/tpm2-pk11

1\using python?:
https://github.com/tpm2-software/tpm2-pkcs11/tree/master/tools
2\is abrmd needs?
3\?
    mbedtls

- tpm2 question DA protection 
pi@raspberrypi:~/tpm $ tpm2pkcs11-tool --label="label" --test --pin mynewpin
Using slot 0 with a present token (0x1)
WARNING:esys:src/tss2-esys/api/Esys_Load.c:324:Esys_Load_Finish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Load.c:112:Esys_Load() Esys Finish ErrorCode (0x00000921)
ERROR: Esys_Load: tpm:warn(2.0): authorizations for objects subject to DA protection are not allowed at this time because the TPM is in DA lockout mode:
error: PKCS11 function C_Login failed: rv = CKR_GENERAL_ERROR (0x5)
Aborting.
pi@raspberrypi:~/tpm $

# tpm调试命令
Q:
1、固件大小是否有影响：当前glib编完1.2M+1.5M
系统起来后，首次初始化不成功
1、FAE：怀疑是芯片初始化未完成，考虑配置完spi后，等待1ms；或者查询失败后，继续查询，直到超时；

初始化:
	系统重启前，
     1、需要下发shutdown 命令给tpm芯片，且等到tpm芯片返回结果后，再执行真正的重启；
		(否则 认为是被攻击，且里面有累计计数，对外部反应会慢;当系统正常后，累计计数会再减去，但是也会比较慢)
	系统重启后，
     2、重启tpm芯片需要reset的动作，通过RST管脚
       (系统已经重启，如果tpm不重启，那么tpm芯片的内部状态时之前的状态，系统起来后，load时会失败，因为已经加载过来)

当前方案：

1）在boot阶段 进行rst 及 start up
2）无shutdown命令

当前方案：
1)在boot阶段 进行rst
2)系统起来，发startup
3)系统重启，发shutdown

清空操作：
    TPM2_Clear: 清空所有内容，回复出厂设置
    TPM2_FlushContext:清空除 持久化存储内的其他handle

platform and owner 关系？
platformAuth, platformPolicy
ownerAuth, ownerPolicy

test:

./startup

/usr/bin/createprimary -hi p -pwdk J0wPxvsH
    output:
        /app/testtpm # ls
        h80000000.bin   hp80000000.bin  startup

/usr/bin/evictcontrol -ho 80000000 -hp 81800000 -hi p
    output: 
        R d40018: 04000394
        R d40024: 4c
        R d40018: 04004084
        W d40018: 00000040
        R d40018: 04004044
        evictcontrol: failed, rc 0000014c
        TPM_RC_NV_DEFINED - NV Index or persistent object already defined

/usr/bin/evictcontrol -ho 80000000 -hp 81900000 -hi p
    output:
        /app/testtpm # ls
        h80000000.bin   hp80000000.bin  startup
        h81900000.bin   hp81900000.bin

/app/testtpm # echo 123456712345678 > test_key_file
/app/testtpm # cat test_key_file 
        123456712345678
        /app/testtpm # 
        /app/testtpm # ls
        h80000000.bin   hp80000000.bin  startup
        h81900000.bin   hp81900000.bin  test_key_file

/app/testtpm # create -hp 81900000 -bl -kt f -kt p -opr tmppriv.bin -opu tmppub.bin -pwdp J0wPxvsH -pwdk n6CvRlMK -if test_key_file
   output: 
    /app/testtpm # ls
    h80000000.bin   hp80000000.bin  startup         tmppriv.bin
    h81900000.bin   hp81900000.bin  test_key_file   tmppub.bin

/app/testtpm # /usr/bin/load -hp 81900000 -ipr tmppriv.bin -ipu tmppub.bin -pwdp J0wPxvsH
    output:
        Handle 80000002
        /app/testtpm # ls
        h80000000.bin   hp80000000.bin  startup         tmppub.bin
        h80000002.bin   hp80000002.bin  test_key_file
        h81900000.bin   hp81900000.bin  tmppriv.bin

/app/testtpm # /usr/bin/unseal -ha 80000002  -pwd n6CvRlMK  -of  date_unsealed
    output:
        R d40018: 04004044/app/testtpm # ls
        date_unsealed   h81900000.bin   hp81900000.bin  tmppriv.bin
        h80000000.bin   hp80000000.bin  startup         tmppub.bin
        h80000002.bin   hp80000002.bin  test_key_file
        /app/testtpm # cat date_unsealed 
        123456712345678
# test tpm2

/app/testtpm # ./startup -h

startup

Runs TPM2_Startup
                [-c startup clear (default)]
                [-s startup state]
                [-st run TPM2_SelfTest]
                [-sto run only TPM2_SelfTest (no startup)]

                /app/testtpm # ./startup -sto -v
                TSS_Execute: Command 00000143 marshal
                TSS_Execute_valist: Step 1: initialization
                TSS_Execute_valist: Step 5: command encrypt
                TSS_Sessions_GetDecryptSession: Found 0 decrypt sessions at 0
                TSS_Execute_valist: Step 6 calculate HMACs
                TSS_Execute_valist: Step 7 set command authorizations
                TSS_Execute_valist: Step 8: process the command
                TSS_AuthExecute: Executing TPM2_SelfTest
                TSS_Dev_ReceiveCommand: rc 00000000
                TSS_Execute_valist: Step 9 get response authorizations
                TSS_Execute_valist: Step 13: response decryption
                TSS_Sessions_GetEncryptSession: Found 0 encrypt sessions at 0
                TSS_Execute: Command 00000143 unmarshal
                TSS_Execute: Command 00000143 post processor
                TSS_Dev_Close: Closing /dev/spidev32766.2
                startup: success
# test ECC

# delete persistent handle

## delete handle 81800000 failure because of missing file
        /app/testtpm # /usr/bin/evictcontrol -ho 81800000 -hp 81800000 -hi p -v
        TSS_Execute: Command 00000120 marshal
        TSS_Execute_valist: Step 1: initialization
        TSS_Execute_valist: Step 2: authorization 0
        TSS_Execute_valist: session 0 handle 40000009
        TSS_Execute_valist: Step 5: command encrypt
        TSS_Sessions_GetDecryptSession: Found 0 decrypt sessions at 0
        TSS_Execute_valist: Step 6 calculate HMACs
        TSS_HmacSession_SetHMAC: Step 6 session 40000009
        TSS_Execute_valist: Step 7 set command authorizations
        TSS_Execute_valist: Step 8: process the command
        TSS_AuthExecute: Executing TPM2_EvictControl
        TSS_Dev_Open: Opening /dev/spidev32766.2
        spi_tpm_330_open
        SpiOpenPort
        Connected to device vid:did:rid of 1b4e:0501:21
        TSS_Dev_SendCommand: TPM2_EvictControl
      TSS_Dev_ReceiveCommand: rc 00000000
      TSS_Execute_valist: Step 9 get response authorizations
      TSS_Execute_valist: Step 10: process response authorization 40000009
      TSS_Execute_valist: Step 13: response decryption
      TSS_Sessions_GetEncryptSession: Found 0 encrypt sessions at 0
      TSS_Execute: Command 00000120 unmarshal
      TSS_Execute: Command 00000120 post processor
      TSS_PO_EvictControl: object 81800000 persistent 81800000
      TSS_DeleteHandle: delete Name file ./h81800000.bin
      TSS_Dev_Close: Closing /dev/spidev32766.2
      evictcontrol: failed, rc 000b0016
      TSS_RC_FILE_REMOVE - A file remove failed

## delete handle 81800000 success
    /app/testtpm # ls
    date_unsealed   h81900000.bin   hp81900000.bin  tmppriv.bin
    h80000000.bin   hp80000000.bin  startup         tmppub.bin
    h80000002.bin   hp80000002.bin  test_key_file
    /app/testtpm # 
    /app/testtpm # /usr/bin/evictcontrol -ho 81900000 -hp 819000000 -hi p -v
    TSS_Execute: Command 00000120 marshal
    TSS_Marshal: Invalid command parameter
    evictcontrol: failed, rc 000001c4
    TPM_RC_VALUE - value is out of range or is not correct for the context Parameter number 1
    /app/testtpm # /usr/bin/evictcontrol -ho 81900000 -hp 81900000 -hi p -v
    TSS_Execute: Command 00000120 marshal
    TSS_Execute_valist: Step 1: initialization
    TSS_Execute_valist: Step 2: authorization 0
    TSS_Execute_valist: session 0 handle 40000009
    TSS_Execute_valist: Step 5: command encrypt
    TSS_Sessions_GetDecryptSession: Found 0 decrypt sessions at 0
    TSS_Execute_valist: Step 6 calculate HMACs
    TSS_HmacSession_SetHMAC: Step 6 session 40000009
    TSS_Execute_valist: Step 7 set command authorizations
    TSS_Execute_valist: Step 8: process the command
    TSS_AuthExecute: Executing TPM2_EvictControl
    TSS_Dev_Open: Opening /dev/spidev32766.2
    spi_tpm_330_open
    SpiOpenPort

    R d40f00: 05011b4e
    R d40000: a1
    W d40000: 20
    R d40000: 81
    W d40000: 02
    R d40000: a1
    R d40018: 04004044
    R d40f04: 21
    Connected to device vid:did:rid of 1b4e:0501:21
    TSS_Dev_SendCommand: TPM2_EvictControl
      TSS_Dev_ReceiveCommand: rc 00000000
      TSS_Execute_valist: Step 9 get response authorizations
      TSS_Execute_valist: Step 10: process response authorization 40000009
      TSS_Execute_valist: Step 13: response decryption
      TSS_Sessions_GetEncryptSession: Found 0 encrypt sessions at 0
      TSS_Execute: Command 00000120 unmarshal
      TSS_Execute: Command 00000120 post processor
      TSS_PO_EvictControl: object 81900000 persistent 81900000
      TSS_DeleteHandle: delete Name file ./h81900000.bin
      TSS_DeleteHandle: delete public file ./hp81900000.bin
      TSS_Dev_Close: Closing /dev/spidev32766.2
      evictcontrol: success

      /app/testtpm # ls
      date_unsealed   hp80000000.bin  test_key_file
      h80000000.bin   hp80000002.bin  tmppriv.bin
      h80000002.bin   startup         tmppub.bin

# flushcontext
/app/testtpm # ls
date_unsealed   hp80000000.bin  test_key_file   tmppub.bin
h80000000.bin   startup         tmppriv.bin
/app/testtpm # flushcontext -ha 80000000 -v
TSS_Execute: Command 00000165 marshal
TSS_Execute_valist: Step 1: initialization
TSS_Execute_valist: Step 5: command encrypt
TSS_Sessions_GetDecryptSession: Found 0 decrypt sessions at 0
TSS_Execute_valist: Step 6 calculate HMACs
TSS_Execute_valist: Step 7 set command authorizations
TSS_Execute_valist: Step 8: process the command
TSS_AuthExecute: Executing TPM2_FlushContext
TSS_Dev_Open: Opening /dev/spidev32766.2
spi_tpm_330_open
SpiOpenPort
Connected to device vid:did:rid of 1b4e:0501:21
TSS_Dev_SendCommand: TPM2_FlushContext
TSS_Dev_ReceiveCommand: rc 00000000
TSS_Execute_valist: Step 9 get response authorizations
TSS_Execute_valist: Step 13: response decryption
TSS_Sessions_GetEncryptSession: Found 0 encrypt sessions at 0
TSS_Execute: Command 00000165 unmarshal
TSS_Execute: Command 00000165 post processor
TSS_PO_FlushContext: flushHandle 80000000
TSS_DeleteHandle: delete Name file ./h80000000.bin
TSS_DeleteHandle: delete public file ./hp80000000.bin
TSS_Dev_Close: Closing /dev/spidev32766.2
flushcontext: success
/app/testtpm # ls
date_unsealed  startup        test_key_file  tmppriv.bin    tmppub.bin
/app/testtpm # 

# clear (include persistent handle)
/app/testtpm # cleartpm330  -hi p -v -h

clear

Runs TPM2_Clear

	-hi authhandle hierarchy (l, p)
		l lockout, p platform
	-pwda authorization password (default empty)

	-se[0-2] session handle / attributes (default PWAP)
		01 continue
/app/testtpm # cleartpm330 -hi p -v
TSS_Execute: Command 00000126 marshal
TSS_Execute_valist: Step 1: initialization
TSS_Execute_valist: Step 2: authorization 0
TSS_Execute_valist: session 0 handle 40000009
TSS_Execute_valist: Step 5: command encrypt
TSS_Sessions_GetDecryptSession: Found 0 decrypt sessions at 0
TSS_Execute_valist: Step 6 calculate HMACs
TSS_HmacSession_SetHMAC: Step 6 session 40000009
TSS_Execute_valist: Step 7 set command authorizations
TSS_Execute_valist: Step 8: process the command
TSS_AuthExecute: Executing TPM2_Clear
TSS_Dev_Open: Opening /dev/spidev32766.2
spi_tpm_330_open
TSS_Dev_ReceiveCommand: rc 00000000
TSS_Execute_valist: Step 9 get response authorizations
TSS_Execute_valist: Step 10: process response authorization 40000009
TSS_Execute_valist: Step 13: response decryption
TSS_Sessions_GetEncryptSession: Found 0 encrypt sessions at 0
TSS_Execute: Command 00000126 unmarshal
TSS_Execute: Command 00000126 post processor
TSS_Dev_Close: Closing /dev/spidev32766.2
clear: success
/app/testtpm # 
# shutdown (tpm)

/app/testtpm # ./shutdown --help

--help is not a valid option

shutdown

Runs TPM2_Shutdown

	-c shutdown clear (default)
	-s shutdown state
/app/testtpm # 
/app/testtpm # ./shutdown -c -v
TSS_Execute: Command 00000145 marshal
TSS_Execute_valist: Step 1: initialization
TSS_Execute_valist: Step 5: command encrypt
TSS_Sessions_GetDecryptSession: Found 0 decrypt sessions at 0
TSS_Execute_valist: Step 6 calculate HMACs
TSS_Execute_valist: Step 7 set command authorizations
TSS_Execute_valist: Step 8: process the command
TSS_AuthExecute: Executing TPM2_Shutdown
TSS_Dev_Open: Opening /dev/spidev32766.2
spi_tpm_330_open
SpiOpenPort

R d40f00: 05011b4e
R d40000: a1
W d40000: 20
R d40000: 81
W d40000: 02
R d40000: a1
R d40018: 04004044
R d40f04: 21
Connected to device vid:did:rid of 1b4e:0501:21
TSS_Dev_SendCommand: TPM2_Shutdown


R d40000: a1
W d40000: 20
R d40000: 81
W d40000: 02
R d40000: a1
W d40018: 00000040
R d40018: 04004044 04004044
W d40024: 80 01 00 00 00 0c 00 00 01 45 00 00
R d40018: 04004084
W d40018: 00000020
R d40018: 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04004004 04000c94TSS_Dev_ReceiveCommand:

R d40024: 80 01 00 00 00 0a
R d40018: 04000694
R d40024: 00 00 00
R d40018: 04000394
R d40024: 00
R d40018: 04004084
W d40018: 00000040
R d40018: 04004044
TSS_Dev_ReceiveCommand: rc 00000000
TSS_Execute_valist: Step 9 get response authorizations
TSS_Execute_valist: Step 13: response decryption
TSS_Sessions_GetEncryptSession: Found 0 encrypt sessions at 0
TSS_Execute: Command 00000145 unmarshal
TSS_Execute: Command 00000145 post processor
TSS_Dev_Close: Closing /dev/spidev32766.2
shutdown: success
/app/testtpm # 

/app/data/confGen_China.sh_enc
/usr/bin/openssl aes-256-cbc -d -salt -in /app/data/confGen_China.sh_enc -out confGen_China -k

# tpm2-tools 

tpm2_load --parent 0x81800000 --privfile /app/config/tmppriv.bin --pubfile /app/config/tmppub.bin --pwdp J0wPxvsH
tpm2_load  -C primary.ctx -u key.pub -r key.priv -c key.ctx
tpm2_load  -C 0x81800000  -u  /app/config/tmppub.bin  -r /app/config/tmppriv.bin -c J0wPxvsH
/usr/bin/load -hp 81800000 -ipr /app/config/tmppriv.bin -ipu /app/config/tmp

/usr/bin/tpm2_load --parent 0x81800000 --privfile /app/config/tmppriv.bin --pubfile /app/config/tmppub.bin --pwdp J0wPxvsH

/usr/bin/tpm2_evictcontrol --auth p --handle 0x80000000 --persistent 0x81800000

# 软件加密和签名
- todo
- tpm
seal   ： 创建handle -->session- 
unseal : 为了使用
1、ibmtss 应使用命令行，不使用api?
2、展示的话，需要核实是否和当前的使用冲突？

# tpm learn
- ibmtpm
./autogen.sh
./configure --disable-hwtpm --disable-tpm-1.2
    Configuration:
        CFLAGS:		-DTPM_POSIX -g -O2
        tpm12:		no
        tpm20:		yes
        hwtpm:		no
        rmtpm:		yes
        nofile:		no
        noprint:	no
        nocrypto:	no
        noecc:		no

make
- ibmtss
 
- not find header file
 may not install dev version
 https://www.raspberrypi.org/forums/viewtopic.php?p=296034

- install tpm2 on raspeberry
config.status: creating lib/tss2-rc.pc
config.status: creating lib/tss2-tctildr.pc
config.status: creating lib/tss2-fapi.pc
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands

    tpm2-tss 2.4.1
    esapi:              yes
    fapi:               yes
    tctidefaultmodule:  libtss2-tcti-default.so
    tctidefaultconfig:
    unit:               no
    fuzzing:            none
    debug:              no
    maxloglevel:        trace
    doxygen:            1
    tcti-device-async:  no
    tcti-partial-read:  no
    crypto backend:     ossl
    sysconfdir:         ${prefix}/etc
    localstatedir:      ${prefix}/var
    runstatedir:        ${localstatedir}/run
    sysusersdir:        ${prefix}/etc/sysusers.d
    tmpfilesdir:        ${prefix}/etc/tmpfiles.d
    userstatedir:       $HOME/.local/share

- pkcs11 standard
http://docs.oasis-open.org/pkcs11/pkcs11-base/v2.40/os/pkcs11-base-v2.40-os.html

- learn install 
TPM模拟器和TPM2-TSS安装
https://blog.csdn.net/jianming21/article/details/107942585#t0
tpm2-pkcs11:
https://azure.github.io/iot-identity-service/dev/running/pkcs11/tpm2-pkcs11/
- makefile configure
https://github.com/Keyyo-Private/tpm2-packages

cd tpm2-tss-2.1.0/
./configure --enable-unit --enable-integration --with-maxloglevel=debug
sudo make check

- csr
未找到 openssl + public key 直接生成csr的案例；
""CSRs are signed using the private key to prevent tampering in transit to the CA. Accordingly, you need the private key to create one.""
按照当前的TPM方案，需要适配openssl对应的engine, 通过tpm生成csr.
https://security.stackexchange.com/questions/116356/csr-with-only-public-key-with-openssl
https://developers.yubico.com/YubiHSM2/Usage_Guides/OpenSSL_with_pkcs11_engine.html
https://support.nitrokey.com/t/how-to-generate-csr-with-the-smart-card-hsm/158/2
涉及的库：
opensc- 提供pkcs11-tool 及 engine
其他
https://stackoverflow.com/questions/41228763/how-is-private-key-read-out-from-a-pkcs11-module-in-openssl

# build system
- tools
  GNU Autotools: 应用在Unix-like systems.
      1.1   GNU Autoconf
      1.2   GNU Automake
      1.3   GNU Libtool
      https://www.gnu.org/prep/standards/html_node/Directory-Variables.html
  cmake ：跨平台
  scons :需要python支持
 - openwrt
    makefile 格式及调用关系
    编译流程

# system initialization
https://www.debian.org/doc/manuals/debian-reference/ch03.en.html

# 配置tpm2-abrmd ,dbus
- dbus
https://www.freedesktop.org/wiki/Software/dbus/#documentation
http://www.linuxfromscratch.org/blfs/view/svn/general/dbus.html
/usr/local/sbin/tpm2-abrmd --tcti=“libtss2-tcti-mssim.so.0:host=127.0.0.1,port=2321
# how to use mbedtls
https://github.com/aws/aws-iot-device-sdk-embedded-C
# pointer
处理engine时需要注意指针，作用域最好是在一块，否则容易出问题


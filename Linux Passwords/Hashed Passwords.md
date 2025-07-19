##### Encrypted Base 64 Password (For Secrets)
```bash
echo -n 'username' | base64
```
##### should spit out something like this
```bash
dXNlcm5hbWU=
```

#### Repeat for password
```bash
echo -n 'plaintextpassword' | base64
```
##### should spit out somehting like this
```bash
cGxhaW50ZXh0cGFzc3dvcmQ=
```

##### To make an Encrypted Hashed Password
```bash
echo 'password' | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 -salt -pass pass:'saltpassword'
```
will print $HASHED_PASSWORD hashed password

##### To Decrypt Hashed Password
```bash
echo $HASHED_PASSWORD | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:'saltpassword'
```

##### Send to TXT File Encrypted Contents
```bash
echo '$ENCRYPTED_DATA' | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 -salt -pass pass:'saltpassword' > .secret_vault.txt
```
###### Test that it's there
```bash
cat .secret_vault.txt | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:'saltpassword'
```
##### Insert new hashed password for user
```bash
useradd -c “Jackie McArthur” -m -p “encryptedpassword” -s “/bin/bash” jmcarthur
```

##### Encrypting Text Strings (OpenSSL)
```bash
echo SUPER SECRET SEED | openssl enc -aes-256-cbc -a -salt -pass pass:SUPERSECRETPASS
```
will print U2FsdGVkX1/Bg8w1+xbayoWfHJ+ueex/GcPvz5YfilceRj6mwB8fib0H1sJ8soyh

##### Decrypt Text Strings (OpenSSL)
```bash
echo U2FsdGVkX1/Bg8w1+xbayoWfHJ+ueex/GcPvz5YfilceRj6mwB8fib0H1sJ8soyh | openssl enc -aes-256-cbc -a -d -salt -pass pass:SUPERSECRETPASS
```

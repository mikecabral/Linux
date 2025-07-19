#### **Compiling an Executable from Source**

##### First Step After Extracting
```bash
./configure
```
**./configure** – prepares installation files to be compiled

1. Checks your system to make sure all the necessary component required to compile the program are available.  
2. Creates a very important file called **MakeFile**.  

##### **Makefile** file contains **specific** **instructions** for **how** the **executable** should be **compiled** to run on your platform.

#### Second Step. Run the make program**  
```bash
make
```
  
#### Installing the Executable - **to actually install the program on your system**  
```bash
make install
```

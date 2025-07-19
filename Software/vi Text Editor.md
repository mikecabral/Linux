### **Using vi Text Editor**

##### **The vi Modes**
Command mode
Command-line mode
Insert mode
Replace mode

### Enter Insert Mode
I, INSERT, S, O, A

##### **pressing INSERT twice enters REPLACE mode**

### Enter Command-Line Mode
**:**

### Quitting Commands

**exit** – writes the current file and then closes vi
**wq** – also writes the current file to disk and closes vi
**q** – closes vi without saving the current file. (only if file not modified. If modified q!
**w!** - overwrites the current file
**e!** - forgets changes since the last write

### Enable Syntax Checker

**:syntax on**
**:syntax off**

### **Working in Command Mode**

**dw** – **deletes** the **word** the comes **immediately** **after** the **cursor**, **including** the **space** following the word. Text is **saved** in a **memory** **buffer**.
**de** – **deletes** the **word** that comes **immediately** **after** the **cursor**, **not** **including** the **space**. The text is **saved** in a **memory** **buffer**.
**d$** - **deletes** **from** the **insertion** **point** to the **end** of the **line**. The text is **saved** in a **memory** **buffer**.
**dd** – **deletes** the **entire** **current** **line**. The text is **saved** in a **memory** **buffer**.
**p** – **inserts** the **text** **deleted** in the **last** **deletion** operation **after** the current **cursor** **location**
**u** – **undoes** the **last** **action**
**d** – **deletes** the **rest** of the **current** **line** **from** the **cursor** **position**
**yy** – **copies** the **line** in which the **cursor** **is located** to the buffer
**a** - **append** after **cursor**
**A** – **append** after **line**
**C** – **change** to the **end** of the **line**
**cw** – **change** the **current** **word** with **new** **text**, **starting** with the **character** **under** the **cursor**, **until** **ESC IS HIT**
**cc** – **change** the **whole** **line**
**ZZ** – **saves** the **current** **file** and **ends** **vi**
**h** – moves the **cursor** **left** one character
**j** – moves the **cursor** **down** one line
**k** – moves the **cursor up** one line
**l** – moves the **cursor right** one character
**0** – moves the **cursor to the start** of the **current** **line**
**CTRL-G** – **displays** a **status** **line** at the bottom of the interface that displays the name of the **file**, the **status** of the file, the **total number of lines** and the **cursor** **location**
/search_term – searches for the next instance of the term specified  
?/search_term – searches for the previous instance of the term specified

##### Changing the color scheme in vi editor
```bash
:colorscheme industry
```

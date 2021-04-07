# TestingInShell-C
___

### Introduction
**TestingInShell-C** (tic-c) is one shell script to test some open tests who is given to us in one class of the university.

---
### Requirement
For this script run and work correctly, is necessary run this script in the kernel of the operation system **Linux**!

The kernel can be native, like the O.S. installed, and running, or just the WSL (Windows Subsystem Linux).

---
# Installing in tic-c
To install the script just download the file tic-c.sh and put them in the directory with the main file .c


Like the example below:
![example tic-c and some .c file](https://i.imgur.com/tQFl4K0.png)

# Starting in tic-c
To start in with the tic-c, just run the script with the **i flag**

```bash
./tic-c.sh -i
```

With this flag, the script generate a folder structure containing 
```
exercice_folder
│   tic-c.sh
│   main.c
│
└───diff
│   │
│   └───dif 
│   │
│   └───resul
│   
└───res
```

After generating this folder structure, you need to **put** in the **res** folder all **input** and **expected output** files

For input files, the files need to be **.in** and for expected output files they need be **.res**.

Like the example below:

### Files in the folder:
![how is the file you need to put in the res folder](https://i.imgur.com/tfVqQVc.png)
**Observation:** the files **need** the name like the image, **arq**number of the exercise **.in** and **arq**number of the exercise **.res**

**Example .in file**
![example .in file](https://i.imgur.com/8CiAOJB.png)
**Example .res file**
![example .res file](https://i.imgur.com/6wAVGja.png)

# Using the Script
After creating our coping all files to res folder, now you can use effectively the script!
For this, we need to know two flags to this script.
The **t flag**  and the **a flag**

To use them just pass in the **a flag**, the name of the .c file, without the extension .c, and in the **t flag** just pass the quantity of the test you have in the res folder, in another words, the quantity of the .in files of this folder

Below we have the use example

```bash
./tic-c.sh -a main -t 2
```
if you don't use the flags, the script will alert you and show some input to insert this values.

When you run this command the script compile, generate and compare the results, in the end, the script returns the difference of the generated result and the expected output.

The difference is like the example below:

![Result of the script](https://i.imgur.com/dDGS6Vq.png)

The script return in portuguese, but the translate is like, 
in first line "Test 1: Same Result!" and in the second line
 "Test 2 | divergent result:"
"Your result | Expected result"


# Finishing and cleaning all
After the test and the development of the exercise is ended, you can easy clean all the folder structure, all generated files and all .in and .res files.

To do this, just run the script with the **f flag**
```shell
./tic-c.sh -f
```

When you run with the flag the script will ask if you agree with delete all files and folders.

![Executing the script with the f flag](https://i.imgur.com/ffdZaSo.png)

Answering yes all the files and folders will be deleted!
import os
import subprocess

fp3 = open("output_comp.txt",'w')
fp3.close()

command = "ngspice destination.ckt"

for j in range(0,8):
    
    # s1=chr(97+j)
    if j>=0 and j<=3:
        s1="a"+str(j)
    else:
        l=j%4
        s1="b"+str(l)
        
    for p in range(0,2):
        if(p==1):
            if(j<4):
                src='comparator_delay_a1.spice'
                s2 = "lsr"
            else:
                src='comparator_delay_b1.spice'
                s2 = "gtr"
        else:
            if(j<4):
                src='comparator_delay_a0.spice'
                s2 = "gtr"
            else:
                src='comparator_delay_b0.spice'
                s2 = "lsr"

        fp1=open(src,'r')
        fp2 =open("destination.ckt",'w') #destination file for running
        fp3 = open("output_comp.txt",'a') #final output file
        mode1 = "RISE"
        mode2 = "RISE"
        mode3 = "FALL"
        mode4 = "FALL"

        d = fp1.read() #reading data from file to a string

        # search_text=f'V_{s1} {s1} gnd DC 0'
        # replace_text=f'V_{s1} {s1} gnd pulse(0 1.8 0n 100p 100p 200n 400n)'
        # d=d.replace(search_text,replace_text)

        search_text = "*target text"
        if(p==1):
            replace_text = f'''
.measure tran trisels 
+ TRIG v({s1}) VAL = 'SUPPLY/2' RISE =1
+ TARG v({s2}) VAL = 'SUPPLY/2' FALL =1 

.measure tran tfallls
+ TRIG v({s1}) VAL = 'SUPPLY/2' FALL =1 
+ TARG v({s2}) VAL = 'SUPPLY/2' RISE=1

.measure tran tpd{s2} param = '(trisels + tfallls)/2' goal = 0
            '''
        else:
            replace_text = f'''
.measure tran trisegt 
+ TRIG v({s1}) VAL = 'SUPPLY/2' RISE =1
+ TARG v({s2}) VAL = 'SUPPLY/2' RISE =1 

.measure tran tfallgt
+ TRIG v({s1}) VAL = 'SUPPLY/2' FALL =1 
+ TARG v({s2}) VAL = 'SUPPLY/2' FALL=1

.measure tran tpd{s2} param = '(trisegt + tfallgt)/2' goal = 0

.measure tran triseeq
+ TRIG v({s1}) VAL = 'SUPPLY/2' RISE =1
+ TARG v(equ) VAL = 'SUPPLY/2' FALL =1 

.measure tran tfalleq
+ TRIG v({s1}) VAL = 'SUPPLY/2' FALL =1 
+ TARG v(equ) VAL = 'SUPPLY/2' RISE=1

.measure tran tpdv_eq param = '(triseeq + tfalleq)/2' goal = 0
            '''
        #now we replace search text with replace text in the file
        d = d.replace(search_text,replace_text)
        fp2.write(d) #this writes the modified text into a new file called temp2.ckt
        fp1.close()
        fp2.close()

            #just use this block as it is so that your command is run in the terminal and output is stored into the string named as output
        completed_process = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if completed_process.returncode == 0:
            output = completed_process.stdout
        else:
            output = ("Command execution failed. at",s1, s2)

        output = output.split('\n') #helps to seperate the string based on the new line characters
        if(p == 1):
            output = output[-4] 
            additional_text = f" input = {s1} output = {s2}\n"
            fp3.write(output+additional_text)
        else:
            additional_text = f"{output[-7]} input = {s1} output = {s2}\n{output[-4]} input = {s1} output = equals\n"
            fp3.write(additional_text)
        # time.sleep(0.4)

fp3.close()
                

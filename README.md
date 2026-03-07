# 🔋 battery_monitor.sh

>_This is a Bash program I created to help me keep my new MacBook’s battery healthier for longer. 🌱\
 I use this all the time, and I hope you find it useful too!_

## 🧩 Requirements:

→ macOS Terminal\
→ Basic terminal knowledge

## 🎯 Purpose:

Batteries remain at their healthiest state when their capacity stays between 20% and 80%, avoiding extremes such as full charging or full depletion. 

While left running, this script alerts you when the battery charge is too low (<25%) or too high (>80%), so you can unplug or plug in your charger at the right time. 

## 📷 Behaviour preview
The script runs and checks the battery status, then prints a message in the terminal and then sleeps for 60 seconds. 

#### When battery is **within the expected range**, terminal output looks like this:

<img src=examples/img0.png>

#### If the battery is at **less than 25%** and **not charging**:
 - Pop-up message reminder is generated:

<img src=examples/img1.png>

- Terminal message changes accordingly:

<img src=examples/img2.png>

#### If batery is **above 80%** and **still charging**:
- Pop-up message reminder is generated:

<img src=examples/img3.png>

- Terminal message changes to the below:

<img src=examples/img4.png>

#### Edge cases change the terminal output
For example, if battery is **above 80%** but **no longer charging**, no pop-up message is generated, and the terminal message reflects the charging status:

<img src=examples/img5.png>

## 🔖 How to Use:

1. Create the script file:

`nano battery_monitor.sh`

or

`vim battery_monitor.sh`

2. Paste the script content into the editor and save it.

In Nano: press Ctrl + O, then Enter, then Ctrl + X

In Vim: type :wq and press Enter

3. Make the script executable

`chmod +x battery_monitor.sh`

 4.  Run it manually in a separate Terminal window

`./battery_monitor.sh`

## ‼️ Important to know:
This program only runs if your terminal window is open (you can keep it minimized).\
If you close the terminal, this will terminate the script.
Closing the lid of your laptop will freeze the script, and it will start running again once you open the lid.
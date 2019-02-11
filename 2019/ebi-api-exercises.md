---
title: API Exercises - follow along
---

1. Table of Contents
{:toc}

## Getting started - tell us what you know...

- What languages do you use as part of your work? [Poll](http://www.polljunkie.com/poll/bqbbio/what-languages-do-you-use-in-your-work) (closes 14 feb 2019) - "none" is an acceptable answer! 😁
- [Results](http://www.polljunkie.com/poll/iwsyox/what-languages-do-you-use-in-your-work/view)

## Downloading and running code from the InterMine results tables

Try this at home - 

### Setup (You only have to do this once!)

If you don't have python installed, or if you aren't sure, visit our [setup guide](python-setup-guide) to install things. You'll only have to do this once! 

### Running a python script on your local machine

Once you have python installed: 
1. Find a result table that interests you, and download the generated code. 
    - Let's try the results for the [HumanMine Pax6 Targets list](http://www.humanmine.org/humanmine/bagDetails.do?scope=all&bagName=PL_Pax6_Targets)
2. Click on the `Generate Python Code` button at the top right of your results table. 
3. Save the file on your computer (and pay attention to _where_ you've saved it, so you can go there in the next step). I've saved mine to the location `~/Downloads/query.py`
4. Now it's time to run the script! Open up a terminal. In Linux, this is often accomplished by pressing CTRL+ALT+T, or on a Mac press CMD+Space and type "terminal", then press enter.
5. Navigate to the directory where your downloaded script is located. If you saved it to your downloads folder, the command might be `cd ~/Downloads/`. 
    - `cd` stands for change directory - we're telling the computer to change directory into the downloads folder. 
6. Okay, nearly there! Two things left to do: we need to make the script executable, and then we can run it! 
7. Making it executable: type `chmod +x query.py`. 
    - Breakdown: `chmod` is the unix command to change file permissions, `+x` means "please make this file e**x**ecutable", and `query.py` is the name of the generated code script we downloaded. If you changed the file name when you downloaded it, make sure to substitute the correct name in the command! 
    - You can try the next step *without* making the script executable to see what happens if you like. It'll probably give you an error.
8. Right, time to run the script: type `./query.py`. You should see the results of your query printed to the screen! If it looks a little odd, make the terminal wider and run it again the same way. 
    - `./some-file-name-here` - the `./` means "execute this script, please". 

'''
import os
os.listdir('./work')
variables= {}
execfile( "someFile.py", variables ) python 2
exec(open('somefile.py').read(), globals())
'''
import random 
p1 = random.randint(0, 2)
def choosing():
    while True:
        try:
            p = int(input("Rock: 0; Paper: 1; scissor: 2:"))
            if p < 0 or p > 2:
                print("\nPlease enter valid value")
            else:
                return p
        except ValueError:
            print("\nPlease enter valid value")
p2 = choosing()

print ("\n" + str(p1))
if p1 == p2:
  print("DRAW!!")
elif p2 - p1 == 1 or p1 - p2 == 2:
  print("YOU WON!!")
elif p1 - p2 == 1 or p2 - p1 == 2:
  print("YOU LOSE!!")

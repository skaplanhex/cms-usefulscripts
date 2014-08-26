#! /usr/bin/env python
from math import *
from sys import argv
wantsHelp = False
if(len(argv)==1):
    wantsHelp = True
wantsHelp = (argv[1]=='h' or argv[1]=='--help')
def wantsRadians():
    if(argv[1]=='-r'):
        return True
    return False
if(wantsHelp):
    print "This is a simple script written by Steven Kaplan that converts pseudorapidity defined by " +u"\u03B7"+ " = -ln(tan(" + u"\u03B8"+"/2)) to the angle " + u"\u03B8" +  " above the beamline (z-axis)."
    print " "
    print "The basic syntax of this script (provided this script is in a folder listed in your PATH) is to type etatheta then the eta which you wish to convert to theta (in degrees). An example:"
    print " "
    print "user@machine$ etatheta 2.5"
    print "An "+u"\u03B7"+ " of "+str(2.5)+ " corresponds to " + str(9.38520669791) + " degrees above the beamline."
    print " "
    print "The -r option gives the angle in radians instead of degrees. An example:"
    print " "
    print "user@machine$ etatheta -r 0"
    print "An "+u"\u03B7"+ " of "+ "0.0" + " corresponds to " + "0.5" + u"\u03C0" + " radians above the beamline."
elif(wantsRadians()):
    try:
        eta=abs(float(argv[2]))
        step1=exp(-eta)
        thetarad=2*atan(step1)
        thetaradpi=thetarad/pi
        print "An "+u"\u03B7"+ " of "+str(eta)+ " corresponds to " + str(thetaradpi) + u"\u03C0" + " radians above the beamline."
    except ValueError:
        print "Input not recognized: type etatheta --help for guidance"
else:
    try:
        eta=abs(float(argv[1]))
        step1=exp(-eta)
        thetarad=2*atan(step1)
        thetadeg=thetarad*180./pi
        print "An "+u"\u03B7"+ " of "+str(eta)+ " corresponds to " + str(thetadeg) + " degrees above the beamline."
    except ValueError:
        print "Input not recognized: type etatheta --help for guidance"

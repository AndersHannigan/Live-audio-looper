<Cabbage>
form caption("Loop") size(1200, 800), colour(167, 223, 211), guiMode("queue") pluginId("Loop")
image file("images/BG PLUGIN.png") bounds(0, 0, 1200, 800)
gentable bounds(318, 638, 560, 182) channel("gentable") tableNumber(101.0) tableGridColour(0, 0, 0, 0) tableColour:0(255, 182, 193), tableBackgroundColour(167, 223, 211) 
;--------
button bounds(354, 228, 500, 350) text("")imgFile("On", "images/Skyggelagt.png")imgFile("Off", "images/Loopbutton.png")  channel("status") 
button bounds(168, 148, 100, 100) active(0) visible(0) colour:1(250, 2, 2, 255) text("Record overdub", "Overdub recording") channel("overdub") value(0)
;---------Knobs
        ;Vol
rslider bounds(56,  516, 45, 45) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 1, 1, 0.001) channel("Volume1")
rslider bounds(214, 516, 45, 45) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 1, 1, 0.001) channel("Volume2")
rslider bounds(56,  606, 45, 45) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 1, 1, 0.001) channel("Volume3")
rslider bounds(214, 606, 45, 45) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 1, 1, 0.001) channel("Volume4")
rslider bounds(130, 690, 60, 60) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 1, 1, 0.001) channel("MasterVolume")
        ;Reverb
rslider bounds(826, 144, 70, 70) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 0.3, 1, 0.001) channel("ReverbMix")
rslider bounds(946, 278, 58, 58) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 0.3, 1, 0.001) channel("ReverbSize")
rslider bounds(1070, 278, 58, 58)imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(500, 20000, 10000, 1, 0.001) channel("ReverbCutoff")
button  bounds(1016, 156, 42, 64)imgFile("Off", "images/Off.png")imgFile("On", "images/On.png") text("") channel("ReverbOnOff")
        ;Delay
rslider bounds(302, 144, 70, 70) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 0.3, 1, 0.001) channel("DelayMix")
rslider bounds(196, 278, 58, 58) imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 0.3, 1, 0.001) channel("DelayTime")
rslider bounds(70, 278, 58, 58)  imgFile("Slider", "images/Knob.svg") trackerOutsideRadius(0) range(0, 1, 0.3, 1, 0.001) channel("DelayFeedback")
button  bounds(140, 156, 42, 64) imgFile("Off", "images/Off.png")   imgFile("On", "images/On.png") text("") channel("DelayOnOff")
       
;--------Overdubknapper
        ;rec
button bounds(919, 584, 130, 37)  imgFile("Off", "images/Overdub1off.png")imgFile("On", "images/RecordingOn.png") colour:1(250, 2, 2, 255) text("")  channel("overdub1") value(0)
button bounds(1056, 584, 130, 37) imgFile("Off", "images/Overdub2off.png")imgFile("On", "images/RecordingOn.png") colour:1(250, 2, 2, 255) text("")  channel("overdub2") value(0)
button bounds(918, 676, 131, 37)  imgFile("Off", "images/Overdub3off.png")imgFile("On", "images/RecordingOn.png") colour:1(250, 2, 2, 255) text("")  channel("overdub3") value(0)
button bounds(1056, 676, 131, 37) imgFile("Off", "images/Overdub4off.png")imgFile("On", "images/RecordingOn.png") colour:1(250, 2, 2, 255) text("")  channel("overdub4") value(0)
        ;mute
button bounds(968, 545, 40, 30) imgFile("On", "images/Unmuted.svg")imgFile("Off", "images/Muted.svg") colour:1(250, 2, 2, 255) text("")  channel("muteoverdub1") value(1)
button bounds(1104,545, 40, 30) imgFile("On", "images/Unmuted.svg")imgFile("Off", "images/Muted.svg") colour:1(250, 2, 2, 255) text("")  channel("muteoverdub2") value(1)
button bounds(968, 638, 40, 30) imgFile("On", "images/Unmuted.svg")imgFile("Off", "images/Muted.svg") colour:1(250, 2, 2, 255) text("")  channel("muteoverdub3") value(1)
button bounds(1104,638, 40, 30) imgFile("On", "images/Unmuted.svg")imgFile("Off", "images/Muted.svg") colour:1(250, 2, 2, 255) text("")  channel("muteoverdub4") value(1)
;-------Transportknapper
button  bounds(446, 30, 70, 75)imgFile("Off", "images/PlayOff.png")    imgFile("On", "images/PlayOn.png") text("") channel("Playbutton")
button  bounds(564, 30, 70, 75)imgFile("Off", "images/StopOff.png")    imgFile("On", "images/StopOn.png")     text("") channel("Stopbutton")
button  bounds(682, 30, 70, 75)imgFile("Off", "images/TrashOff.png")   imgFile("On", "images/TrashOn.png")     text("") channel("Trashbutton")





</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

;----------
gkPlay init 0
gkDur init 0
gkPhase init 0
;------
gibuffer	ftgen	0,0,sr*30,-2,0	;Audio buffer, 30 sec
giDub1      ftgen   0,0,sr*30,-2,0  ;OverdubBuffer 1
giDub2      ftgen   0,0,sr*30,-2,0  ;OverdubBuffer 2
giDub3      ftgen   0,0,sr*30,-2,0  ;OverdubBuffer 3
giDub4      ftgen   0,0,sr*30,-2,0  ;OverdubBuffer 4
;------
gaMainloop init 0
gaDub1 init 0
gaDub2 init 0
gaDub3 init 0
gaDub4 init 0

gaReverbL init 0
gaReverbR init 0

gaDelay init 0

gaMiksL init 0
gaMiksR init 0




;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instr ACTIV

kStatus cabbageGetValue "status" ;0 when off, 1 when on
kstatcheck init 0

if changed:k(kStatus)== 1 then
    if kstatcheck == 0 then ;Original record pass
        ;printks "Recording", 1
        kstatcheck = 1
        event "i", "REC", 0, 30 ;Start recording for a maximum of 30 sec
    elseif kstatcheck == 1 then ;Play pass
        ;printks "Playing back", 1
        kstatcheck = 2
        gkPlay = 1
        event "i", "PLAY", 0, 3600 ; Play recorded loop for a maximum of 1 hour 
    elseif kstatcheck== 2 then ;Stop the playback
       ; printks "Stopped", 1
        kstatcheck = 1
        gkPlay = 0
    endif
endif 



endin
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





instr REC
    if gkPlay == 1 then
        turnoff
    endif

aIn inch 1
aNdx line 0, 30, sr*30
gkDur	downsamp	aNdx ; When recording is complete, you get the recdur in seconds by dividing gkDur(aNdx) with sr. 
tablew aIn, aNdx, gibuffer


Sscruber sprintfk "scrubberPosition(%d, %d), tableNumber(%d)", k(aNdx), k(gibuffer), k(gibuffer)
	    ;chnset Sscruber, "gentable"
        cabbageSet "gentable", Sscruber

if gkDur >= sr*30 then
    turnoff
endif
SKIPREC:
endin







;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

instr DUB
kStatcheck init 0
kStatus cabbageGetValue "overdub"
kStatus+= (cabbageGetValue:k("overdub1")+cabbageGetValue:k("overdub2")+cabbageGetValue:k("overdub3")+cabbageGetValue:k("overdub4"))
;printk2 kStatus
kRecdur = gkDur/sr
kDub1 cabbageGetValue "overdub1"
kDub2 cabbageGetValue "overdub2"
kDub3 cabbageGetValue "overdub3"
kDub4 cabbageGetValue "overdub4"

if changed:k(kStatus)== 1 then

   
    if kStatus == 1 then
        if     kDub1 == 1 then
            event "i", "WAIT1", 0, 30
            ;kStatcheck = 1
            ;printks "Nu recordes dub nr 1", 10
        elseif kDub2 == 1 then
            event "i", "WAIT2", 0, 30
            ;kStatcheck = 2
            ;printks "Nu recordes dub nr 2", 10
        elseif kDub3 == 1 then
            event "i", "WAIT3", 0, 30
            ;kStatcheck = 3
            ;printks "Nu recordes dub nr 3", 10
        elseif kDub4 == 1 then
            event "i", "WAIT4", 0, 30
            ;kStatcheck = 4
            ;printks "Nu recordes dub nr 4", 10
        elseif kStatcheck == 4 then
            ;printks "Maximum amount of overdubs reached", 100
        endif
    
    endif
endif
endin

;------------------------------------------
instr WAIT1 ;Instrument to wait for the loop to finish before recording overdub
kRecdur = gkDur/sr
;printk2 gkPhase
if gkPhase < 40 then
    event "i", "DUB1", 0, kRecdur
    
    turnoff
endif
endin

instr WAIT2
kRecdur = gkDur/sr
;printk2 gkPhase
if gkPhase < 40 then
    event "i", "DUB2", 0, kRecdur
    turnoff
endif
endin

instr WAIT3
kRecdur = gkDur/sr
;printk2 gkPhase
if gkPhase < 40 then
    event "i", "DUB3", 0, kRecdur
    turnoff
endif
endin

instr WAIT4
kRecdur = gkDur/sr
;printk2 gkPhase
if gkPhase < 40 then
    event "i", "DUB4", 0, kRecdur
    turnoff
endif
endin
;--------------------------------------------
instr DUB1
aNdx line 0, 30, 30*sr
aIn inch 1
tablew aIn, aNdx, giDub1

kLast lastcycle  
    if kLast == 1 then
    chnset k(0), "overdub1"
    endif
endin

instr DUB2
aNdx line 0, 30, 30*sr
aIn inch 1
tablew aIn, aNdx, giDub2
    kLast lastcycle  
    if kLast == 1 then
    chnset k(0), "overdub2"
    endif
endin

instr DUB3
aNdx line 0, 30, 30*sr
aIn inch 1
tablew aIn, aNdx, giDub3
    kLast lastcycle  
    if kLast == 1 then
    chnset k(0), "overdub3"
    endif
endin

instr DUB4
aNdx line 0, 30, 30*sr
aIn inch 1
tablew aIn, aNdx, giDub4
    kLast lastcycle  
    if kLast == 1 then
    chnset k(0), "overdub4"
    endif
endin







;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instr PLAY

if gkPlay == 0 then
    turnoff
endif

kPhasorFrq	divz	1,    (gkDur/sr),       0.00001
aNdx		phasor	kPhasorFrq
aLoopLen	interp	abs(gkDur)
aNdx = aNdx*aLoopLen
	Sscruber sprintfk "scrubberPosition(%d, %d), tableNumber(%d)", k(aNdx), k(gibuffer), k(gibuffer)
	;chnset Sscruber, "gentable"
	cabbageSet "gentable", Sscruber
    
aOut1		tablei	aNdx,    gibuffer

aOut2		tablei	aNdx,    giDub1
aOut3		tablei	aNdx,    giDub2
aOut4		tablei	aNdx,    giDub3
aOut5		tablei	aNdx,    giDub4



kVol1  cabbageGetValue "Volume1"
kVol2  cabbageGetValue "Volume2"
kVol3  cabbageGetValue "Volume3"
kVol4  cabbageGetValue "Volume4"


gaMainloop += aOut1
gaDub1     += aOut2*kVol1
gaDub2     += aOut3*kVol2
gaDub3     += aOut4*kVol3
gaDub4     += aOut5*kVol4

SKIPPLAY:
gkPhase = aNdx
;printk2 gkPhase
endin


;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instr FX

;REVERB
kSize cabbageGetValue "ReverbSize"
kCutoff cabbageGetValue "ReverbCutoff"

aMiks = gaMainloop + gaDub1 + gaDub2 + gaDub3 + gaDub4

aL, aR reverbsc aMiks, aMiks, kSize, kCutoff
gaReverbL += aL
gaReverbR += aR

;DELAY

aDelay init 0
kTime cabbageGetValue "DelayTime"
kFeedvol cabbageGetValue "DelayFeedback"
kTime *= 1000
kTime port kTime, 0.01
aFeed = aDelay*kFeedvol

aDelay vdelay aMiks + aFeed, a(kTime), 3000
gaDelay = aDelay 

endin







instr MIKS
;cabbageGetValues----
kMute1 cabbageGetValue "muteoverdub1"
kMute2 cabbageGetValue "muteoverdub2"
kMute3 cabbageGetValue "muteoverdub3"
kMute4 cabbageGetValue "muteoverdub4"


kVolMaster cabbageGetValue "MasterVolume"
kVol1  cabbageGetValue "Volume1"
kVol2  cabbageGetValue "Volume2"
kVol3  cabbageGetValue "Volume3"
kVol4  cabbageGetValue "Volume4"

kMix cabbageGetValue "ReverbMix"
kOnOff cabbageGetValue "ReverbOnOff"
kOnOff port kOnOff, 0.01

kMixDelay cabbageGetValue "DelayMix"
kOnOffDelay cabbageGetValue "DelayOnOff"
kOnOffDelay port kOnOffDelay, 0,01

gaMiksL = (gaMainloop) + (gaDub1*kMute1) + (gaDub2*kMute2) + (gaDub3*kMute3) + (gaDub4*kMute4) + (gaReverbL*kMix*kOnOff) + (gaDelay*kMixDelay*kOnOffDelay)
gaMiksR = (gaMainloop) + (gaDub1*kMute1) + (gaDub2*kMute2) + (gaDub3*kMute3) + (gaDub4*kMute4) + (gaReverbR*kMix*kOnOff) + (gaDelay*kMixDelay*kOnOffDelay)


outs gaMiksL*kVolMaster, gaMiksR*kVolMaster
;fout "EXPORTTEST2.wav", 14, gaMiksL*kVolMaster, gaMiksR*kVolMaster





clear gaMainloop, gaDub1, gaDub2, gaDub3, gaDub4, gaReverbL, gaReverbR, gaDelay, gaMiksL, gaMiksR
endin


</CsInstruments>
<CsScore>
f0 z
i "ACTIV" 0 z
i "DUB" 0 z
i "MIKS" 0 z
;i "MIKS" 0 300 ta opptak i 5 minutter
i "FX" 0 z
</CsScore>
</CsoundSynthesizer>
;gkDur = Mengde samples
;aNdx = Dur i sekunder, aka gkDur/sr
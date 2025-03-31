v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {H. J. Oguey and D. Aebischer, “CMOS current reference without resistance,” 
IEEE J. Solid-State Circuits, vol. 32, no. 7, pp. 1132–1135, Jul. 1997} 440 -170 0 0 0.3 0.3 {}
N 540 -300 540 -200 { lab=0}
N 540 -500 540 -380 { lab=vdd}
N 440 -200 540 -200 { lab=0}
N 380 -200 380 -180 { lab=0}
N 380 -420 380 -200 { lab=0}
N 380 -500 380 -480 { lab=vdd}
N 380 -500 540 -500 { lab=vdd}
N 440 -320 440 -300 { lab=disable}
N 440 -240 440 -200 { lab=0}
N 440 -320 480 -320 { lab=disable}
N 600 -320 680 -320 {
lab=vbr}
N 600 -340 680 -340 {
lab=vbn}
N 600 -360 680 -360 {
lab=vbp}
N 380 -200 440 -200 { lab=0}
C {devices/title.sym} 160 -40 0 0 {name=l1 author="Christoph Maier"}
C {reference.sym} 540 -340 0 0 {name=xdut}
C {devices/gnd.sym} 380 -180 0 0 {name=l2 lab=0}
C {devices/vsource.sym} 380 -450 0 1 {name=VDD value="dc 1.2 pwl(0 0 100m 1.2)" }
C {devices/vsource.sym} 440 -270 0 1 {name=Voff value=0}
C {devices/lab_wire.sym} 470 -500 0 0 {name=l3 lab=vdd}
C {devices/lab_wire.sym} 470 -320 0 0 {name=l5 lab=disable}
C {devices/lab_wire.sym} 680 -360 0 0 {name=l6 lab=vbp}
C {devices/lab_wire.sym} 680 -340 0 0 {name=l7 lab=vbn}
C {devices/lab_wire.sym} 680 -320 0 0 {name=l8 lab=vbr}
C {devices/code_shown.sym} 0 -770 0 0 {name=ngspice 
only_toplevel=true 
value=" 
.options gmin=1e-15 abstol=1p
.option savecurrents
.nodeset v(vbp)=200m
.control
save all
op
remzerovec
write test_reference.op.raw
tran 10u 0.5
remzerovec
write test_referenceBias.raw
plot vdd vbp vbn vbr xdut.xbias.vres
plot v.xdut.xbias.vi1#branch v.xdut.xbias.vi4#branch v.xdut.xbias.viaux#branch
.endc
"}
C {devices/code.sym} 110 -210 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOShv.lib mos_tt

.param mc_mm_switch=0
.param mc_pr_switch=1

"}

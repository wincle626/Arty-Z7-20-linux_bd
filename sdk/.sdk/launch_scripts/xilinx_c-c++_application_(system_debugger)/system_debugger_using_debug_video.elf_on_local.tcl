connect -url tcp:127.0.0.1:3121
source C:/sam_work/git/digilent/Arty-Z7-20-linux_bd/sdk/linux_bd_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Arty Z7 210346A40E3CA"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Arty Z7 210346A40E3CA" && level==0} -index 1
fpga -file C:/sam_work/git/digilent/Arty-Z7-20-linux_bd/sdk/linux_bd_wrapper_hw_platform_0/linux_bd_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Arty Z7 210346A40E3CA"} -index 0
loadhw C:/sam_work/git/digilent/Arty-Z7-20-linux_bd/sdk/linux_bd_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Arty Z7 210346A40E3CA"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Arty Z7 210346A40E3CA"} -index 0
dow C:/sam_work/git/digilent/Arty-Z7-20-linux_bd/sdk/video/Debug/video.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Arty Z7 210346A40E3CA"} -index 0
con

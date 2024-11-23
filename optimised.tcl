# read modules from verilog file
read_verilog elevator.v 
# elborate design hierarchy
hierarchy -check -top elevator 
#translate processes to netlist 
proc
# remove unused cells and wire
clean
# perform optimization
opt
# resource sharing optimization
share -aggressive
#show genric netlist
show
# mapping tointernal cell library
techmap
# mapping filp-flops to   Nangateopencelllibrary_typical.lib
dfflibmap -liberty   Nangateopencelllibrary_typical.lib
# mapping logic to  Nangateopencelllibrary_typical.lib
abc -liberty   Nangateopencelllibrary_typical.lib
# removed unused cell and wires
clean
# report design statistics
stat -liberty   Nangateopencelllibrary_typical.lib
# write the current design to a verilog file
write_verilog -noattr -noexpr -nohex -nodec  elevator_netlist.v
# to get netlist in json formate
write_json elevator_netlist.json
#show genric netlist
show -prefix elc  -notitle -colors 2 -width -format dot

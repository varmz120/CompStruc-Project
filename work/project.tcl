set projDir "C:/1D_Game/work/vivado"
set projName "1D_Game"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/1D_Game/work/verilog/au_top_0.v" "C:/1D_Game/work/verilog/multi_seven_seg_1.v" "C:/1D_Game/work/verilog/game_miniBeta_2.v" "C:/1D_Game/work/verilog/reset_conditioner_3.v" "C:/1D_Game/work/verilog/edge_detector_4.v" "C:/1D_Game/work/verilog/edge_detector_5.v" "C:/1D_Game/work/verilog/button_conditioner_6.v" "C:/1D_Game/work/verilog/bin_to_dec_7.v" "C:/1D_Game/work/verilog/counter_8.v" "C:/1D_Game/work/verilog/seven_seg_9.v" "C:/1D_Game/work/verilog/decoder_10.v" "C:/1D_Game/work/verilog/alu_11.v" "C:/1D_Game/work/verilog/game_CU_12.v" "C:/1D_Game/work/verilog/game_miniRegfiles_13.v" "C:/1D_Game/work/verilog/counter_14.v" "C:/1D_Game/work/verilog/pipeline_15.v" "C:/1D_Game/work/verilog/comparator_16.v" "C:/1D_Game/work/verilog/adder_17.v" "C:/1D_Game/work/verilog/shifter_18.v" "C:/1D_Game/work/verilog/boolean_19.v" "C:/1D_Game/work/verilog/multiplier_20.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/1D_Game/work/constraint/TestLSCustom.xdc" "C:/1D_Game/constraint/TestLS.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1

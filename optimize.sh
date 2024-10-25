#!/bin/bash

# Loop through each line in the 'list' file
while IFS= read -r onnx_file; do
    # Extract the file name without the extension and the path
    base_name=$(basename "$onnx_file" .onnx)
    
    # Define the output parameter and binary files
    param_file="./ncnn/${base_name}.param"
    bin_file="./ncnn/${base_name}.bin"
    opt_param_file="./ncnn_opt/${base_name}.param"
    opt_bin_file="./ncnn_opt/${base_name}.bin"
    
    # Run the onnx2ncnn command
    ./ncnnoptimize "$param_file" "$bin_file" "$opt_param_file" "$opt_bin_file" 1
done < list


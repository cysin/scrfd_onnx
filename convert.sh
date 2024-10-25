#!/bin/bash

# Loop through each line in the 'list' file
while IFS= read -r onnx_file; do
    # Extract the file name without the extension and the path
    base_name=$(basename "$onnx_file" .onnx)
    
    # Define the output parameter and binary files
    param_file="./ncnn/${base_name}.param"
    bin_file="./ncnn/${base_name}.bin"
    
    # Run the onnx2ncnn command
    ./onnx2ncnn "$onnx_file" "$param_file" "$bin_file"
done < list


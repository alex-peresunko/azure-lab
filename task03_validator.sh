#!/bin/bash
source "../../../shared_libs/shell_functions.sh" &>/dev/null

output_names=("rg_id" "sa_blob_endpoint" "vnet_id")
outputs_file="../mentor/repository/${task_name}/outputs.tf"

missed=()

for output in ${output_names[@]} ; do
  if ! grep -q "^output\s*\"$output\"" "$outputs_file";then
    missed+=$output
  fi
done

missed_one_string=$(printf '%s\n' ${missed[@]} | grep -v '^$')
expected_count=${#output_names[@]}
output_count=$(grep -c '^output' "$outputs_file")
description_count=$(grep -zo '^output .* {[^}]*}' "$outputs_file" | grep -c '^\s*description')

# Run test - Validating names of expected outputs, count of all outputs and descriptions in outputs.tf
if [[ ${#missed[@]} -gt 0 ]]; then
  command_log "${test_11}" "echo 'Did not find expected outputs: ${missed_one_string}'" "${logs_folder}"
else 
  if [[ $output_count != $expected_count || $description_count != $expected_count ]]; then
    command_log "${test_11}" "echo 'Required only $expected_count outputs with $expected_count descriptions'" "${logs_folder}"
  else
    command_log "${test_11}" "echo 'The number of outputs meets the requirements. All outputs have descriptions'" "${logs_folder}"
  fi
fi
 
#!/bin/bash
base_path="linux-sim-env/company"
echo "Checking base path created successfully or not"
if [ -d "$base_path" ]; then
    echo "[PASS] Base path created successfully."
else
    echo "[FAIL]Failed to create base path."
fi
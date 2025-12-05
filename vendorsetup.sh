# Apply patches first
sh device/samsung/gtexswifi/patches/apply.sh;

# Prepare for lunch
for i in eng user userdebug; do
add_lunch_combo aosp_gtexswifi-${i};
done

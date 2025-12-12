### AOSP 7.1.2  device tree for Samsung Galaxy Tab A 7.0 (2016) (gtexswifi)

Component   | Details
-------:|:-------------------------
Model   | SM-T280
CPU     | Quad-core 1.30GHz Spreadtrum SC7730SW
GPU     | Mali-400MP2
Memory  | 1.5GB RAM
Shipped Android Version | 5.1.1
Released | March 2016
Storage | 8GB
MicroSD Card Slot | Present, up to 256GB
Battery | 4000 mAh
Display | 7.0" 800 x 1280 px (216 dpi)
Primary Camera  | 5 MP, f/2.2, autofocus
Secondary Camera | 2.0 MP, f/2.2
FM Radio | Present

<img height="600" src="https://images.samsung.com/is/image/samsung/nz-galaxy-tab-a-7-0-2016-t280-sm-t280nzkaxnz-000000001-front-black?$L2-Thumbnail$" title="Galaxy Tab A 7.0"/>

To build:
```sh
. build/envsetup.sh
breakfast aosp_gtexswifi-userdebug && make bacon
```

---

If you want to compile TWRP for gtexswifi add this to roomservice.xml:
```xml
    <project path="bootable/recovery-twrp" name="TeamWin/android_bootable_recovery" remote="github" revision="android-9.0" />
    <project path="external/busybox" name="LineageOS/android_external_busybox" remote="github" revision="cm-14.1" />
```

To build:
```sh
export WITH_TWRP=true
```
```sh
. build/envsetup.sh
breakfast aosp_gtexswifi-eng && make recoveryimage
```

TWRP can't be compiled together with the ROM because for the boot.img we have to use uncompressed kernel (Image), and if we use it for the recovery.img the build will fail because the img will result too big, if we compress the recovery ramdisk with lzma the build will be successfull but the recovery won't boot. So just compile it separately (using compressed kernel (zImage)) with the command above, and ignore the recovery.img (lineage-recovery) generated while compiling the ROM.

---

#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5c09e5b43a18fecd6b0b75ae5264398771983ef0; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:b4d51dcce2b65133d9f0b0459f4038945812374d \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5c09e5b43a18fecd6b0b75ae5264398771983ef0 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

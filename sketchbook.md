# bus or device


```
/sys/bus/pci/drivers/<driver>/<device>/boot_vga = 1
<driver> being anything from nvidia,radeon,nouveau,amdgpu,i915, to the generic pcieport if no driver is initialized but xorg still functions.
(note that pcieport places boot_vga in <port>/<device>/)
```
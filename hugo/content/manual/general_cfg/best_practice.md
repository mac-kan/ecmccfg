+++  
title = "best practice"   
weight = 14
chapter = false  
+++  

## EtherCAT rate (EC_RATE)
The default EtherCAT frame rate in ecmc is set to 1kHz. For most applications this is however not needed and can therefore be reduced. A reduced EtherCAT rate reduces the load on the controller. In general, a good value for the frame rate is in the range 100Hz to 1kHz. For motion systems, a frame rate of 100Hz..500Hz is normally enough. Rates ouside the 100Hz..1kHz range is normally not a good idea, and some slaves might not support it. However, in special cases both lower and higher rates might be possible and required.

Example: Set rate to 500Hz
```
require ecmccfg "EC_RATE=500"
...
```
For more information see the chapter [startup.cmd](../startup/_index.md).

As a comparison, TwinCAT default EtherCAT rates are:
* 100Hz for PLC
* 500Hz for motion

See [ecmc_server](../knowledgebase/hardware/host.md) for more information.

## ecmc server setup
* If possible, make sure you use the native igb ethercat driver.

For more information see:
* https://git.psi.ch/motion/ecmc_server_cfg
* [ecmc_server](../knowledgebase/hardware/host.md) for more information.
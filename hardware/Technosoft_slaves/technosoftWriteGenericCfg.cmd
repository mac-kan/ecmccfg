ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},0x2064,0x0,0x$(ECMC_TECHNOSOFT_ADR_HEX)$(ECMC_TECHNOSOFT_CFG_HEX),4)"
epicsThreadSleep(0.01)
ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},0x2067,0x0,0x$(ECMC_TECHNOSOFT_ADR_HEX)$(ECMC_TECHNOSOFT_DATA_HEX),4)"
epicsThreadSleep(0.01)
#-d /**
#-d   \brief hardware script for EL7041-Motor-Leadshine-57HS22 (parallel wiring)
#-d   \details Parmetrization of EL7041 for motor Nanotec Leadshine Tecnology mod. 57HS22 (parallel wiring)
#-d   \file
#-d */

#- Set max current to 5A (unit 1mA) (max current is 5.7A)
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0x1,5000,2)"

#- Reduced current 500mA (unit 1mA)
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0x2,500,2)"

#- Nominal voltage 68V (unit 1mV)
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0x3,68000,2)"

#- Coil resistance 0.4 Ohm (unit 10mOhm)
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0x4,40,2)"

#- Motor full steps count 200
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0x6,200,2)"

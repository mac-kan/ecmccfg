#-d /**
#-d   \brief hardware script for Keyence DL-EC1A
#-d   \details multichannel interface
#-d   \author Niko Kivel
#-d   \file
#-d */

epicsEnvSet("ECMC_EC_HWTYPE"             "DL-EC1A")
epicsEnvSet("ECMC_EC_VENDOR_ID"          "0x00000541")
epicsEnvSet("ECMC_EC_PRODUCT_ID"         "0x00001194")

ecmcConfigOrDie "Cfg.EcSlaveVerify(0,${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID})"

#- ###########################################################
#- ############ Config PDOS:

#- #### Main device
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1600,0x7000,0x1,32,INP_REQ1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1601,0x7000,0x2,32,INP_REQ2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1602,0x7000,0x3,32,INP_REQ3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1603,0x7000,0x4,32,INP_REQ4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1604,0x7000,0x5,32,INP_REQ5)"

ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x1,1,ERR_STATUS)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x2,1,WRN_STATUS)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x3,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x3,1,VAL_PROP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x4,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x5,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x7,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x8,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0x9,8,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6000,0xa,16,ERR_CODE)"

#- individual sensor inputs
epicsEnvSet("CH_ID",              "1")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6100")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a20")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a30")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "2")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6110")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a21")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a31")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "3")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6120")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a22")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a32")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "4")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6130")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a23")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a33")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "5")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6140")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a24")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a34")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "6")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6150")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a25")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a35")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "7")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6160")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a26")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a36")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"

epicsEnvSet("CH_ID",              "8")
epicsEnvSet("ECMC_EC_SDO_INDEX",  "0x6170")
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a27")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x01,32,CH${CH_ID}_VALUE)"
epicsEnvSet("ECMC_EC_PDO_INDEX",  "0x1a37")
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x02,1,CH${CH_ID}_OUT1)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x03,1,CH${CH_ID}_OUT2)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x04,1,CH${CH_ID}_OUT3)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x05,1,CH${CH_ID}_OUT4)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x06,1,CH${CH_ID}_OUT5)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x07,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x08,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x09,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0a,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0b,1,CH${CH_ID}_INV)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0c,1,CH${CH_ID}_UDR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0d,1,CH${CH_ID}_OVR)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0e,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x0f,1,GAP)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x10,1,CH${CH_ID}_WRN)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,${ECMC_EC_PDO_INDEX},${ECMC_EC_SDO_INDEX},0x11,1,CH${CH_ID}_ERR)"
#==============================================================================
# addDomain.cmd
#-d /**
#-d   \brief Script for adding an EtherCAT domain. 
#-d   \note All EtherCAT entries generated after this command will be assigned 
#-d    to the new domain.
#-d
#-d   \author Anders Sandström
#-d   \file
#-d   \param EXE_RATE (optional) Execution rate [cycles] defaults 0 (same EC_RATE)
#-d   \param EXE_OFFSET (optional) Execution offset cycles [cycles] defaults 0
#-d   \param ALLOW_OFFLINE (optional) Allow domain to be offline defaults 0
#-d */
ecmcConfigOrDie "Cfg.EcAddDomain(${EXE_RATE=0},${EXE_OFFSET=0})"
ecmcConfigOrDie "Cfg.EcSetDomainAllowOffline(${ALLOW_OFFLINE=0})"
#- Increase index of current domain
ecmcEpicsEnvSetCalc(ECMC_EC_DOMAIN_CURRENT_ID,"${ECMC_EC_DOMAIN_CURRENT_ID=0}+1")
ecmcFileExist("ecmcEcDomain.db",1,1)
dbLoadRecords("ecmcEcDomain.db","P=${ECMC_PREFIX},ECMC_EC_MP=${ECMC_EC_MP=m},PORT=${ECMC_ASYN_PORT},ADDR=0,TIMEOUT=1,MASTER_ID=${ECMC_EC_MASTER_ID},T_SMP_MS=${ECMC_SAMPLE_RATE_MS},TSE=${ECMC_TSE},DOM_ID=${ECMC_EC_DOMAIN_CURRENT_ID=0}")

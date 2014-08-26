#! /bin/bash

echo Building template jdl and shell script files in working directory
#Build jdl file template
echo universe = vanilla > condorTEMPLATE.jdl
echo +AccountingGroup = "group_rutgers.skaplan" >> condorTEMPLATE.jdl
echo Executable = condorTEMPLATE.sh >> condorTEMPLATE.jdl
echo should_transfer_files = NO >> condorTEMPLATE.jdl
echo Output = /home/skaplan/condor/run.stdout >> condorTEMPLATE.jdl
echo Error  = /home/skaplan/condor/run.stderr >> condorTEMPLATE.jdl
echo Log    = /home/skaplan/condor/run.condor >> condorTEMPLATE.jdl
echo Arguments = hello world>> condorTEMPLATE.jdl
echo Queue 1 >> condorTEMPLATE.jdl
echo ...
echo ...
echo ...
#Build shell script template
echo "#! /bin/bash" > condorTEMPLATE.sh
chmod +x condorTEMPLATE.sh
echo export VO_CMS_SW_DIR="/cms/base/cmssoft" >> condorTEMPLATE.sh
echo export COIN_FULL_INDIRECT_RENDERING=1 >> condorTEMPLATE.sh
echo export SCRAM_ARCH="slc5_amd64_gcc462" >> condorTEMPLATE.sh
echo source $VO_CMS_SW_DIR/cmsset_default.sh >> condorTEMPLATE.sh
echo cd $PWD >> condorTEMPLATE.sh
echo "scramv1 runtime -sh" >> condorTEMPLATE.sh
echo "#Do whatever you want the script to do!" >> condorTEMPLATE.sh
echo echo \$1 \$2 >> condorTEMPLATE.sh
echo cmsRun minBias_production_pythia6_extgeo_cfg.py maxEvents=3 >> condorTEMPLATE.sh
echo Done!

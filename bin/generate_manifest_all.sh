#!/bin/sh
# generate manifest files from all datasets

. `dirname "$0"`/common.sh

. bin/datasets.txt

# generate the comma separated list of xml files
gen_list=''
for dataset in $datasets ; do
  gen_list="${gen_list}model/$dataset.config.xml,"  
done

echo $gen_list


PROJECT=`cat tmp/pid`

$GDCL -e "
    OpenProject(id = \"$PROJECT\");
    GenerateManifests(configFiles = \"$gen_list\", dir = \"manifests\");"


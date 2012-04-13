*Getting Started:*

0. Make sure you can run shell scripts and have the GoodData CL tool
   installed. The gdi.sh script must be on your system PATH

1. Checkout the "turbocl" directory:
   git clone https://github.com/koles/gooddata-turbocl.git
   Rename it and call it your project directory.
   Create empty model/, data/ and tmp/ folders.
   Change the git origin so you can push your work into your Git
   repository

2. Make sure you have gdi.properties file in your home directory or in
   the project directory. 

3. Copy our CSV files to the data/ folder. The files must be ready
   for upload into GoodData using the CL tool without any
   transformation.

4. Run bin/guess_all.sh

5. Edit generated XML datast descriptors in the model/ folder

6. Edit bin/datasets.txt. The list of data sets should match the CSV
   files in the data/ folder without the .csv suffix. Edit the list
   of the date dimensions.

7. Create the GoodData project by running
   bin/create_project.sh "projectname"
   The generated project will include all date dimensions from the 
   bin/datasets.txt file. It's project ID will be stored in tmp/pid

8. Run bin/generate_maql_all.sh to generate MAQL scripts into tmp/ folder

9. Run bin/execute_maql_all.sh to execute the MAQL scripts in the tmp/
   folder

10. Run bin/transfer_data_all.sh to upload data from the data/ folder
    into the GoodData project

11. To change the data model for a data set, edit the corresponding XML
    file in the model/ folder and then run
    bin/generate_maql.sh dataset `cat tmp/pid` 1

*Notes:*

* data are transfered using the full mode by default. Edit
  bin/transfer_data.sh to use the incremental mode instead

* these scripts do not replace the CL tool but they can help you to use
  it more effectively

* sorry for possibly not user friendly error messages produced by the
  current version

# TUV2DSMACC

TUV2DSMACC with programme 'linkphot' to generate f90 code for the DSMACC module constants.f90. The code links TUV photolysis IDs to photolysis IDs used in DSMACC.

The programme reads DSMACC photolysis IDs and associated TUV reaction labels from a database file and compares them to the TUV IDs from the TUV input file. Fortran 90 code is written to an output file for use in the DSMACC module file _constants.f90_. The kpp file is checked for the use of photolysis reactions and only those reactions used in the mechanism are outputted. The programme stops for missing IDs and issues warnings, when photolysis reactions are used in DSMACC, but are flagged with _FALSE_ in TUV.

## Compiling

- run `make clean`
- run `make`

## Running the programme

1. Save input files to _'IO'_ folder (see [later](#io-files)).
2. Adjust parameters in Module MOD/params.f90 and re-compile.
3. Run programme using `./linkphot <kpp file> <TUV input file> <link db file> <output file>`.
    1. All files must be stored in the _IO folder_. 
    2. File arguments are optional. Default names will be used, if obsolete (see [later](#io-files)). Files in arguments must be given __with__ the correct extension, but __without__ the folder path.
4. Output is written to the defined output file in the _IO_ folder.

## Parameters in linkphot

Model parameters are saved in the Module _params_ in the _MOD_ folder. These include array sizes, for which simple checks and warnings for exceedings are implemented in the model code. Furthermore, the number of defined photolysis reactions in DSMACC as determined from the database file is saved in the module _params_.

There is a switch (_INTEGER mech_) in the Module _params_, which allows you to include only certain subsets of photolysis links in the output file. These are:
- 0: Only those reactions are outputted that are in the current mechanism.
- 1: As above, but additionally inorganic reactions are included. This comes in handy as in DSMACC, inorganic and organic reactions are distinguished in the kpp files, but not in constants.f90. Therefore, you can use your organic.kpp as input for _linkphot_, but then include inorganic reactions, so you can copy over the whole corresponding section in constants.f90.
- 2: All photolysis reactions defined in the database are included in the f90 output. This is handy, if you want to produce output only once and reuse it for other MCM mechanisms as well and don't worry, which reactions are included or omitted.


## I/O Files
### Mechanism (kpp) file

<Merge Conflict>
The programme looks for a __default name 'MCM331.kpp'__ to read the data from. You can use any other name or file extension, but you need to define them in the first programme argument, if you do so.


### TUV input file

Download TUV from the [TUV website](https://www2.acom.ucar.edu/modeling/tropospheric-ultraviolet-and-visible-tuv-radiation-model) and adjust for use with [DSMACC](https://github.com/wolfiex/DSMACC-testing) or use the TUV version already coupled to [DSMACC](https://github.com/wolfiex/DSMACC-testing). Save the TUV input file to the _IO_ folder.

The programme looks for a __default name 'usrinp'__ to read the data from. You can use any other name or file extension, but you need to define them in the second programme argument, if you do so.


### Link database (db) file

Create a database file (or use/adjust the predefined one) to link DSMACC photolysis IDs to TUV reaction labels and save it to the _IO_ folder. The information stored in the database file are the DSMACC photolysis IDs as INTEGER, possible branching ratios used in DSMACC for certain photolysis reactions, the TUV reaction label (used exactly as in the TUV input file, not the source code itself!). Comments can be added to the database by using a `#`-sign at the first character of a line.

First DSMACC photolysis IDs are given in the database file followed by a double colon (`::`), if no branching ratios are used in DSMACC or a colon (`:`), the branching ratio as are REAL(4) and another colon. At last, the TUV label is given. No strict file format is used concering white spaces except for the case, where no branching ratios are present in DSMACC. In this case the separator between the DSMACC ID and the TUV label has to be a double colon (`::`) and no white space are allowed between the colons.

In some cases, you might want to calculate more than one DSMACC photolysis reaction with the same TUV reaction (i.e. estimate different photolysis reactions with the same _j_ value or, in other words, combine more than one DSMACC photolysis ID under the same TUV ID in the CASE SELECT output). In this case, you need to assign a branching ratio of 1.0 to the corresponding reactions in the database and link them to the same TUV photolysis labels. The programme will combine all these reactions (be aware of the array size with a maximum of nbr = 3 in the current settings in the module _params_!) in the output under the same CASE.

File format:  
```
# Comments or dummy reactions
<DSMACC ID> : <TUV label>
```
The programme looks for a __default name 'MCM331.db'__ to read the data from. You can use an other name or file extension, but you need to define them in the first programme argument, if you do so.


### Output (f90) file

The programme generates f90 code to copy over the existing section in the DSMACC module constants.f90, which links the TUV photolysis IDs to the ones used in DSMACC. Output is saved in the _IO_ folder to the __default file MCM331.f90__, but any other file name and extension can be defined in the fourth programme argument.


## Modifying the code

If you wish to change the default file names or I/O folder, you can do so in the subroutine _finit_.

The file format of the database file can be changed in the corresponding print commands in subroutine _tdlnk_ in _rdfiles.f90_.

The programme searches the kpp file for `J(...)` to retrieve information, which photolysis reactions are used. Should the format of the kpp file change, this search string needs to be adjusted in _jmech_ in _rdfiles.f90_. Should the format of the f90 code in DSMACC change, output needs to be adjusted in subroutine _wrtoutp_.

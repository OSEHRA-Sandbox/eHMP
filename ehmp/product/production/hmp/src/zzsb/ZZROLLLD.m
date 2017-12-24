ZZROLLLD ; SEB - Load data for Rolling Dates MUMPS implementation
 ;;1.0;VistA Data Support;;AUGUST 04, 2016;Build 1
IMPORT S FILENAME="/vagrant/rollingdatesdata.txt",FILENUM=0
 O FILENAME F  U FILENAME R LINE Q:LINE="EOF"  D
 . I $E(LINE,1,6)="file #" S FILENUM=+$E(LINE,7,$L(LINE))
 . I LINE["import_file" S FILE2=$P(LINE,$C(34),2),FILE2="/vagrant/"_$P(FILE2,"/",9,999) S ^ZZROLLDT(FILENUM,"FILE")=FILE2 D IMPORT2(FILE2)
 . I LINE["dik_da_pairs" S Y=$E(LINE,18,$L(LINE)) F CT=2:1 S YY=$P(Y,"[",CT) Q:YY=""  S YYY=$P(YY,"]") S ^ZZROLLDT(FILENUM,"DIKDA",CT-1)=$P(YYY,$C(34),2)_"^"_$P(YYY,$C(34),4)
 . I LINE["execute" F EXECLINE=1:1 U FILENAME R EXEC Q:EXEC["]"  D
 . . S EXECDATA=$TR($P(EXEC,$C(34),2,999),"\",""),EXECEND=$S($E(EXECDATA,$L(EXECDATA))=",":2,1:1),EXECDATA=$E(EXECDATA,1,$L(EXECDATA)-EXECEND)
 . . S ^ZZROLLDT(FILENUM,"EXECUTE",EXECLINE)=EXECDATA
 . . Q
 . Q
 C FILENAME
 Q
 ;
IMPORT2(FILE2) O FILE2 U FILE2 R HEADER1,HEADER2 S F2LINE=0 F  U FILE2 R GLOBAL Q:GLOBAL=""  R DATA D
 . I GLOBAL["{"!(DATA["{") S F2LINE=F2LINE+1,^ZZROLLDT(FILENUM,"GLOBAL",F2LINE)=GLOBAL,^ZZROLLDT(FILENUM,"DATA",F2LINE)=DATA U 0 W !,GLOBAL,"=",DATA
 . Q
 C FILE2
 Q
 ;
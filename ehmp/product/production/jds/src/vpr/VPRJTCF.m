VPRJTCF ;SLC/KCM -- Integration tests for query filters
 ;;1.0;JSON DATA STORE;;Sep 01, 2012
 ;
STARTUP  ; Run once before all tests
 K ^TMP("HTTPERR",$J)
 D BLDPT^VPRJTX
 D MOCK1
 Q
SHUTDOWN ; Run once after all tests
 D CLRPT^VPRJTX
 Q
MOCK1 ; Create mock data to test filter against
 N PID,UID,JPID
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 S JPID="52833885-af7c-4899-90be-b3a6630b2369"
 ;
 S ^VPRPT(JPID,PID,UID,"999","topValue")=1
 S ^VPRPT(JPID,PID,UID,"999","strValue")="quick brown fox"
 S ^VPRPT(JPID,PID,UID,"999","valueA")="red"
 S ^VPRPT(JPID,PID,UID,"999","result")=7.6
 S ^VPRPT(JPID,PID,UID,"999","observed")=20110919
 S ^VPRPT(JPID,PID,UID,"999","facility","name")="VAMC"
 S ^VPRPT(JPID,PID,UID,"999","products",1,"ingredient")="aspirin"
 S ^VPRPT(JPID,PID,UID,"999","products",2,"ingredient")="codeine"
 S ^VPRPT(JPID,PID,UID,"999","orders",1,"clinician","name")="Welby"
 S ^VPRPT(JPID,PID,UID,"999","stampTime")=999
 Q
MOCK2 ; observed date zero padded
 N PID,UID,JPID
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 S JPID="52833885-af7c-4899-90be-b3a6630b2369"
 ;
 S ^VPRPT(JPID,PID,UID,"999","topValue")=1
 S ^VPRPT(JPID,PID,UID,"999","strValue")="quick brown fox"
 S ^VPRPT(JPID,PID,UID,"999","valueA")="red"
 S ^VPRPT(JPID,PID,UID,"999","result")=7.6
 S ^VPRPT(JPID,PID,UID,"999","observed")=20110919000000
 S ^VPRPT(JPID,PID,UID,"999","facility","name")="VAMC"
 S ^VPRPT(JPID,PID,UID,"999","products",1,"ingredient")="aspirin"
 S ^VPRPT(JPID,PID,UID,"999","products",2,"ingredient")="codeine"
 S ^VPRPT(JPID,PID,UID,"999","orders",1,"clinician","name")="Welby"
 S ^VPRPT(JPID,PID,UID,"999","stampTime")=999
 Q
MOCK3 ; observed date exact date time (seconds precision)
 N PID,UID,JPID
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 S JPID="52833885-af7c-4899-90be-b3a6630b2369"
 ;
 S ^VPRPT(JPID,PID,UID,"999","topValue")=1
 S ^VPRPT(JPID,PID,UID,"999","strValue")="quick brown fox"
 S ^VPRPT(JPID,PID,UID,"999","valueA")="red"
 S ^VPRPT(JPID,PID,UID,"999","result")=7.6
 S ^VPRPT(JPID,PID,UID,"999","observed")=20110919092542
 S ^VPRPT(JPID,PID,UID,"999","facility","name")="VAMC"
 S ^VPRPT(JPID,PID,UID,"999","products",1,"ingredient")="aspirin"
 S ^VPRPT(JPID,PID,UID,"999","products",2,"ingredient")="codeine"
 S ^VPRPT(JPID,PID,UID,"999","orders",1,"clinician","name")="Welby"
 S ^VPRPT(JPID,PID,UID,"999","stampTime")=999
 Q
MOCK4 ; observed date exact date time (minute precision)
 N PID,UID,JPID
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 S JPID="52833885-af7c-4899-90be-b3a6630b2369"
 ;
 S ^VPRPT(JPID,PID,UID,"999","topValue")=1
 S ^VPRPT(JPID,PID,UID,"999","strValue")="quick brown fox"
 S ^VPRPT(JPID,PID,UID,"999","valueA")="red"
 S ^VPRPT(JPID,PID,UID,"999","result")=7.6
 S ^VPRPT(JPID,PID,UID,"999","observed")=201109190925
 S ^VPRPT(JPID,PID,UID,"999","facility","name")="VAMC"
 S ^VPRPT(JPID,PID,UID,"999","products",1,"ingredient")="aspirin"
 S ^VPRPT(JPID,PID,UID,"999","products",2,"ingredient")="codeine"
 S ^VPRPT(JPID,PID,UID,"999","orders",1,"clinician","name")="Welby"
 S ^VPRPT(JPID,PID,UID,"999","stampTime")=999
 Q
MOCK5 ; observed date exact date time (minute precision-zero padded/minute boundary)
 N PID,UID,JPID
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 S JPID="52833885-af7c-4899-90be-b3a6630b2369"
 ;
 S ^VPRPT(JPID,PID,UID,"999","topValue")=1
 S ^VPRPT(JPID,PID,UID,"999","strValue")="quick brown fox"
 S ^VPRPT(JPID,PID,UID,"999","valueA")="red"
 S ^VPRPT(JPID,PID,UID,"999","result")=7.6
 S ^VPRPT(JPID,PID,UID,"999","observed")=20110919092500
 S ^VPRPT(JPID,PID,UID,"999","facility","name")="VAMC"
 S ^VPRPT(JPID,PID,UID,"999","products",1,"ingredient")="aspirin"
 S ^VPRPT(JPID,PID,UID,"999","products",2,"ingredient")="codeine"
 S ^VPRPT(JPID,PID,UID,"999","orders",1,"clinician","name")="Welby"
 S ^VPRPT(JPID,PID,UID,"999","stampTime")=999
 Q
ASSERT(EXPECT,ACTUAL,MSG) ; for convenience
 D EQ^VPRJT(EXPECT,ACTUAL,$G(MSG))
 Q
EVAL(LINE) ; return evaluation of statement
 N PID,UID,STMT,CLAUSES,HTTPERR
 K ^TMP("HTTPERR",$J)
 I LINE["+" S STMT=$P($T(@LINE),";;",2,99)
 E  S STMT=LINE
 D PARSE^VPRJCF(STMT,.CLAUSES)
 D ASSERT(0,$D(HTTPERR),"HTTP error:"_$G(HTTPERR))
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 K HTTPERR
 Q $$EVALAND^VPRJCF(.CLAUSES,UID)
 D ASSERT(0,$D(HTTPERR),"HTTP error:"_$G(HTTPERR))
 ;
SIMPLE ;; @TEST simple match
 ;; eq(topValue,1)
 ;; eq(topValue,42)
 ;; eq(missingValue,27)
 ;; eq("products[].ingredient","codeine")
 ;; eq("products[].ingredient","acetaminphen")
 ;; eq("facility.name","VAMC")
 ;; eq("facility.name","other")
 D ASSERT(1,$$EVAL("SIMPLE+1"))
 D ASSERT(0,$$EVAL("SIMPLE+2"))
 D ASSERT(0,$$EVAL("SIMPLE+3"))
 D ASSERT(1,$$EVAL("SIMPLE+4"))
 D ASSERT(0,$$EVAL("SIMPLE+5"))
 D ASSERT(1,$$EVAL("SIMPLE+6"))
 D ASSERT(0,$$EVAL("SIMPLE+7"))
 Q
FLTAND ;; @TEST filter with ands
 ;; eq(topValue,1) eq(strValue,"quick brown fox")
 ;; eq(topValue,1) eq(strValue,"wrong")
 ;; ne(topValue,2) eq("products[].ingredient","aspirin")
 ;; eq(topValue,1) ne("products[].ingredient","acetaminophen")
 ;; eq(topValue,1) eq("products[].ingredient","acetaminophen")
 D ASSERT(1,$$EVAL("FLTAND+1"))
 D ASSERT(0,$$EVAL("FLTAND+2"))
 D ASSERT(1,$$EVAL("FLTAND+3"))
 D ASSERT(1,$$EVAL("FLTAND+4"))
 D ASSERT(0,$$EVAL("FLTAND+5"))
 Q
FLTOR ;; @TEST filter with or's
 ;; eq(topValue,1) or(eq(valueA,"red") eq(valueA,"green"))
 ;; eq(topValue,1) or(eq(valueA,"blue") eq(valueA,"yellow"))
 ;; eq(topValue,1) or{eq(valueA,"red") eq(valueA,"green")}
 D ASSERT(1,$$EVAL("FLTOR+1"))
 D ASSERT(0,$$EVAL("FLTOR+2"))
 D ASSERT(1,$$EVAL("FLTOR+3"))
 Q
FLTNOT ;; @TEST filter with not's
 ;; eq(topValue,1) not(eq(valueA,"yellow") eq(valueA,"green") eq(valueA,"blue"))
 ;; eq(topValue,1) not(eq(valueA,"red") eq(valueA,"green") eq(valueA,"blue"))
 ;; eq(topValue,1) not{eq(valueA,"red") eq(valueA,"green") eq(valueA,"blue")}
 D ASSERT(1,$$EVAL("FLTNOT+1"))
 D ASSERT(0,$$EVAL("FLTNOT+2"))
 D ASSERT(0,$$EVAL("FLTNOT+3"))
 Q
FLTIN ;; @TEST filter in property
 ;; in(valueA,["red","green","blue"])
 ;; in(valueA,["orange","banana","peach"])
 D ASSERT(1,$$EVAL("FLTIN+1"))
 D ASSERT(0,$$EVAL("FLTIN+2"))
 Q
FLTNIN ;; @TEST filter not in array
 ;; nin(valueA,["red","green","blue"])
 ;; nin(valueA,["orange","banana","peach"])
 ;; nin("products[].ingredient",["acetiminophen","ibuprofin"])
 ;; nin("products[].ingredient",["aspirin","codeine"])
 D ASSERT(0,$$EVAL("FLTNIN+1"))
 D ASSERT(1,$$EVAL("FLTNIN+2"))
 D ASSERT(1,$$EVAL("FLTNIN+3"))
 D ASSERT(0,$$EVAL("FLTNIN+4"))
 Q
FLTGTLT ;; @TEST filter gt and lt (value of result is 7.6)
 ;; gt(result,7.0)
 ;; gt(result,8)
 ;; gte(result,7.5)
 ;; gte(result,7.6)
 ;; gte(result,7.7)
 ;; lt(result,8)
 ;; lte(result,6)
 ;; lte(result,7.6)
 ;; lte(result,7.5)
 ;; lt(result,5)
 D ASSERT(1,$$EVAL("FLTGTLT+1"))
 D ASSERT(0,$$EVAL("FLTGTLT+2"))
 D ASSERT(1,$$EVAL("FLTGTLT+3"))
 D ASSERT(1,$$EVAL("FLTGTLT+4"))
 D ASSERT(0,$$EVAL("FLTGTLT+5"))
 D ASSERT(1,$$EVAL("FLTGTLT+6"))
 D ASSERT(0,$$EVAL("FLTGTLT+7"))
 D ASSERT(1,$$EVAL("FLTGTLT+8"))
 D ASSERT(0,$$EVAL("FLTGTLT+9"))
 D ASSERT(0,$$EVAL("FLTGTLT+10"))
 Q
FLTGTLTS ;; @TEST filter gt and lt with strings
 ;; gt(valueA,"blue")
 ;; gt(valueA,"TAN")
 ;; gte(valueA,"record")
 ;; gte(valueA,"red")
 ;; gte(valueA,"reddish")
 ;; lt(valueA,"TAN")
 ;; lte(valueA,"reddish")
 ;; lte(valueA,"red")
 ;; lte(valueA,"blue")
 ;; lt(valueA,"brown")
 D ASSERT(1,$$EVAL("FLTGTLTS+1"))
 D ASSERT(1,$$EVAL("FLTGTLTS+2")) ; lowercase sorts after upper
 D ASSERT(1,$$EVAL("FLTGTLTS+3"))
 D ASSERT(1,$$EVAL("FLTGTLTS+4"))
 D ASSERT(0,$$EVAL("FLTGTLTS+5"))
 D ASSERT(0,$$EVAL("FLTGTLTS+6")) ; uppercase is less than lowercase
 D ASSERT(1,$$EVAL("FLTGTLTS+7"))
 D ASSERT(1,$$EVAL("FLTGTLTS+8"))
 D ASSERT(0,$$EVAL("FLTGTLTS+9"))
 D ASSERT(0,$$EVAL("FLTGTLTS+10"))
 Q
FLTWEEN ;; @TEST between for numerics
 ;; between(result,7,8)
 ;; between(result,6,7)
 ;; between(result,8,9)
 D ASSERT(1,$$EVAL("FLTWEEN+1"))
 D ASSERT(0,$$EVAL("FLTWEEN+2"))
 D ASSERT(0,$$EVAL("FLTWEEN+3"))
 Q
FLTWEENS ;; @TEST between for strings
 ;; between(valueA,"rat","rot")
 ;; between(valueA,"RAT","ROT")
 ;; between(valueA,"reddish","tan")
 D ASSERT(1,$$EVAL("FLTWEENS+1"))
 D ASSERT(0,$$EVAL("FLTWEENS+2"))
 D ASSERT(0,$$EVAL("FLTWEENS+3"))
 Q
FLTLIKE ;; @TEST like for strings
 ;; like(strValue,"%brown%")
 ;; like(strValue,"%red%")
 ;; like(strValue,"%fox")
 ;; like("products[].ingredient","asp%")
 ;; like("products[].ingredient","ace%")
 ;; like("products[].ingredient","%C%")
 D ASSERT(1,$$EVAL("FLTLIKE+1"))
 D ASSERT(0,$$EVAL("FLTLIKE+2"))
 D ASSERT(1,$$EVAL("FLTLIKE+3"))
 D ASSERT(1,$$EVAL("FLTLIKE+4"))
 D ASSERT(0,$$EVAL("FLTLIKE+5"))
 D ASSERT(0,$$EVAL("FLTLIKE+5"))
 Q
FLTILIKE ;; @TEST ilike (case insensitive) for string
 ;; ilike("products[].ingredient","ACE%")
 ;; ilike("products[].ingredient","%C%")
 D ASSERT(0,$$EVAL("FLTILIKE+1"))
 D ASSERT(1,$$EVAL("FLTILIKE+2"))
 Q
FLTEXIST ;; @TEST exist for values
 ;; exists(result)
 ;; exists(absent)
 ;; exists("orders[].clinician.name")
 ;; exists(absent,false)
 D ASSERT(1,$$EVAL("FLTEXIST+1"))
 D ASSERT(0,$$EVAL("FLTEXIST+2"))
 D ASSERT(1,$$EVAL("FLTEXIST+3"))
 D ASSERT(1,$$EVAL("FLTEXIST+4"))
 Q
FLTDATES ;; @TEST dates represented as strings
 ;; between(observed,"2008","2012")
 ;; lt(observed,"201110")
 ;; gte(observed,"20110919")
 ;; lt(observed,"20080919103426")
 D ASSERT(1,$$EVAL("FLTDATES+1"))
 D ASSERT(1,$$EVAL("FLTDATES+2"))
 D ASSERT(1,$$EVAL("FLTDATES+3"))
 D ASSERT(0,$$EVAL("FLTDATES+4"))
 Q
 ;
FLTYYYYMMDD ;; @TEST date comparision with regular operators using YYYMMDD precision
 ; MOCK1 test date:
 ; 20110919
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK1
 S TRUTH("eq")="0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("ne")="1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("gt")="1,1,0,0,0,0,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0"
 S TRUTH("lt")="0,0,0,1,1,1,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,1,1"
 S TRUTH("gte")="1,1,1,0,0,0,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0"
 S TRUTH("lte")="0,0,1,1,1,1,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,1,1"
 S TRUTH("begins")="1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("between")="0,0,0,0,0,0,0,0,0,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 ;
 K TRUTH
 S TRUTH("eq")="0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("ne")="1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("gt")="1,1,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0"
 S TRUTH("lt")="0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1"
 S TRUTH("gte")="1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0"
 S TRUTH("lte")="0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1"
 S TRUTH("begins")="1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("between")="1,1,1,0,0,0,1,1,0,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTDATEYYYMMDD ;; @TEST date comparision using YYYMMDD precision
 ; MOCK1 test date:
 ; 20110919
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK1
 S TRUTH("deq")="0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("dne")="1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1"
 S TRUTH("dgt")="1,1,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0"
 S TRUTH("dlt")="0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,1,1"
 S TRUTH("dgte")="1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,0,0"
 S TRUTH("dlte")="0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1"
 S TRUTH("dbegins")="1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("dbetween")="1,1,1,0,0,0,1,1,1,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTYYYYMMDDZ ;; @TEST date comparision with regular operators using YYYMMDD zero padded
 ; MOCK2 test date:
 ; 20110919000000
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK2
 S TRUTH("eq")="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("ne")="1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1"
 S TRUTH("gt")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0"
 S TRUTH("lt")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1"
 S TRUTH("gte")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,0"
 S TRUTH("lte")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1"
 S TRUTH("begins")="1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("between")="0,0,0,0,0,0,0,0,0,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 ;
 K TRUTH
 S TRUTH("eq")="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("ne")="1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1"
 S TRUTH("gt")="1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0"
 S TRUTH("lt")="0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,1,1"
 S TRUTH("gte")="1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,0,0"
 S TRUTH("lte")="0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1"
 S TRUTH("begins")="1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("between")="1,1,1,0,0,0,1,1,1,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTDATEYYYYMMDDZ ;; @TEST date comparision using YYYYMMDD zero padded
 ; MOCK2 test date:
 ; 20110919000000
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK2
 S TRUTH("deq")="0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("dne")="1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1"
 S TRUTH("dgt")="1,1,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0"
 S TRUTH("dlt")="0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,1,1"
 S TRUTH("dgte")="1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,0,0"
 S TRUTH("dlte")="0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1"
 S TRUTH("dbegins")="1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0"
 S TRUTH("dbetween")="1,1,1,0,0,0,1,1,1,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTYYYYMMDDHHMMSS ;; @TEST date comparision with regular operators using YYYYMMDDHHMMSS precision
 ; MOCK3 test date:
 ; 20110919092542
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK3
 S TRUTH("eq")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("ne")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("gt")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1"
 S TRUTH("lt")="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0"
 S TRUTH("gte")="1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1"
 S TRUTH("lte")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0"
 S TRUTH("begins")="1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("between")="0,0,0,0,0,0,0,0,0,0,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 ;
 K TRUTH
 S TRUTH("eq")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("ne")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("gt")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("lt")="0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("gte")="1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("lte")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("begins")="1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("between")="1,1,1,1,1,1,1,1,1,1,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTDATEYYYYMMDDHHMMSS ;; @TEST date comparision using YYYYMMDDHHMMSS precision
 ; MOCK3 test date:
 ; 20110919092542
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK3
 S TRUTH("deq")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("dne")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("dgt")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("dlt")="0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("dgte")="1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("dlte")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("dbegins")="1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("dbetween")="1,1,1,1,1,1,1,1,1,1,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTYYYYMMDDHHMM ;; @TEST date comparision with regular operators using YYYYMMDDHHMM precision
 ; MOCK4 test date:
 ; 201109190925
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK4
 S TRUTH("eq")="0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("ne")="1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("gt")="1,1,1,1,0,0,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,0,0"
 S TRUTH("lt")="0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1"
 S TRUTH("gte")="1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,0,0"
 S TRUTH("lte")="0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1"
 S TRUTH("begins")="1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("between")="0,0,0,0,0,0,0,0,0,0,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 ;
 K TRUTH
 S TRUTH("eq")="0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("ne")="1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
 S TRUTH("gt")="1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0"
 S TRUTH("lt")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1"
 S TRUTH("gte")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0"
 S TRUTH("lte")="0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1"
 S TRUTH("begins")="1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("between")="1,1,1,1,1,0,1,1,1,1,0"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTDATEYYYYMMDDHHMM ;; @TEST date comparision using YYYYMMDDHHMM precision
 ; MOCK4 test date:
 ; 201109190925
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK4
 S TRUTH("deq")="0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("dne")="1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0"
 S TRUTH("dgt")="1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0"
 S TRUTH("dlt")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("dgte")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("dlte")="0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1"
 S TRUTH("dbegins")="1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
 S TRUTH("dbetween")="1,1,1,1,1,0,1,1,1,1,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTYYYYMMDDHHMMSSZ ;; @TEST date comparision with regular operators using YYYYMMDDHHMM Zero Padded/minute boundary
 ; MOCK5 test date:
 ; 20110919092500
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK5
 S TRUTH("eq")="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("ne")="1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0"
 S TRUTH("gt")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0"
 S TRUTH("lt")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0"
 S TRUTH("gte")="1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1"
 S TRUTH("lte")="0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1"
 S TRUTH("begins")="1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("between")="0,0,0,0,0,0,0,0,0,0,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 ;
 K TRUTH
 S TRUTH("eq")="0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("ne")="1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0"
 S TRUTH("gt")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0"
 S TRUTH("lt")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("gte")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("lte")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1"
 S TRUTH("begins")="1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("between")="1,1,1,1,1,0,1,1,1,1,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
FLTDATEYYYYMMDDHHMMSSZ ;; @TEST date comparision using YYYYMMDDHHMM Zero Padded/minute boundary
 ; MOCK5 test date:
 ; 20110919092500
 ;
 ; DATECHK scenarios:
 ; 2011, 201109, 20110919, 2011091909, 201109190925, 20110919092542
 ; 2010, 201002, 20100205, 2010020513, 201002051302, 20100205130259
 ; 2012, 201205, 20120501, 2012050108, 201205010812, 20120501081238
 ; 20110000000000, 20110900000000, 20110919000000, 20110919090000, 20110919092500
 ;
 ; DATECHK scenarios for between:
 ; (2011,2012), (201109,2012), (20110919,2012)
 ; (2011091909,2012), (201109190925,2012), (20110919092542,2012)
 ; (20110000000000,201200), (20110900000000,20120000) (20110919000000,2012000000)
 ; (20110919090000,201200000000), (20110919092500,20120000000000)
 ;
 N TRUTH,OPERATOR
 D MOCK5
 S TRUTH("deq")="0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("dne")="1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0"
 S TRUTH("dgt")="1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0"
 S TRUTH("dlt")="0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0"
 S TRUTH("dgte")="1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1"
 S TRUTH("dlte")="0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1"
 S TRUTH("dbegins")="1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
 S TRUTH("dbetween")="1,1,1,1,1,0,1,1,1,1,1"
 S OPERATOR=""
 F  S OPERATOR=$O(TRUTH(OPERATOR)) Q:OPERATOR=""  D
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),0)
 . D DATECHK(OPERATOR,TRUTH(OPERATOR),1)
 Q
 ;
DATECHK(OPERATOR,TRUTH,QUOTED)
 N QUOTE,PID,UID,JPID,OBSERVED
 ;
 S PID=VPRJTPID,UID="urn:va:test:93EF:-7:1"
 S JPID="52833885-af7c-4899-90be-b3a6630b2369"
 S QUOTE=$S(QUOTED:"""",1:"")
 S OBSERVED=$G(^VPRPT(JPID,PID,UID,"999","observed"))
 ;
 W !,"DATE "_OPERATOR_" as a "_$S(QUOTED:"string",1:"number")
 ;
 I OPERATOR="between"!(OPERATOR="dbetween") D
 . D ASSERT($P(TRUTH,",",1),$$EVAL(OPERATOR_"(observed,"_QUOTE_2011_QUOTE_","_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",1)=0:"",1:"not ")_OPERATOR_" "_"2011 and 2012")
 . D ASSERT($P(TRUTH,",",2),$$EVAL(OPERATOR_"(observed,"_QUOTE_201109_QUOTE_","_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",2)=0:"",1:"not ")_OPERATOR_" "_"201109 and 2012")
 . D ASSERT($P(TRUTH,",",3),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919_QUOTE_","_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",3)=0:"",1:"not ")_OPERATOR_" "_"20110919 and 2012")
 . D ASSERT($P(TRUTH,",",4),$$EVAL(OPERATOR_"(observed,"_QUOTE_2011091909_QUOTE_","_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",4)=0:"",1:"not ")_OPERATOR_" "_"2011091909 and 2012")
 . D ASSERT($P(TRUTH,",",5),$$EVAL(OPERATOR_"(observed,"_QUOTE_201109190925_QUOTE_","_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",5)=0:"",1:"not ")_OPERATOR_" "_"20110909190925 and 2012")
 . D ASSERT($P(TRUTH,",",6),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919092542_QUOTE_","_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",6)=0:"",1:"not ")_OPERATOR_" "_"2011090919092542 and 2012")
 . D ASSERT($P(TRUTH,",",7),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110000000000_QUOTE_","_QUOTE_201200_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",7)=0:"",1:"not ")_OPERATOR_" "_"20110000000000 and 201200")
 . D ASSERT($P(TRUTH,",",8),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110900000000_QUOTE_","_QUOTE_20120000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",8)=0:"",1:"not ")_OPERATOR_" "_"20110900000000 and 20120000")
 . D ASSERT($P(TRUTH,",",9),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919000000_QUOTE_","_QUOTE_2012000000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",9)=0:"",1:"not ")_OPERATOR_" "_"20110919000000 and 2012000000")
 . D ASSERT($P(TRUTH,",",10),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919090000_QUOTE_","_QUOTE_201200000000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",10)=0:"",1:"not ")_OPERATOR_" "_"20110919090000 and 201200000000")
 . D ASSERT($P(TRUTH,",",11),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919092500_QUOTE_","_QUOTE_20120000000000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",11)=0:"",1:"not ")_OPERATOR_" "_"20110919092500 and 20120000000000")
 E  D
 . D ASSERT($P(TRUTH,",",1),$$EVAL(OPERATOR_"(observed,"_QUOTE_2011_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",1)=0:"",1:"not ")_OPERATOR_" 2011")
 . D ASSERT($P(TRUTH,",",2),$$EVAL(OPERATOR_"(observed,"_QUOTE_201109_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",2)=0:"",1:"not ")_OPERATOR_" 201109")
 . D ASSERT($P(TRUTH,",",3),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",3)=0:"",1:"not ")_OPERATOR_" 20110919")
 . D ASSERT($P(TRUTH,",",4),$$EVAL(OPERATOR_"(observed,"_QUOTE_2011091909_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",4)=0:"",1:"not ")_OPERATOR_" 2011091909")
 . D ASSERT($P(TRUTH,",",5),$$EVAL(OPERATOR_"(observed,"_QUOTE_201109190925_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",5)=0:"",1:"not ")_OPERATOR_" 201109190925")
 . D ASSERT($P(TRUTH,",",6),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919092542_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",6)=0:"",1:"not ")_OPERATOR_" 20110919092542")
 . D ASSERT($P(TRUTH,",",7),$$EVAL(OPERATOR_"(observed,"_QUOTE_2010_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",7)=0:"",1:"not ")_OPERATOR_" 2010")
 . D ASSERT($P(TRUTH,",",8),$$EVAL(OPERATOR_"(observed,"_QUOTE_201002_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",8)=0:"",1:"not ")_OPERATOR_" 201002")
 . D ASSERT($P(TRUTH,",",9),$$EVAL(OPERATOR_"(observed,"_QUOTE_20100205_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",9)=0:"",1:"not ")_OPERATOR_" 20100205")
 . D ASSERT($P(TRUTH,",",10),$$EVAL(OPERATOR_"(observed,"_QUOTE_2010020513_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",10)=0:"",1:"not ")_OPERATOR_" 2010020513")
 . D ASSERT($P(TRUTH,",",11),$$EVAL(OPERATOR_"(observed,"_QUOTE_201002051302_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",11)=0:"",1:"not ")_OPERATOR_" 201002051302")
 . D ASSERT($P(TRUTH,",",12),$$EVAL(OPERATOR_"(observed,"_QUOTE_20100205130259_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",12)=0:"",1:"not ")_OPERATOR_" 20100205130259")
 . D ASSERT($P(TRUTH,",",13),$$EVAL(OPERATOR_"(observed,"_QUOTE_2012_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",13)=0:"",1:"not ")_OPERATOR_" 2012")
 . D ASSERT($P(TRUTH,",",14),$$EVAL(OPERATOR_"(observed,"_QUOTE_201205_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",14)=0:"",1:"not ")_OPERATOR_" 201205")
 . D ASSERT($P(TRUTH,",",15),$$EVAL(OPERATOR_"(observed,"_QUOTE_20120501_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",15)=0:"",1:"not ")_OPERATOR_" 20120501")
 . D ASSERT($P(TRUTH,",",16),$$EVAL(OPERATOR_"(observed,"_QUOTE_2012050108_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",16)=0:"",1:"not ")_OPERATOR_" 2012050108")
 . D ASSERT($P(TRUTH,",",17),$$EVAL(OPERATOR_"(observed,"_QUOTE_201205010812_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",17)=0:"",1:"not ")_OPERATOR_" 201205010812")
 . D ASSERT($P(TRUTH,",",18),$$EVAL(OPERATOR_"(observed,"_QUOTE_20120501081238_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",18)=0:"",1:"not ")_OPERATOR_" 20120501081238")
 . D ASSERT($P(TRUTH,",",19),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110000000000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",19)=0:"",1:"not ")_OPERATOR_" 20110000000000")
 . D ASSERT($P(TRUTH,",",20),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110900000000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",20)=0:"",1:"not ")_OPERATOR_" 20110900000000")
 . D ASSERT($P(TRUTH,",",21),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919000000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",21)=0:"",1:"not ")_OPERATOR_" 20110919000000")
 . D ASSERT($P(TRUTH,",",22),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919090000_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",22)=0:"",1:"not ")_OPERATOR_" 20110919090000")
 . D ASSERT($P(TRUTH,",",23),$$EVAL(OPERATOR_"(observed,"_QUOTE_20110919092500_QUOTE_")"),OBSERVED_" is "_$S($P(TRUTH,",",23)=0:"",1:"not ")_OPERATOR_" 20110919092500")
 Q

VPRJTSYST ;KRM/CJE -- Unit Tests for GET Patient Sync Status
 ;;1.0;JSON DATA STORE;;Dec 16, 2014
 ;
STARTUP  ; Run once before all tests
 K ^VPRSTATUS
 K ^VPRPTJ("JPID")
 K ^VPRMETA("JPID")
 D PATIDS
 Q
SHUTDOWN ; Run once after all tests
 K ^VPRSTATUS
 K ^VPRPTJ("JPID")
 K ^VPRMETA("JPID")
 Q
ASSERT(EXPECT,ACTUAL,MSG) ; for convenience
 D EQ^VPRJT(EXPECT,ACTUAL,$G(MSG))
 Q
 ;
BLANK ; basic sync status
 K ^VPRSTATUS
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","stampTime")=20141031094920
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920)=""
 Q
 ;
BLANK2 ; basic sync status
 K ^VPRSTATUS
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","stampTime")=20141031094920
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","stampTime")=20141031094930
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094933)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094931)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094931)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals",20141031094933)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094932)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094932)=""
 Q
 ;
BLANK2DIFF ; basic sync status
 K ^VPRSTATUS
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","stampTime")=20141031094920
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","stampTime")=20141031094930
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094933)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094931)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094931)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals",20141031094933)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094932)=""
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094932)=""
 Q
 ;
PATIDS ; Setup patient identifiers
 S ^VPRPTJ("JPID","52833885-af7c-4899-90be-b3a6630b2369")=""
 S ^VPRPTJ("JPID","52833885-af7c-4899-90be-b3a6630b2369","SITE;3")=""
 S ^VPRPTJ("JPID","52833885-af7c-4899-90be-b3a6630b2369","SITE;3")=""
 S ^VPRPTJ("JPID","52833885-af7c-4899-90be-b3a6630b2369","1234V4321")=""
 S ^VPRPTJ("JPID","SITE;3")="52833885-af7c-4899-90be-b3a6630b2369"
 S ^VPRPTJ("JPID","SITE;3")="52833885-af7c-4899-90be-b3a6630b2369"
 S ^VPRPTJ("JPID","1234V4321")="52833885-af7c-4899-90be-b3a6630b2369"
 Q
GETBEFORE ;; @TEST Get Patient Sync Status before metastamp stored
 N DATA,ARG,ERR,OBJECT,HTTPERR
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Ensure that the JSON matches what we expect
 ; this Sync Status should always be in progress
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; Try again with an event stored
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Ensure that the JSON matches what we expect
 ; this Sync Status should always be in progress
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 K @DATA
 Q
GETINITIAL ;; @TEST Get Initial Patient Sync Status
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Ensure that the JSON matches what we expect
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; ensure all elements of inProgress exist
 D ASSERT("1234V4321",$G(OBJECT("inProgress","icn")))
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 D ASSERT("SITE;3",$G(OBJECT("inProgress","sourceMetaStamp","SITE","pid")),"pid is incorrect")
 D ASSERT(3,$G(OBJECT("inProgress","sourceMetaStamp","SITE","localId")),"localId is incorrect")
 D ASSERT(20141031094920,$G(OBJECT("inProgress","sourceMetaStamp","SITE","stampTime")),"source stampTime doesn't exist")
 ; ensure allergy domain and event stamps exist correctly
 D ASSERT("allergy",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","domain")),"allergy domain doesn't exist")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT(20141031094920,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stampTime")),"Allergy SITE:3:1001 stampTime doesn't exist")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 shouldn't be stored")
 D ASSERT(20141031094920,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stampTime")),"Allergy SITE:3:1002 stampTime doesn't exist")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 shouldn't be stored")
 ; ensure vitals domain and event stamps exist correctly
 D ASSERT("vitals",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","domain")),"vitals domain doesn't exist")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT(20141031094920,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stampTime")),"Vital SITE:3:1001 stampTime doesn't exist")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 shouldn't be stored")
 D ASSERT(20141031094920,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stampTime")),"Vital SITE:3:1002 stampTime doesn't exist")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 shouldn't be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 K @DATA
 Q
GETLASTVITAL ;; @TEST Get Patient Sync Status - Last Vital Stored
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"stored is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(1,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 ; Last Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 K @DATA
 Q
GETLASTALLERGY ;; @TEST Get Patient Sync Status - Last Allergy Stored
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(1,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"stored is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
  ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"stored is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored")
 ; Last Allergy should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 K @DATA
 Q
GETLASTALLERGYVITAL ;; @TEST Get Patient Sync Status - Last Vital & Allergy Stored
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(1,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"stored is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(1,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"stored is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 ; Last Allergy & Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 K @DATA
 Q
GETALLERGY ;; @TEST Get Patient Sync Status - Both Allergies Stored. Test complete flag being set
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 K @DATA
 Q
GETVITAL ;; @TEST Get Patient Sync Status - Both Vitals Stored. Test complete flag being set
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 K @DATA
 Q
GETBOTH ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored. Test SyncComplete flag being set
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be completed
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(10,$D(OBJECT("completedStamp")),"Sync status is not completed")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(0,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress exists, but should not")
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))?14N,"syncCompleteAsOf isn't 14 digits")
 K @DATA
 Q
GET2SAMESOURCE ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored. Test SyncComplete flag being set for 2 metaStamps for the same source
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK2
 ; Setup to make sure the old object doesn't appear
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be inProgress (completed stamp should not appear as it is older)
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not completed")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored")
 ; Vitals domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 ; Setup to make sure the new object completes
 K ARG,@DATA,OBJECT,ERR
 ; Set complete flags - allergy uses incorrect times
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094932,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should now be completed
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not completed and should be")
 D ASSERT(10,$D(OBJECT("completedStamp")),"Sync status is not completed")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(0,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))?14N,"syncCompleteAsOf isn't 14 digits")
 ; Setup to make sure the new object completes
 K ARG,@DATA,OBJECT,ERR
 ; Set complete flags - allergy uses correct times
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094931,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094931,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should now be completed
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(10,$D(OBJECT("completedStamp")),"Sync status is completed")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(0,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress exists, but should not")
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))?14N,"syncCompleteAsOf isn't 14 digits")
 K @DATA
 Q
GET2DIFFSOURCE ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored. Test SyncComplete flag being set for 2 metaStamps for different sources
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK2DIFF
 ; Setup to make sure both objects are inProgress
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be inProgress (completed stamp should not appear as it is older)
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is completed")
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 D ASSERT(0,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp exists, but should not")
 ; SITE
 ; Source should exist
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE")),"Source SITE should exist")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 ; SITE
 ; Source should exist
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE")),"Source SITE should exist")
 ; Allergy domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored")
 ; Vitals domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 ; Setup to make sure one source is complete
 K ARG,@DATA,OBJECT,ERR
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; SITE
 ; this Sync Status should now be completed
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; Source should exist
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE")),"Source SITE should exist and be complete (SITE)")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete (SITE)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored (SITE)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored (SITE)")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete (SITE)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored (SITE)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored (SITE)")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))?14N,"syncCompleteAsOf isn't 14 digits")
 ; SITE
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 ; Source should exist
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE")),"Source SITE should exist and not be complete (SITE)")
 ; Allergy domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete (SITE)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored (SITE)")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored (SITE)")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete (SITE)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored (SITE)")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored (SITE)")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should not exist")
 ; Setup to make sure both sources are complete
 K ARG,@DATA,OBJECT,ERR
 ; Set complete flags SITE
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094931,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094931,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; SITE
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; this Sync Status should now be completed
 ; Source should exist
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE")),"Source SITE should exist and be complete (All)")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete (All)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored (All)")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete (All)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored (All)")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))?14N,"syncCompleteAsOf isn't 14 digits")
 ; SITE
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; Source should exist
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE")),"Source SITE should exist and be complete (All)")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete (All)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored (All)")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete (All)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored (All)")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf")),"syncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))?14N,"syncCompleteAsOf isn't 14 digits")
 K @DATA
 Q
 ;
GETFILTER ;; @TEST Get Patient Sync Status with filters
 N DATA,ARG,ERR,OBJECT,HTTPERR
 K ^||TMP("HTTPERR",$J)
 D BLANK
 ;
 S ARG("id")="SITE;3"
 ; Test that domain can be filtered when not in detailed mode
 S ARG("filter")="eq(""domain"",""allergy"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 ;
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Test filters while inProgress
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy")),"Allergy domain does not exist and it should")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals")),"Vitals domain exists and it should not")
 ;
 K DATA,OBJECT
 S ARG("detailed")="true"
 ; Test that domain has been stored when in detailed mode
 S ARG("filter")="eq(""domain"",""vitals"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; In detailed mode, domain filtering only filters eventMetaStamp, not domainMetaStamp
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp")),"Allergy domain exists and it should not")
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp")),"Vitals domain does not exist and it should")
 ;
 K DATA,OBJECT
 S ARG("detailed")="true"
 ; Test that filter by uid works
 S ^VPRSTATUS("SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ARG("filter")="eq(""uid"",""urn:va:vitals:SITE:3:1001"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable undefined") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; In detailed mode, domain filtering only filters eventMetaStamp, not domainMetaStamp
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp")),"Vitals domain does not exist and it should")
 ;
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 ; Test that syncCompleted
 K DATA,OBJECT
 K ARG("detailed")
 ; Test that sync has been complete when not in detailed mode
 S ARG("filter")="exists(""syncCompleted"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Test filters while in completedStamp
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy")),"Allergy domain does not exist and it should")
 D ASSERT(0,$D(OBJECT("completedStampe","sourceMetaStamp","SITE","domainMetaStamp","vitals")),"Vitals domain exists and it should not")
 ;
 K DATA,OBJECT
 S ARG("detailed")="true"
 ; Test that domain has been stored when in detailed mode
 S ARG("filter")="eq(""domain"",""allergy""),exists(""stored"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp")),"Allergy domain exists and it should not")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp")),"Vitals domain does not exist and it should")
 Q
 ;
GET2NODOMAINSTAMP ;; @TEST Get Patient Sync Status - Domain syncComplete only when domain stamp exists
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK2DIFF
 ;
 ; Remove domainstamp for the first site
 K ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094920)
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; SITE
 ; this Sync Status should be inProgress since a domainStamp for allergies doesn't exist
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; Source should exist
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE")),"Source SITE should exist and be complete (SITE)")
 ; Allergy domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete (SITE)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored (SITE)")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored (SITE)")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete (SITE)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored (SITE)")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored (SITE)")
 ; SITE
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime inProgress does not exist, but should")
 ; Source should exist
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE")),"Source SITE should exist and not be complete (SITE)")
 ; Allergy domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete (SITE)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should not be stored (SITE)")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should not be stored (SITE)")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete (SITE)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(0,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should not be stored (SITE)")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should not be stored (SITE)")
 ; Setup to make sure both sources are complete
 K ARG,@DATA,OBJECT,ERR
 ; Set the domain metastamp for SITE
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy",20141031094920)=""
 ; Kill the domain metastamp for SITE
 K ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals",20141031094933)
 ; Set complete flags SITE
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094932,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094931,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094931,"stored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; SITE
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("completedStamp","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; this Sync Status should now be completed
 ; Source should exist
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE")),"Source SITE should exist and be complete (All)")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete (All)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored (All)")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete (All)")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored (All)")
 ; SITE
 ; Since the sync status is mocked, lastAccessTime won't be set but should exist
 D ASSERT(1,$D(OBJECT("inProgress","lastAccessTime"))#2,"Sync lastAccessTime completedStamp does not exist, but should")
 ; Source should exist
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE")),"Source SITE should exist and be complete (All)")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should be complete (All)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","stored")),"Allergy SITE:3:1002 should be stored (All)")
 ; Vitals domain should be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should not be complete (All)")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventCount")),"eventCount is incorrect")
 D ASSERT(2,$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","storedCount")),"storedCount is incorrect")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","stored")),"Vital SITE:3:1001 should be stored (All)")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vital SITE:3:1002 should be stored (All)")
 K @DATA
 Q
 ;
 ; SOLR stored tests
 ;
GETBEFORESOLR ;; @TEST Get Patient Sync Status before metastamp stored (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 ;
 ; Clean out all old data
 K ^VPRSTATUS
 K ^VPRPTJ("JPID")
 K ^VPRMETA("JPID")
 D PATIDS
 ;
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; since solrSyncComplete is nested under inProgress or completedStamp, the code below will catch
 ; it without an explicit test
 D ASSERT(0,$D(OBJECT("inProgress")),"inProgress Sync Status exists")
 D ASSERT(0,$D(OBJECT("completedStamp")),"completedStamp Sync Status exists")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncComplete exists when it shouldn't")
 ; Try again with an event stored
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; since solrSyncComplete is nested under inProgress or completedStamp, the code below will catch
 ; it without an explicit test
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETINITIALSOLR ;; @TEST Get Initial Patient Sync Status (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncComplete exists when it shouldn't")
 ; ensure allergy domain and event stamps exist correctly
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 shouldn't be solrStored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 shouldn't be solrStored")
 ; ensure vitals domain and event stamps exist correctly
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 shouldn't be solrStored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 shouldn't be solrStored")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETLASTVITALSOLR ;; @TEST Get Patient Sync Status - Last Vital Stored (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncComplete exists when it shouldn't")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 should not be solrStored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 should not be solrStored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 should not be solrStored")
 ; Last Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 should be solrStored")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETLASTALLERGYSOLR ;; @TEST Get Patient Sync Status - Last Allergy Stored (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrStored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't be")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 should not be stored")
  ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 should not be solrStored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 should not be solrStored")
 ; Last Allergy should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 should be solrStored")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETLASTALLERGYVITALSOLR ;; @TEST Get Patient Sync Status - Last Vital & Allergy Stored (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't be")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 should not be solrStored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 should not be solrStored")
 ; Last Allergy & Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 should be solrStored")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 should be solrStored")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETALLERGYSOLR ;; @TEST Get Patient Sync Status - Both Allergies Stored. Test complete flag being set (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrStored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't be")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should be solrSyncComplete")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 should be solrStored")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 should be solrStored")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncComplete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 should not be solrStored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 should not be solrStored")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETVITALSOLR ;; @TEST Get Patient Sync Status - Both Vitals Stored. Test complete flag being set (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncComplete exists when it shouldn't")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","syncCompleted")),"allergy domain should not be complete")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 should not be solrStored")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 should not be solrStored")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","syncCompleted")),"vitals domain should be complete")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 should be solrStored")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 should be solrStored")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETBOTHSOLR ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored. Test SyncComplete flag being set (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrStored")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be completed
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(10,$D(OBJECT("completedStamp")),"Sync status is not completed")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncComplete doesn't exist when it should")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should be solrSyncComplete")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy SITE:3:1001 should be solrStored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrStored")),"Allergy SITE:3:1002 should be solrStored")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should be solrSyncComplete")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 should be solrStored")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 should be solrStored")
 D ASSERT(1,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf"))?14N,"solrSyncCompleteAsOf isn't 14 digits")
 K @DATA
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
GETFILTERSOLR ;; @TEST Get Patient Sync Status with filters (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 N SOLR
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 K ^TMP("HTTPERR",$J)
 D BLANK
 ;
 S ARG("id")="SITE;3"
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 ; Test that syncCompleted
 K DATA,OBJECT
 K ARG("detailed")
 ; Test that sync has been complete when not in detailed mode
 S ARG("filter")="exists(""solrSyncCompleted"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Test filters while in completedStamp
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy")),"Allergy domain does not exist and it should")
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals")),"Vitals domain does not exist and it should")
 ;
 K DATA,OBJECT
 S ARG("detailed")="true"
 ; Test that domain has been stored when in detailed mode
 S ARG("filter")="eq(""domain"",""allergy""),exists(""solrStored"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp")),"Allergy domain does not exist and it should")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp")),"Vitals domain exists and it should not")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf isn't a domain and it should not exist")
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 Q
 ;
GETSOLREXCEPTIONS ;; @TEST Get Patient Simple Sync Status with SOLR domain exceptions
 N DATA,ARG,ERR,OBJECT,HTTPERR
 ; save off SOLR configuration
 N SOLR,DOMAINEXCEPTIONS
 S SOLR=$G(^VPRCONFIG("sync","status","solr"))
 M DOMAINEXCEPTIONS=^VPRCONFIG("sync","status","solr","domainExceptions")
 K ^VPRCONFIG("sync","status","solr","domainExceptions")
 ; Enable SOLR Sync Status reporting
 S ^VPRCONFIG("sync","status","solr")=1
 D BLANK
 S ARG("id")="SITE;3"
 ;
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 ;
 S ARG("detailed")="false"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 I $D(DATA) K OBJECT D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ;
 ; Ensure that the JSON matches what we expect
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"Allergy SOLR data should be false")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"Vitals SOLR data should be false")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should not exist")
 ;
 ; Try again with the allergy domain added to the exceptions list
 S ^VPRCONFIG("sync","status","solr","domainExceptions","allergy")=""
 ;
 D GET^VPRJPSTATUS(.DATA,.ARG)
 I $D(DATA) K OBJECT D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Ensure that the JSON matches what we expect
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"Allergy SOLR data should be true")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"Vitals SOLR data should be false")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should not exist")
 ;
 ; Try again with the vitals domain also added to the exceptions list
 S ^VPRCONFIG("sync","status","solr","domainExceptions","vitals")=""
 ;
 D GET^VPRJPSTATUS(.DATA,.ARG)
 I $D(DATA) K OBJECT D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ;
 ; Ensure that the JSON matches what we expect
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"Allergy SOLR data should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"Vitals SOLR data should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted should be true")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))=$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should match syncCompleteAsOf")
 ;
 ; Remove the SOLR domain exceptions and re-run with detail
 K ^VPRCONFIG("sync","status","solr","domainExceptions","allergy")
 K ^VPRCONFIG("sync","status","solr","domainExceptions","vitals")
 ;
 H 1 ; ensure that solrSyncCompleteAsOf is an earlier timestamp than syncCompleteAsOf during failed SOLR syncs
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 I $D(DATA) K OBJECT D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ;
 ; Ensure that the JSON matches what we expect
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"Allergy SOLR data should be false")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"Vitals SOLR data should be false")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy stored flag should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vitals stored flag should be true")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy solrStored flag should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vitals solrStored flag should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted should not exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))>$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should be an earlier date than syncCompleteAsOf")
 ;
 ; Try again with the allergy domain added to the exceptions list
 S ^VPRCONFIG("sync","status","solr","domainExceptions","allergy")=""
 ;
 D GET^VPRJPSTATUS(.DATA,.ARG)
 I $D(DATA) K OBJECT D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Ensure that the JSON matches what we expect
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"Allergy SOLR data should be true")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"Vitals SOLR data should be false")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy stored flag should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vitals stored flag should be true")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy solrStored flag should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vitals solrStored flag should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted should not exist")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))>$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should be an earlier date than syncCompleteAsOf")
 ;
 ; Try again with the vitals domain also added to the exceptions list
 S ^VPRCONFIG("sync","status","solr","domainExceptions","vitals")=""
 ;
 D GET^VPRJPSTATUS(.DATA,.ARG)
 I $D(DATA) K OBJECT D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ;
 ; Ensure that the JSON matches what we expect
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"Allergy SOLR data should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"Vitals SOLR data should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","stored")),"Allergy stored flag should be true")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","stored")),"Vitals stored flag should be true")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrStored")),"Allergy solrStored flag should not exist")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vitals solrStored flag should not exist")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted should be true")
 D ASSERT(1,$G(OBJECT("completedStamp","sourceMetaStamp","SITE","syncCompleteAsOf"))=$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleteAsOf")),"solrSyncCompleteAsOf should match syncCompleteAsOf")
 ;
 I $D(DATA) K @DATA
 K ^VPRPTJ("JPID")
 D PATIDS
 ; Reset SOLR configuration
 S:(SOLR'="") ^VPRCONFIG("sync","status","solr")=SOLR
 K ^VPRCONFIG("sync","status","solr","domainExceptions")
 M ^VPRCONFIG("sync","status","solr","domainExceptions")=DOMAINEXCEPTIONS
 Q
 ;
 ; SOLR ERROR tests
 ;
GETBEFORESOLRERROR ;; @TEST Get Patient Sync Status before metastamp stored (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 ; Clean out all old data
 K ^VPRSTATUS
 K ^VPRPTJ("JPID")
 K ^VPRMETA("JPID")
 D PATIDS
 ;
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; since solrSyncComplete is nested under inProgress or completedStamp, the code below will catch
 ; it without an explicit test
 D ASSERT(0,$D(OBJECT("inProgress")),"inProgress Sync Status exists")
 D ASSERT(0,$D(OBJECT("completedStamp")),"completedStamp Sync Status exists")
 ; Try again with a solr event in error
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; This data won't exist since we haven't received an initial metastamp yet.
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")))
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")))
 K @DATA
 Q
GETINITIALSOLRERROR ;; @TEST Get Initial Patient Sync Status (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSolrError")),"hasSolrError set when it shouldn't")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted set when it shouldn't")
 ; ensure allergy domain and event stamps exist correctly
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should not have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 shouldn't have solrError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 shouldn't have solrError")
 ; ensure vitals domain and event stamps exist correctly
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should not have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrStored")),"Vital SITE:3:1001 shouldn't have solrError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrStored")),"Vital SITE:3:1002 shouldn't have solrError")
 K @DATA
 Q
GETLASTVITALSOLRERROR ;; @TEST Get Patient Sync Status - Last Vital Stored (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should not have solrError
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should not have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should not have solrError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should not have solrError")
 ; Vitals domain should have solrError
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should not have solrError")
 ; Last Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should have solrError")
 K @DATA
 Q
GETLASTALLERGYSOLRERROR ;; @TEST Get Patient Sync Status - Last Allergy Stored (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should have solrError
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should not have solrError")
  ; Vitals domain should not have solrError
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should not have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should not have solrError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should not have solrError")
 ; Last Allergy should have solrError
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should have solrError")
 K @DATA
 Q
GETLASTALLERGYVITALSOLRERROR ;; @TEST Get Patient Sync Status - Last Vital & Allergy Stored (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should not be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should not have solrError")
 ; Vitals domain should not be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should not have solrError")
 ; Last Allergy & Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should have solrError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should have solrError")
 K @DATA
 Q
GETALLERGYSOLRERROR ;; @TEST Get Patient Sync Status - Both Allergies Stored. Test complete flag being set (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should have solrError")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should not have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should not have solrError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should not have solrError")
 K @DATA
 Q
GETVITALSOLRERROR ;; @TEST Get Patient Sync Status - Both Vitals Stored. Test complete flag being set (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should not have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should not have solrError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should not have solrError")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should have solrError")
 K @DATA
 Q
GETBOTHSOLRERROR ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored. Test SyncComplete flag being set (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be completed
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(10,$D(OBJECT("completedStamp")),"Sync status is not completed")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should have solrError")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should have solrError")
 K @DATA
 Q
GETBOTHSOLRERRORSTORED ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored and Solr Stored. Test SyncComplete flag being set (SOLR ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrStored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be completed
 D ASSERT(0,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(10,$D(OBJECT("completedStamp")),"Sync status is not completed")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","hasSolrError")),"doesn't have hasSolrError when it should")
 D ASSERT("",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","solrSyncCompleted")),"solrSyncCompleted when it shouldn't")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSolrError")),"allergy domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","solrSyncCompleted")),"allergy domain should not be solrSyncCompleted")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should have solrError")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSolrError")),"vitals domain should have hasSolrError")
 D ASSERT("false",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","solrSyncCompleted")),"vitals domain should not be solrSyncCompleted")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","solrError")),"Vital SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","solrError")),"Vital SITE:3:1002 should have solrError")
 K @DATA
 Q
GETFILTERSOLRERROR ;; @TEST Get Patient Sync Status with filters (SOLR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 K ^TMP("HTTPERR",$J)
 D BLANK
 ;
 S ARG("id")="SITE;3"
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"solrError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"solrError")=1
 ; Test that syncCompleted
 K DATA,OBJECT
 K ARG("detailed")
 ; Test that sync has been complete when not in detailed mode
 S ARG("filter")="exists(""hasSolrError"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Test filters while in completedStamp
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy")),"Allergy domain does not exist and it should")
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals")),"Vitals domain does not exist and it should")
 ;
 K DATA,OBJECT
 S ARG("detailed")="true"
 ; Test that domain has been stored when in detailed mode
 S ARG("filter")="eq(""domain"",""allergy""),exists(""solrError"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 D ASSERT(10,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp")),"Allergy domain does not exist and it should")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","solrError")),"Allergy SITE:3:1001 should have solrError")
 D ASSERT("true",$G(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","solrError")),"Allergy SITE:3:1002 should have solrError")
 D ASSERT(0,$D(OBJECT("completedStamp","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp")),"Vitals domain exists and it should not")
 Q
 ;
 ; SYNC ERROR tests
 ;
GETBEFORESYNCERROR ;; @TEST Get Patient Sync Status before metastamp stored (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 ; Clean out all old data
 K ^VPRSTATUS
 K ^VPRPTJ("JPID")
 K ^VPRMETA("JPID")
 D PATIDS
 ;
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; since syncSyncComplete is nested under inProgress or completedStamp, the code below will catch
 ; it without an explicit test
 D ASSERT(0,$D(OBJECT("inProgress")),"inProgress Sync Status exists")
 D ASSERT(0,$D(OBJECT("completedStamp")),"completedStamp Sync Status exists")
 ; Try again with a sync event in error
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"syncError")=1
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; This data won't exist since we haven't received an initial metastamp yet.
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")))
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")))
 K @DATA
 Q
GETINITIALSYNCERROR ;; @TEST Get Initial Patient Sync Status (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"hasSyncError set when it shouldn't")
 ; ensure allergy domain and event stamps exist correctly
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should not have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 shouldn't have syncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 shouldn't have syncError")
 ; ensure vitals domain and event stamps exist correctly
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should not have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncStored")),"Vital SITE:3:1001 shouldn't have syncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncStored")),"Vital SITE:3:1002 shouldn't have syncError")
 K @DATA
 Q
GETLASTVITALSYNCERROR ;; @TEST Get Patient Sync Status - Last Vital Stored (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"syncError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"doesn't have hasSyncError when it should")
 ; Allergy domain should not have syncError
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should not have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should not have syncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should not have syncError")
 ; Vitals domain should have syncError
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncError")),"Vital SITE:3:1001 should not have syncError")
 ; Last Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")),"Vital SITE:3:1002 should have syncError")
 K @DATA
 Q
GETLASTALLERGYSYNCERROR ;; @TEST Get Patient Sync Status - Last Allergy Stored (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"syncError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"doesn't have hasSyncError when it should")
 ; Allergy domain should have syncError
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should not have syncError")
  ; Vitals domain should not have syncError
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should not have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncError")),"Vital SITE:3:1001 should not have syncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")),"Vital SITE:3:1002 should not have syncError")
 ; Last Allergy should have syncError
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should have syncError")
 K @DATA
 Q
GETLASTALLERGYVITALSYNCERROR ;; @TEST Get Patient Sync Status - Last Vital & Allergy Stored (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"syncError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"doesn't have hasSyncError when it should")
 ; Allergy domain should not be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should not have syncError")
 ; Vitals domain should not be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncError")),"Vital SITE:3:1001 should not have syncError")
 ; Last Allergy & Vital should be stored
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should have syncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")),"Vital SITE:3:1002 should have syncError")
 K @DATA
 Q
GETALLERGYSYNCERROR ;; @TEST Get Patient Sync Status - Both Allergies Stored. Test complete flag being set (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"syncError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"doesn't have hasSyncError when it should")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should have hasSyncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should have syncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should have syncError")
 ; Vitals domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should not have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncError")),"Vital SITE:3:1001 should not have syncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")),"Vital SITE:3:1002 should not have syncError")
 K @DATA
 Q
GETVITALSYNCERROR ;; @TEST Get Patient Sync Status - Both Vitals Stored. Test complete flag being set (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"syncError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be in progress
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not inProgress")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is not inProgress")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"doesn't have hasSyncError when it should")
 ; Allergy domain should not be complete
 D ASSERT("false",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should not have hasSyncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should not have syncError")
 D ASSERT("",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should not have syncError")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should have hasSyncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncError")),"Vital SITE:3:1001 should have syncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")),"Vital SITE:3:1002 should have syncError")
 K @DATA
 Q
GETBOTHSYNCERROR ;; @TEST Get Patient Sync Status - Allergy and Vitals Stored. Test SyncComplete flag being set (SYNC ERROR)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 D BLANK
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"syncError")=1
 S ARG("id")="SITE;3"
 S ARG("detailed")="true"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; this Sync Status should always be completed
 D ASSERT(10,$D(OBJECT("inProgress")),"Sync status is not completed")
 D ASSERT(0,$D(OBJECT("completedStamp")),"Sync status is completed and shouldn't be")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","hasSyncError")),"doesn't have hasSyncError when it should")
 ; Allergy domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","hasSyncError")),"allergy domain should have hasSyncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should have syncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should have syncError")
 ; Vitals domain should be complete
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","hasSyncError")),"vitals domain should have hasSyncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1001","syncError")),"Vital SITE:3:1001 should have syncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp","urn:va:vitals:SITE:3:1002","syncError")),"Vital SITE:3:1002 should have syncError")
 K @DATA
 Q
GETFILTERSYNCERROR ;; @TEST Get Patient Sync Status with filters (SYNC)
 N DATA,ARG,ERR,OBJECT,HTTPERR
 K ^TMP("HTTPERR",$J)
 D BLANK
 ;
 S ARG("id")="SITE;3"
 ; Set complete flags
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"stored")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1001",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","allergy","urn:va:allergy:SITE:3:1002",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1001",20141031094920,"syncError")=1
 S ^VPRSTATUS("52833885-af7c-4899-90be-b3a6630b2369","SITE;3","SITE","vitals","urn:va:vitals:SITE:3:1002",20141031094920,"syncError")=1
 ; Test that syncCompleted
 K DATA,OBJECT
 K ARG("detailed")
 ; Test that sync has been complete when not in detailed mode
 S ARG("filter")="exists(""hasSyncError"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 ; Test filters while in completedStamp
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy")),"Allergy domain does not exist and it should")
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals")),"Vitals domain does not exist and it should")
 ;
 K DATA,OBJECT
 S ARG("detailed")="true"
 ; Test that domain has been stored when in detailed mode
 S ARG("filter")="eq(""domain"",""allergy""),exists(""syncError"")"
 D GET^VPRJPSTATUS(.DATA,.ARG)
 ; If data is blank force error and quit
 I $D(DATA)=0 D ASSERT(0,1,"Return variable is blank") Q
 D DECODE^VPRJSON(DATA,"OBJECT","ERR")
 ; If we can't decode the JSON Fail the test
 D ASSERT(0,$D(ERR),"ERROR DECODING JSON")
 D ASSERT(10,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp")),"Allergy domain does not exist and it should")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1001","syncError")),"Allergy SITE:3:1001 should have syncError")
 D ASSERT("true",$G(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","allergy","eventMetaStamp","urn:va:allergy:SITE:3:1002","syncError")),"Allergy SITE:3:1002 should have syncError")
 D ASSERT(0,$D(OBJECT("inProgress","sourceMetaStamp","SITE","domainMetaStamp","vitals","eventMetaStamp")),"Vitals domain exists and it should not")
 Q
 ;

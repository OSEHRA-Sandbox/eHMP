@F339   @DE3930 @reg4
Feature: User Defined Work Spaces 2 - Cloning Existing Workspaces

Background:
  # Given user is logged into eHMP-UI
  And user searches for and selects "Eight,Patient"
  Then Overview is active
  When the user clicks the Workspace Manager
  And the user deletes all user defined workspaces

@US4277 @TC322
Scenario: Verify user defined workspace displays visual indicator 
  Given the user creates a user defined workspace named "verifyvisual"
  When the user customizes the "verifyvisual" workspace
  Then the customize screen displays a visual that defines the workspace

@US4490 @US4490_predefined 
Scenario: Users can clone predefined workspace 
  Given workspace "documents-list" is listed
  When user clones the "documents-list" workspace
  Then the user defined workspace data screen id "documents-copy" is listed
  When the user navigates to "#/patient/documents-copy"
  Then the "Documents Copy" screen is active
  And the active screen displays 1 applets
  And the applets are displayed are
      | applet                 |
      | DOCUMENTS              |

@US4490 @US4490_userdefined
Scenario: Users can clone user defined workspace
  #When the user clicks "Plus Button"
  #And the user clicks "Customize"
  Given the user creates a user defined workspace named "cloneudw"
  When the user customizes the "cloneudw" workspace

  And the user adds an expanded "appointments" applet to the user defined workspace
  And the user selects done to complete customizing the user defined workspace

  Then the "CLONEUDW" screen is active
  And the active screen displays 1 applets

  When the user clicks the Workspace Manager
  Then the user defined workspace data screen id "cloneudw" is listed
  When user clones the "cloneudw" workspace
  Then the user defined workspace data screen id "cloneudw-copy" is listed
  When the user navigates to "#/patient/cloneudw-copy"
  Then the "CLONEUDW Copy" screen is active
  And the active screen displays 1 applets
  And the applets are displayed are
      | applet                 |
      | APPOINTMENTS & VISITS  |

@US5045 @DE8552
Scenario: User Defined Work Spaces Integrated into Site Search
  Given workspace "documents-list" is listed
  And user clones the "documents-list" workspace
  And the user defined workspace data screen id "documents-copy" is listed
  When the user filters the workspace manager on term "Documents"
  Then the workspace manager only displays workspaces with term "Documents"

@US5043 
Scenario: Filter in Work Space Manager To Filter By Work Space Description
  And the user creates a user defined workspace named "testdescription"
  And the user defined workspace data screen id "testdescription" is listed
  When the user sets the description of udw "testdescription" to "filterdescription"
  When the user filters the workspace manager on term "filterdescription"
  Then the workspace manager only displays workspaces with description "filterdescription"

@US4509_2 @DE6976
Scenario: Incorporating Gist views within applicable applets
  Given the user creates a user defined workspace named "gistviews"
  When the user customizes the "gistviews" workspace
  And the user adds an trend "activeMeds" applet to the user defined workspace
  And the user adds an trend "problems" applet to the user defined workspace
  And the user adds an trend "immunizations" applet to the user defined workspace
  And the user adds an trend "vitals" applet to the user defined workspace

  # used the following step to verify function will fail appropraitely when it can't find an applet in the carousel
  #And the user adds an trend "badvitals" applet to the user defined workspace
  
  And the user selects done to complete customizing the user defined workspace
  Then the "GISTVIEWS" screen is active
  And the active screen displays 4 applets
  And the Vitals Trend applet is displayed
  And the Problems Trend applet is displayed
  And the Immunizations Trend applet is displayed
  And the Active Medications Trend applet is displayed



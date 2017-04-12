# Group Pick List

## Problems lexicon lookup [/problems-lexicon-lookup{?site}{&searchString}{&date}{&synonym}{&limit}{&noMinimumLength}]

DIRECT RPC CALL - Problems Lexicon Lookup - calls orqqpl4-lex-lookup with a value of PLS

### Notes

ORQQPL4 LEX

+ Parameters

    :[site]({{{common}}}/parameters/site.md)

    + searchString (string, required) - A string that is the closest match to the index you want to start returning data from

    :[date]({{{common}}}/parameters/date.md)
    
    + synonym (string, optional) - If not supplied will default to zero, which means exclude synonyms
    
    + limit (string, optional) - If not supplied will default to zero, which means return all records found

    + noMinimumLength (string, optional) - If supplied, searchString can be as short as 1.

### GET

+ Response 200 (application/json)

    + Body

            {
              "data": [
                {
                  "lexIen": "7061257",
                  "prefText": "Blood in urine",
                  "code": "R69.",
                  "codeIen": "521774",
                  "codeSys": "SNOMED CT",
                  "conceptId": "34436003",
                  "desigId": "485846015",
                  "version": "ICD-10-CM"
                },
                {
                  "lexIen": "7303363",
                  "prefText": "Fetal blood loss",
                  "code": "R69.",
                  "codeIen": "521774",
                  "codeSys": "SNOMED CT",
                  "conceptId": "206390008",
                  "desigId": "316502016",
                  "version": "ICD-10-CM"
                },
                "records found",
                "2 matches found"
              ],
              "status": 200
            }

    + Schema

            :[schema]({{{common}}}/schemas/problems-lexicon-lookup-GET-200.jsonschema)

:[Response 400]({{{common}}}/responses/400.md name:"site")

:[Response 404]({{{common}}}/responses/404.md)

:[Response 500]({{{common}}}/responses/500.md)


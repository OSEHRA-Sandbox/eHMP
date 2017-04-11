'use strict';

var textSearch = require('./text-search');
var buildSolrQuery = textSearch._buildSolrQuery;
var buildSpecializedSolrQuery = textSearch._buildSpecializedSolrQuery;

describe.skip('build solr query', function () {
    it('should construct a query string with all arguments filled', function () {
        var reqQuery = {
            q: 'metformin',
            pid: '10108',
            types: [
                'document',
                'med'
            ]
        };
        var domain = 'document';
        var queryParameters = {
            fl: [
                'comment',
                'problem_status'
            ],
            fq: [
                '-removed:true'
            ],
            hl: true,
            'hl.fl': [
                'prn_reason',
                'administration_comment'
            ]
        };
        var solrQueryString = buildSolrQuery(reqQuery, domain, queryParameters);
        // var solrQueryObject = querystring.parse(solrQueryString);

        var expectedSolrQuery = (
            'fl=comment%2Cproblem_status%2Cuid%2Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_n' +
            'ame&fq=-removed%3Atrue&fq=pid%3A10108&fq=domain%3Adocument&fq=domain%3A(NOT%20pa' +
            'tient)&hl=true&hl.fl=prn_reason%2Cadministration_comment&q=%22undefined%22&s' +
            'tart=0&rows=101&wt=json');
        expect(solrQueryString).to.equal(expectedSolrQuery);
    });

    it('should return an error when no pid is specified', function () {
        var solrQuery = buildSolrQuery();
        expect(solrQuery instanceof Error).toBeTruthy();
    });

    it('should accept minimal input with just reqQuery.pid', function () {
        var reqQuery = { pid: '10108' };
        var solrQuery = buildSolrQuery(reqQuery);
        var expectedSolrQuery = 'fl=uid%2Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_name&fq=' +
            'pid%3A10108&fq=domain%3A*%3A*&fq=domain%3A(NOT%20patient)&q=%22undefined%22&star' +
            't=0&rows=101&wt=json';
        expect(solrQuery).to.equal(expectedSolrQuery);
    });

    it('should accept a single specific domain to query', function () {
        var reqQuery = { pid: '10108' };
        var domain = 'document';
        var solrQuery = buildSolrQuery(reqQuery, domain);
        var expectedSolrQuery = 'fl=uid%2Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_name&fq=' +
            'pid%3A10108&fq=domain%3Adocument&fq=domain%3A(NOT%20patient)&q=%22undefined%22&s' +
            'tart=0&rows=101&wt=json';
        expect(solrQuery).to.equal(expectedSolrQuery);
    });
});


describe.skip('build specialized solr query', function () {
    it('should build a specialized solr query for med domain', function () {
        var reqQuery = {pid: 10108, domain: 'med', query: 'metformin'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'med');
        var expectedSolrQuery = 'sort=overall_stop%20desc&fl=qualified_name%2Cva_type%2Clast_' +
            'filled%2Clast_give%2Cmed_drug_class_name%2Cuid%2Cdatetime%2Csummary%2Curl%2Ckind' +
            '%2Cfacility_name&group=true&group.field=qualified_name&hl=true&hl.fl=administrat' +
            'ion_comment%2Cprn_reason&hl.fragsize=72&hl.snippets=5&q.op=AND&fq=pid%3A10108&fq' +
            '=domain%3Amed&fq=domain%3A(NOT%20patient)&q=%22metformin%22&start=0&rows=101&wt=' +
            'json';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
    it('should build a specialized solr query for order domain', function () {
        var reqQuery = {pid: 10108, domain: 'order', query: 'potassium'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'order');
        var expectedSolrQuery = 'fq=service%3A(LR%20OR%20GMRC%20OR%20RA%20OR%20FH%20OR%20UBEC' +
            '%20OR%20%22OR%22)&fq=-status_name%3A(COMPLETE%20OR%20%22DISCONTINUED%2FEDIT%22%2' +
            '0OR%20DISCONTINUED%20OR%20EXPIRED%20OR%20LAPSED)&fq=pid%3A10108&fq=domain%3Aorde' +
            'r&fq=domain%3A(NOT%20patient)&fl=service%2Cstatus_name%2Cuid%2Cdatetime%2Csummar' +
            'y%2Curl%2Ckind%2Cfacility_name&hl=true&hl.fl=content&hl.fragsize=45&hl.snippets=' +
            '5&q=%22potassium%22&start=0&rows=101&wt=json';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
    it('should build a specialized solr query for document domain', function () {
        var reqQuery = {pid: 10108, domain: 'document', query: 'metformin'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'document');
        var expectedSolrQuery = 'fl=local_title%2Cphrase%2Cuid%2Cdatetime%2Csummary%2Curl%2Ck' +
            'ind%2Cfacility_name&group=true&group.field=local_title&sort=reference_date_time%' +
            '20desc&hl=true&hl.fl=body%2Csubject&hl.fragsize=45&hl.snippets=5&fq=pid%3A10108&' +
            'fq=domain%3Adocument&fq=domain%3A(NOT%20patient)&q=%22metformin%22&start=0&rows=' +
            '101&wt=json';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
    it('should build a specialized solr query for vital domain', function () {
        var reqQuery = {pid: 10108, domain: 'vital', query: 'pulse'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'vital');
        var expectedSolrQuery = 'sort=observed%20desc&group=true&group.field=qualified_name&f' +
            'l=uid%2Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_name&fq=pid%3A10108&fq=domain' +
            '%3Avital&fq=domain%3A(NOT%20patient)&q=%22pulse%22&start=0&rows=101&wt=json&face' +
            't=true&';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
    it('should build a specialized solr query for lab domain', function () {
        var reqQuery = {pid: 10108, domain: 'lab', query: 'plasma'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'lab');
        var expectedSolrQuery = 'fl=lnccodes%2Ctype_code%2CinterpretationName%2Cunits%2Cuid%2' +
            'Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_name&group=true&group.field=qualifie' +
            'd_name_units&hl=true&hl.fl=comment&hl.fragsize=45&hl.snippets=5&fq=pid%3A10108&f' +
            'q=domain%3Aresult&fq=domain%3A(NOT%20patient)&q=%22plasma%22&start=0&rows=101&wt' +
            '=json';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
    it('should build a specialized solr query for problem domain', function () {
        var reqQuery = {pid: 10108, domain: 'problem', query: 'foo'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'problem');
        var expectedSolrQuery = 'fq=-removed%3Atrue&fq=pid%3A10108&fq=domain%3Aproblem&fq=dom' +
            'ain%3A(NOT%20patient)&fl=comment%2Cicd_code%2Cicd_name%2Cicd_group%2Cproblem_sta' +
            'tus%2Cacuity_name%2Cuid%2Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_name&sort=p' +
            'roblem_status%20asc&group=true&group.field=icd_group&q=%22foo%22&start=0&rows=10' +
            '1&wt=json';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
    it('should build a specialized solr query for generic domains', function () {
        var reqQuery = {pid: 10110, query: 'influenza'};
        var specializedSolrQuery = buildSpecializedSolrQuery(reqQuery, 'immunization');
        var expectedSolrQuery = 'fl=uid%2Cdatetime%2Csummary%2Curl%2Ckind%2Cfacility_name&fq=' +
            'pid%3A10110&fq=domain%3Aimmunization&fq=domain%3A(NOT%20patient)&q=%22influenza%' +
            '22&start=0&rows=101&wt=json';
        expect(specializedSolrQuery).to.equal(expectedSolrQuery);
    });
});

/**
 * Copyright 2011 OpenCDS.org
 *	Licensed under the Apache License, Version 2.0 (the "License");
 *	you may not use this file except in compliance with the License.
 *	You may obtain a copy of the License at
 *
 *		http://www.apache.org/licenses/LICENSE-2.0
 *
 *	Unless required by applicable law or agreed to in writing, software
 *	distributed under the License is distributed on an "AS IS" BASIS,
 *	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *	See the License for the specific language governing permissions and
 *	limitations under the License.
 *	
 */

package org.opencds.dss.query;


import org.omg.dss.common.EntityIdentifier;
import org.omg.dss.knowledgemodule.ExtendedKMDescription;
import org.opencds.service.query.DSSQueryAdapter;


public class GenericGetKMDescriptionQuery extends QueryGetKMDescription {
	
	@Override
	public ExtendedKMDescription getResponse(EntityIdentifier kmId, String clientLanguage) {
		
		ExtendedKMDescription response = new ExtendedKMDescription();
		try {
			
			DSSQueryAdapter myDecisionEngineAdapter = DSSQueryAdapter.getInstance();
			response = myDecisionEngineAdapter.getKMDescription(kmId, clientLanguage);  
			
		//TODO convert exceptions below to DSSExceptions to return meaningful error messages
		} catch (RuntimeException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		} catch (java.lang.Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}
		
		return response;
	}

}

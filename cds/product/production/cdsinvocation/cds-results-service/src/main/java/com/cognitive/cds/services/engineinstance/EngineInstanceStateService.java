/*
 * COPYRIGHT STATUS: © 2015.  This work, authored by Cognitive Medical Systems
 * employees, was funded in whole or in part by The Department of Veterans
 * Affairs under U.S. Government contract VA118-11-D-1011 / VA118-1011-0013.
 * The copyright holder agrees to post or allow the Government to post all or
 * part of this work in open-source repositories subject to the Apache License,
 * Version 2.0, dated January 2004. All other rights are reserved by the
 * copyright owner.
 *
 * For use outside the Government, the following notice applies:
 *
 *     Copyright 2015 © Cognitive Medical Systems
 *
 *     Licensed under the Apache License, Version 2.0 (the "License"); you may
 *     not use this file except in compliance with the License. You may obtain
 *     a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 *
 *     Unless required by applicable law or agreed to in writing, software
 *     distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 *
 */
package com.cognitive.cds.services.engineinstance;

import com.cognitive.cds.invocation.model.EngineInstanceState;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.apache.cxf.jaxrs.ext.MessageContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cognitive.cds.invocation.mongo.EngineInfoDao;
import com.cognitive.cds.services.engineinstance.model.EngineInstanceStateRequest;
import com.fasterxml.jackson.core.JsonProcessingException;
import javax.ws.rs.core.Response;

/**
 * The call(s) to make changes to engine instance state.
 *
 * @author Jeremy Fox
 */
public class EngineInstanceStateService implements EngineInstanceStateIface {

	private static final Logger logger = LoggerFactory.getLogger(EngineInstanceStateService.class);
	private EngineInfoDao engineInfoDao;

	public EngineInstanceStateService() {
	}

	/**
	 * REST Interface to manipulate engine instance state.
	 *
	 * @param request
	 * @param context
	 * @return
	 */
	@Override
	@PUT
	@Consumes("application/json")
	@Produces("application/json")
	@Path("/engineInstanceState")
	public Response createOrUpdateEngineInstanceStateREST(EngineInstanceStateRequest request, @javax.ws.rs.core.Context MessageContext context) {
		logger.debug("engineInstanceState PUT called...");

		if ((request != null) && isRequestValid(request)) {
			EngineInstanceState eis = new EngineInstanceState();
			eis.setName(request.getName());
			eis.setType(request.getType());
			eis.setHost(request.getHost());
			eis.setPort(request.getPort());
			eis.setStatus(request.isStatus());

			try {
				engineInfoDao.updateEngineInstanceState(eis);
			} catch (JsonProcessingException jpe) {
				logger.error("Error persisting engine instance state.", jpe);
                //assuming this will be an internal server error for right now...we
				//should have already validated the request by the time we get here.
				return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
			}
			return Response.status(Response.Status.OK).build();
		} else {
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
	}

	private boolean isRequestValid(EngineInstanceStateRequest request) {
		//validate json...
		if ((request.getName() == null)
			|| (request.getType() == null)
			|| (request.getHost() == null)
			|| (request.getPort() == null)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * @return the engineInfoDao
	 */
	public EngineInfoDao getEngineInfoDao() {
		return this.engineInfoDao;
	}

	/**
	 * @param engineInfoDao the engineInfoDao to set
	 */
	public void setEngineInfoDao(EngineInfoDao engineInfoDao) {
		this.engineInfoDao = engineInfoDao;
	}
}
package org.tetram.bdtheque.model.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("0")
public class ScenaristeSerie extends AuteurSerie {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
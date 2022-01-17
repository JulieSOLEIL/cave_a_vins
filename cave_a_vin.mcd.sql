#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: region
#------------------------------------------------------------

CREATE TABLE region(
        id_region Int NOT NULL ,
        region    Varchar (50) NOT NULL
	,CONSTRAINT region_PK PRIMARY KEY (id_region)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vin
#------------------------------------------------------------

CREATE TABLE vin(
        id_vin     Int NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        millesime  Int NOT NULL ,
        robe       Varchar (50) NOT NULL ,
        qte_stock  Int NOT NULL ,
        contenance Varchar (50) NOT NULL ,
        remarque   Text NOT NULL ,
        id_region  Int NOT NULL
	,CONSTRAINT vin_PK PRIMARY KEY (id_vin)

	,CONSTRAINT vin_region_FK FOREIGN KEY (id_region) REFERENCES region(id_region)
)ENGINE=InnoDB;


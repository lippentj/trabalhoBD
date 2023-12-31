-- MySQL Script generated by MySQL Workbench
-- Mon Oct 16 21:35:53 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categoria (
  idcategoria INT(4) NOT NULL,
  descriçao VARCHAR(45) NULL,
  PRIMARY KEY (idcategoria))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS eventos (
    ideventos INT(4) NOT NULL,
    nome_evento VARCHAR(60) NULL,
    local_evento VARCHAR(50) NULL,
    data_evento DATE NULL,
    email_evento VARCHAR(50) NULL,
    categoria_idcategoria INT(4) NOT NULL,
    PRIMARY KEY (ideventos),
    INDEX fk_eventos_categoria_idx (categoria_idcategoria),
    CONSTRAINT fk_eventos_categoria
      FOREIGN KEY (categoria_idcategoria)
      REFERENCES categoria (idcategoria)
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`tipo_inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipo_inscricao (
  idtipo_inscricao INT(4) NOT NULL,
  valor_tipo DECIMAL(6,2) NULL,
  eventos_ideventos INT(4) NOT NULL,
  eventos_categoria_idcategoria INT(4) NOT NULL,
  PRIMARY KEY (idtipo_inscricao),
  INDEX fk_tipo_inscricao_eventos1_idx (eventos_ideventos ASC, eventos_categoria_idcategoria ASC) VISIBLE,
  CONSTRAINT fk_tipo_inscricao_eventos1
    FOREIGN KEY (eventos_ideventos , eventos_categoria_idcategoria)
    REFERENCES eventos (ideventos , categoria_idcategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS participante (
  idparticipant INT(4) NOT NULL,
  nome_participante VARCHAR(60) NULL,
  endereco VARCHAR(100) NULL,
  numero VARCHAR(10) NULL,
  bairro VARCHAR(50) NULL,
  cidade VARCHAR(50) NULL,
  estado VARCHAR(2) NULL,
  email VARCHAR(50) NULL,
  PRIMARY KEY (idparticipante))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`participante_inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS participante_inscricao (
  idparticipante_inscricao INT(4) NOT NULL,
  situacao VARCHAR(2) NULL,
  data_inscricao DATE NULL,
  tipo_inscricao_idtipo_inscricao INT(4) NOT NULL,
  tipo_inscricao_eventos_ideventos INT(4) NOT NULL,
  tipo_inscricao_eventos_categoria_idcategoria INT(4) NOT NULL,
  participante_idparticipante INT(4) NOT NULL,
  PRIMARY KEY (idparticipante_inscricao),
  INDEX fk_participante_inscricao_tipo_inscricao1_idx (tipo_inscricao_idtipo_inscricao ASC, tipo_inscricao_eventos_ideventos ASC, tipo_inscricao_eventos_categoria_idcategoria ASC) VISIBLE,
  INDEX fk_participante_inscricao_participante1_idx (participante_idparticipante ASC) VISIBLE,
  CONSTRAINT fk_participante_inscricao_tipo_inscricao1
    FOREIGN KEY (tipo_inscricao_idtipo_inscricao , tipo_inscricao_eventos_ideventos , tipo_inscricao_eventos_categoria_idcategoria)
    REFERENCES tipo_inscricao (idtipo_inscricao , eventos_ideventos , eventos_categoria_idcategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_participante_inscricao_participante1
    FOREIGN KEY (participante_idparticipante)
    REFERENCES participante (idparticipante)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

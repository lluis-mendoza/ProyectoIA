(defmodule MAIN (export ?ALL))

(defmodule get-info-grup
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule processa-info-grup
	(import MAIN ?ALL)
	(import get-info-grup deftemplate ?ALL)
	(export ?ALL)
)

(defmodule mostrar-recomanacions
	(import MAIN ?ALL)
	(import get-info-grup deftemplate ?ALL)
	(import processa-info-grup deftemplate ?ALL)
	(export ?ALL)
)

;;;Template

;;; Template per la info del grup
(deftemplate MAIN::info-grup
	(slot tipusvisitant (type STRING))
	;;;Pot ser: Individual, Parella, Grup petit (3-20), Grup mitja (21-35) o Grup gran (+35).
	(slot numdiesvisita (type INTEGER)(default -1))
	(slot horesvisita (type INTEGER)(default -1))
	(slot coneixementart (type INTEGER)(default -1))
)

;;;Template per les preferencies del grup
(deftemplate MAIN::preferencies-grup
    (multislot autors (type INSTANCE))
    (multislot epoques (type INSTANCE))
    (slot epoques-preguntat (type INTEGER)(default -1))
    (multislot estils (type INSTANCE))
    (slot estils-preguntat (type INTEGER)(default -1))
    (multislot tematiques (type INSTANCE))
    (slot tematiques-preguntat (type INTEGER)(default -1))
)

(deftemplate MAIN::recomanacions
	(multislot recs (type INSTANCE))
)

(deftemplate MAIN::recomanacions-ordenades
	(multislot recs (type INSTANCE))
)

(deftemplate MAIN::recomanacions-diaries
	(multislot recs (type INSTANCE))
)

(deftemplate MAIN::recomanacions-ordenades-sala
	(multislot recs (type INSTANCE))
)

;;; template per llista de recomanacions??
(defclass MAIN::Recomanacio
	(is-a USER)
	(role concrete)
  (slot obra (type INSTANCE)	(create-accessor read-write))
  (slot puntuacio (type INTEGER) (create-accessor read-write))
	(slot temps (type INTEGER))
)

(defclass MAIN::Dia
	(is-a USER)
	(role concrete)
	(slot dia (type INTEGER))
  (multislot recomanacions (type INSTANCE)	(create-accessor read-write))
)

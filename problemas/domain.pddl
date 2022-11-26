(define (domain carne-asada)
(:requirements :typing :equality)
(:types persona salchicha-portion content-portion carne plato lugar)
(:constants asador - lugar)

(:predicates (at_asador_salchicha ?b - salchicha-portion)
	     (at_asador_content ?c - content-portion)
     	     (at_asador_carne ?s - carne)
     	     (no_cheve_salchicha ?b - salchicha-portion)
       	     (no_cheve_content ?c - content-portion)
      	     (onplato ?s - carne ?t - plato)
       	     (no_cheve_carne ?s - carne)
	     (vomita ?c - persona)
     	     (not_vomita ?c - persona)
	     (servido ?c - persona)
	     (esperando ?c - persona ?p - lugar)
             (at ?t - plato ?p - lugar)
	     (notexist ?s - carne)
  )

(:action asar_carne_no_cheve 
	 :parameters (?s - carne ?b - salchicha-portion ?c - content-portion)
	 :precondition (and (at_asador_salchicha ?b)
			    (at_asador_content ?c)
			    (no_cheve_salchicha ?b)
			    (no_cheve_content ?c)
			    (notexist ?s))
	 :effect (and
		   (not (at_asador_salchicha ?b))
		   (not (at_asador_content ?c))
		   (at_asador_carne ?s)
		   (no_cheve_carne ?s)
                   (not (notexist ?s))
		   ))


(:action asar_carne_si_cheve
	 :parameters (?s - carne ?b - salchicha-portion ?c - content-portion)
	 :precondition (and (at_asador_salchicha ?b)
			    (at_asador_content ?c)
                            (notexist ?s)
			    )
	 :effect (and
		   (not (at_asador_salchicha ?b))
		   (not (at_asador_content ?c))
		   (at_asador_carne ?s)
                   (not (notexist ?s))
		   ))


(:action poner_en_bandeja
	 :parameters (?s - carne ?t - plato)
	 :precondition (and  (at_asador_carne ?s)
			     (at ?t asador))
	 :effect (and
		   (not (at_asador_carne ?s))
		   (onplato ?s ?t)))


(:action servir_carne_no_cheve
 	:parameters (?s - carne ?c - persona ?t - plato ?p - lugar)
	:precondition (and
		       (vomita ?c)
		       (onplato ?s ?t)
		       (esperando ?c ?p)
		       (no_cheve_carne ?s)
                       (at ?t ?p)
		       )
	:effect (and (not (onplato ?s ?t))
		     (servido ?c)))

(:action servir_carne_si_cheve
	:parameters (?s - carne ?c - persona ?t - plato ?p - lugar)
	:precondition (and (not_vomita ?c)
	                   (esperando ?c ?p)
			   (onplato ?s ?t)
			   (at ?t ?p))
	:effect (and (not (onplato ?s ?t))
		     (servido ?c)))

(:action mover_bandeja
	 :parameters (?t - plato ?p1 ?p2 - lugar)
	 :precondition (and (at ?t ?p1))
	 :effect (and (not (at ?t ?p1))
		      (at ?t ?p2)))
			    

)
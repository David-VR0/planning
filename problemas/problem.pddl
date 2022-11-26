
(define (problem prob-cocinero)
  (:domain carne-asada)
  (:objects
    person1 person2 person3 person4 person5 person6 - persona
    salchicha1 salchicha2 salchicha3 salchicha4 salchicha5 salchicha6 - salchicha-portion
    content1 content2 content3 content4 content5 content6 - content-portion
    plato1 plato2 - plato
    mesa1 mesa2 mesa3 - lugar
    carn1 carn2 carn3 carn4 carn5 carn6 carn7 carn8 - carne
  )
  (:init
     (at plato1 asador)
     (at plato2 asador)
     (at_asador_salchicha salchicha1)
     (at_asador_salchicha salchicha2)
     (at_asador_salchicha salchicha3)
     (at_asador_salchicha salchicha4)
     (at_asador_salchicha salchicha5)
     (at_asador_salchicha salchicha6)
     (at_asador_content content1)
     (at_asador_content content2)
     (at_asador_content content3)
     (at_asador_content content4)
     (at_asador_content content5)
     (at_asador_content content6)
     (no_cheve_salchicha salchicha2)
     (no_cheve_salchicha salchicha5)
     (no_cheve_content content3)
     (no_cheve_content content6)
     (vomita person1)
     (vomita person5)
     (not_vomita person2)
     (not_vomita person3)
     (not_vomita person4)
     (not_vomita person6)
     (esperando person1 mesa2)
     (esperando person2 mesa1)
     (esperando person3 mesa3)
     (esperando person4 mesa2)
     (esperando person5 mesa1)
     (esperando person6 mesa1)
     (notexist carn1)
     (notexist carn2)
     (notexist carn3)
     (notexist carn4)
     (notexist carn5)
     (notexist carn6)
     (notexist carn7)
     (notexist carn8)
  )
  (:goal
    (and
     (servido person1)
     (servido person2)
     (servido person3)
     (servido person4)
     (servido person5)
     (servido person6)
    )
  )
)
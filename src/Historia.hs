module Historia where

import System.Process

inicioHistoria::String
inicioHistoria = textoFormatado "Um professor de matemática de uma universidade localizada em Campina Extensa, enquanto dava uma aula sobre o Teorema do resto chines Heanes: Bom turma e agora aplicando euclides para descobrir o md… Um portal se abre e Heanes foi sumonado para um mundo totalmente novo, a pessoa que o trouxe a esse mundo foi Carl Wilson, conhecido como C.W  ou comumente chamado de mestre dos magos nesse mundo, Carl Wilson: Olá professor, sei que você possivelmente não está entendendo o por que não está em uma sala de aula às 8:27 da manhã mas não temos tempo para uma longa explicação, precisamos da sua ajuda, o nosso mundo tem uma força que não conseguimos controlar e nem entender, chamada Inteligência Artificial , você nos ajudaria nessa caminhada para proteger nossa cidadela de cristal? Professor: Calma, um momen… Carl Wilson: Por favor faça sua escolha.\n(1) Sim, quero ajudar.\n(2) Prefiro morrer."

textoFormatado::String->String
textoFormatado texto = texto ++ "\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"

clearScreen::IO() -- Método auxiliar que para evitar dependencia ciclica, fica aqui.
clearScreen = do
    _ <- system "clear"
    putStr "\ESC[H"

cursoParte01::String
cursoParte01 = textoFormatado "Professor: Bom, vamos ver o que se pode fazer. Carl Wilson: Excelente ideia meu amigo pedagogo. Após chegar nesse novo mundo, o narrador nos apresenta a cidadela de cristal um lugar repleto de pessoas. Narrador: Aqui no nordeste desse mundo está a cidadela de Cristal, um lugar com 500 anos de história, e com diversas pessoas vivendo sua vida, entre elas está o dono da loja de armas: Armas & muita Defesa mais conhecido como AMD. Carl Wilson: Bom aqui vai ser o lugar onde você vai se equipar para viver uma vida de batalhas, nada de camisa social iremos partir para o mundo medieval e usar armas e armaduras, lhe apresento o ferreiro ferreira. Ferreira: Olá mestre dos magos, quem é o seu amigo? Jogador: Olá, me chamo Heanes, sou um professor de matemática e estou de  passagem por esse mundo. Ferreira: Pera como assim de passagem?!*Mestre dos magos explica a situação e toda a parte de viagem entre mundos* Ferreira: Uou. Achei que a coisa mais aleatória que eu veria hoje seria um gato com 3 patas pixelado, mas isso me surpreendeu. Bom amigo aqui é onde você vai se equipar e gastar seu suado salário de professor.Carl Wilson: Bom, eu esqueci um energético no caldeirão, fique livre para explorar a cidade e falar com todos, e quando se sentir tranquilo vá até a minha torre para você entender sobre as forças desse mundo."

cursoHistoria02::String
cursoHistoria02 = textoFormatado "Olá Heanes, agora vou lhe explicar como você conseguirá enfrentar seus desafios. Basicamente, quando você entrar em combate, terá opções variadas que se escolhidas corretamente quando combinada com seus atributos básicos, podem derrotar o seu inimigo. Heanes: Entendi essa parte, mas como vou saber meus atributos básicos?. Mestre dos Magos: Se você visitou a loja, sabe que tem itens e poções que aumentam seus atributos, claro, para isso você tem que trabalhar e ganhar dinheiro nesse mundo, apesar de ser um mago, ainda não produzo dinheiro, logo, prepare-se para seu combate tendo em vista que deve comprar itens para ficar mais forte, se ainda não olhou a loja ou se olhou também, vou colocar mais algumas poções para você, quanto ao dinheiro...Você pode ganhar de duas formas, vou deixar você descobrir sozinho."
{-# OPTIONS_GHC -Wno-missing-export-lists #-}
module Historia where
import Util.Lib

inicioHistoria1::String
inicioHistoria1 = textoFormatado "*Um professor de matemática de uma universidade localizada em Campina Extensa, enquanto dava uma aula sobre o Teorema do resto chines...*\n\nHeanes: Bom turma e agora aplicando euclides para descobrir o md…\n"

inicioHistoria2::String
inicioHistoria2 = textoFormatado "*Um portal se abre e Heanes foi sumonado para um mundo totalmente novo, a pessoa que o trouxe a esse mundo foi Carl Wilson, conhecido como C.W  ou comumente chamado de mestre dos magos nesse mundo*\n"

inicioHistoria3::String
inicioHistoria3 = textoFormatado "Carl Wilson: Olá professor, sei que você possivelmente não está entendendo o por que não está em uma sala de aula às 8:27 da manhã mas não temos tempo para uma longa explicação.\n" 

inicioHistoria4::String
inicioHistoria4 = textoFormatado "Carl Wilson: Precisamos da sua ajuda. O nosso mundo tem uma força que não conseguimos controlar e nem entender, chamada Inteligência Artificial. Você nos ajudaria nessa caminhada para proteger nossa cidadela de cristal?\n"

inicioHistoria5::String
inicioHistoria5 = textoFormatado "Professor: Calma, um momen…\n\nCarl Wilson: Por favor faça sua escolha.\n\n(1) Sim, quero ajudar.\n(2) Prefiro morrer.\n"

cursoParte01::String
cursoParte01 = textoFormatado ("Carl Wilson: Excelente ideia meu amigo pedagogo.\n\n" ++
        "*Após chegar nesse novo mundo, C.W. nos apresenta a Cidadela de Cristal um lugar repleto de pessoas.*\n")

cursoParte02::String
cursoParte02 = textoFormatado "C.W.: Aqui no nordeste desse mundo está a Cidadela de Cristal, um lugar com 500 anos de história, e com diversas pessoas vivendo sua vida, entre elas está o dono da loja de armas, Armas & Muita Defesa, mais conhecido como AMD.\n"

cursoParte03::String
cursoParte03 = textoFormatado "C.W.: Bom, aqui vai ser o lugar onde você vai se equipar para viver uma vida de batalhas, nada de camisa social. Iremos partir para o mundo medieval e usar armas e armaduras, lhe apresento o ferreiro Ferreira.\n"

cursoParte04::String
cursoParte04 = textoFormatado "Ferreira: Olá mestre dos magos, quem é o seu amigo?\n"

cursoParte05::String
cursoParte05 = textoFormatado "Heanes: Olá, me chamo Heanes, sou um professor de matemática e estou de passagem por esse mundo.\n"

cursoParte06::String
cursoParte06 = textoFormatado "Ferreira: Pera, como assim de passagem?!\n\n*Mestre dos magos explica a situação e toda a parte de viagem entre mundos*\n\nFerreira: Uou. Achei que a coisa mais aleatória que eu veria hoje seria um gato com 3 patas pixelado, mas isso me surpreendeu. Bom amigo, aqui é onde você vai se equipar e gastar seu suado salário de professor.\n"

cursoParte07::String
cursoParte07 = textoFormatado "C.W.: Bom, eu esqueci um energético no caldeirão, fique livre para explorar a cidade e falar com todos, e quando se sentir tranquilo vá até a minha torre para você entender sobre as forças desse mundo.\n"

cursoHistoria02::String
cursoHistoria02 = textoFormatado "C.W.: Olá Heanes, agora vou lhe explicar como você conseguirá enfrentar seus desafios. Basicamente, quando você entrar em combate, terá opções variadas que se escolhidas corretamente quando combinadas com seus atributos básicos, podem derrotar o seu inimigo.\n\nHeanes: Entendi essa parte, mas como vou saber meus atributos básicos?.\n\nMestre dos Magos (C.W.): Se você visitou a loja, sabe que existem itens e poções que aumentam seus atributos. Claro, para isso você tem que trabalhar e ganhar dinheiro nesse mundo. Apesar de ser um mago, ainda não produzo dinheiro, e quanto a ele... você pode ganhar de duas formas:\n"

kanvaHistoria::String
kanvaHistoria = textoFormatado "*Pensando sobre o que o C.W. disse, preciso ir ao museu e, pensando bem, acho que fica perto daquele padeiro estranho que conversei antes.* Na frente do museu heanes vê um homem, completamente desesperado, estatura mediana e cabelos bagunçados, repetindo para si mesmo: Isso não é arte. *Heanes se aproxima* e pergunta: Você é o Leandro?? Leandro: Sim, sou eu, e pelo que me disseram, você é o herói Heanes certo, não temos tempo a perder, dentro do museu o Kanva está alterando todo o museu, substituindo as pinturas mais perfeitas por suas imagens disformes. Heanes: Entendo, mas por que existem tantos cachorros grandes cercando o mu..."

menuInicial::String
menuInicial = "O que você deseja fazer??\n\n(1) Explorar a cidade.\n(2) Seguir Carl Wilson.\n"

caramelosKanva::String
<<<<<<< HEAD
caramelosKanva = textoFormatado "Leandro: Esses são os cachorros criados pelo kanva, fique de costas para mim para nao sermos cercados completamente!!!"
=======
caramelosKanva = textoFormatado "Leandro: Esses são os cachorros criados pelo kanva, vou ficar atrás de você aumentando seu ataque e diminuindo o ataque deles, mas preciso de protecao."

dialogoFerreira01::String
dialogoFerreira01 = textoFormatado "\nHeanes: Ferreira, se eu vou salvar o mundo, por que você só não me dá os melhores itens de uma vez?\n\nFerreira: *cerra os olhos e diz* Negócios são negócios, como vou pagar o meu café que tomo em seu Élho?\n\n*Ferreira não está mais aberto a conversas, acho melhor fazer alguma outra coisa decente*\n"

cursoAventura01::String
cursoAventura01 = textoFormatado "\nC.W.: Bom, agora que você já está mais orientado nessa bela cidadela, recomendo ir atrás de algumas informações sobre as I.As, Quem pode te ajudar nisso é o Leandro no museu.\n\nHeanes: Que Leandro??\n\nC.W.: Leandro Da Vinci.\n"

dialogoPadeiro01::String
dialogoPadeiro01 = textoFormatado "\n*Você encontra a Panificadora Alfa no caminho e decide conversar com o padeiro...*\n\nPadeiro: HoHoHo, Você não notou nada de estranho, Héroi?? Tenha cuidado, nem todos na Cidadela de Critais são confiáveis...\n\nHeanes: O que quer dizer com isso??\nPadeiro: Lembre-se disso: लोहार पर भरोसा मत करो... \n\n*Misterioresamente o homem que estava lá, desaparece aos olhos do professor.*\n\n*O professor decide ignorar isso por enquanto. Por enquanto...*"

explicacaoBasica01 :: String
explicacaoBasica01 = textoFormatado "\nC.W.: Ótimo! Então me ajude a carregar essas caixas, e dependendo de quantas você levar, eu pago a quantia adequada.\n"
>>>>>>> 002fb1313385f9ac58109f3acba997d7809ea147

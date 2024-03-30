{-# OPTIONS_GHC -Wno-missing-export-lists #-}
module Historia where
import Util.Lib

inicioHistoria1 :: String
inicioHistoria1 = textoFormatado "*Um professor de matemática de uma universidade localizada em Campina Extensa, enquanto dava uma aula sobre o Teorema do resto chines...*\n\nHeanes: Bom turma e agora aplicando euclides para descobrir o md…\n"

inicioHistoria2 :: String
inicioHistoria2 = textoFormatado "*Um portal se abre e Heanes foi sumonado para um mundo totalmente novo, a pessoa que o trouxe a esse mundo foi Carl Wilson, conhecido como C.W  ou comumente chamado de mestre dos magos nesse mundo*\n"

inicioHistoria3 :: String
inicioHistoria3 = textoFormatado "Carl Wilson: Olá professor, sei que você possivelmente não está entendendo o por que não está em uma sala de aula às 8:27 da manhã mas não temos tempo para uma longa explicação.\n" 

inicioHistoria4 :: String
inicioHistoria4 = textoFormatado "Carl Wilson: Precisamos da sua ajuda. O nosso mundo tem uma força que não conseguimos controlar e nem entender, chamada Inteligência Artificial. Você nos ajudaria nessa caminhada para proteger nossa cidadela de cristal?\n"

inicioHistoria5 :: String
inicioHistoria5 = textoFormatado "Professor: Calma, um momen…\n\nCarl Wilson: Por favor faça sua escolha.\n\n(1) Sim, quero ajudar.\n(2) Prefiro morrer.\n"

cursoParte01 :: String
cursoParte01 = textoFormatado ("Carl Wilson: Excelente ideia meu amigo pedagogo.\n\n" ++
        "*Após chegar nesse novo mundo, C.W. nos apresenta a Cidadela de Cristal um lugar repleto de pessoas.*\n")

cursoParte02 :: String
cursoParte02 = textoFormatado "C.W.: Aqui no nordeste desse mundo está a Cidadela de Cristal, um lugar com 500 anos de história, e com diversas pessoas vivendo sua vida, entre elas está o dono da loja de armas, Armas & Muita Defesa, mais conhecido como AMD.\n"

cursoParte03::String
cursoParte03 = textoFormatado "C.W.: Bom, aqui vai ser o lugar onde você vai se equipar para viver uma vida de batalhas, nada de camisa social. Iremos partir para o mundo medieval e usar armas e armaduras, lhe apresento o ferreiro Ferreira.\n"

cursoParte04 :: String
cursoParte04 = textoFormatado "Ferreira: Olá mestre dos magos, quem é o seu amigo?\n"

cursoParte05 :: String
cursoParte05 = textoFormatado "Heanes: Olá, me chamo Heanes, sou um professor de matemática e estou de passagem por esse mundo.\n"

cursoParte06 :: String
cursoParte06 = textoFormatado "Ferreira: Pera, como assim de passagem?!\n\n*Mestre dos magos explica a situação e toda a parte de viagem entre mundos*\n\nFerreira: Uou. Achei que a coisa mais aleatória que eu veria hoje seria um gato com 3 patas pixelado, mas isso me surpreendeu. Bom amigo, aqui é onde você vai se equipar e gastar seu suado salário de professor.\n"

cursoParte07 :: String
cursoParte07 = textoFormatado "C.W.: Bom, eu esqueci um energético no caldeirão, fique livre para explorar a cidade e falar com todos, e quando se sentir tranquilo vá até a minha torre para você entender sobre as forças desse mundo.\n"

cursoHistoria1 :: String
cursoHistoria1 = textoFormatado "C.W.: Olá Heanes, agora vou lhe explicar como você conseguirá enfrentar seus desafios. Basicamente, quando você entrar em combate, terá opções variadas que se escolhidas corretamente quando combinadas com seus atributos básicos, podem derrotar o seu inimigo.\n\nHeanes: Entendi essa parte, mas como vou saber meus atributos básicos?.\n\nMestre dos Magos (C.W.): Se você visitou a loja, sabe que existem itens e poções que aumentam seus atributos. Claro, para isso você tem que trabalhar e ganhar dinheiro nesse mundo. Apesar de ser um mago, ainda não produzo dinheiro, e quanto a ele... você pode ganhar de duas formas:\n"

kanvaHistoria1 :: String
kanvaHistoria1 = textoFormatado "C.W.: Tudo bem, vejo que você já que você está preparado, espero que tenha se equipado ao maximo, recomendo ir ao Museu, lá existem feras que estão fora de controle\n" 

kanvaHistoria2 :: String
kanvaHistoria2 = textoFormatado "*Na frente do museu, Heanes vê um homem completamente desesperado de estatura mediana e cabelos bagunçados*\n" 

kanvaHistoria3 :: String
kanvaHistoria3 = textoFormatado "Homem completamente desesperado: Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte. Isso não é arte...\n"

kanvaHistoria4 :: String
kanvaHistoria4 = textoFormatado "Heanes: Você é o Leandro??\n"

kanvaHistoria5 :: String
kanvaHistoria5 = textoFormatado "Leandro: Sim, sou eu. E pelo que me disseram, você é o herói. Não temos tempo a perder, dentro do museu a I.A. chamada Kanva está alterando tudo, substituindo as pinturas mais perfeitas por suas imagens disformes.\n"

kanvaHistoria6 :: String
kanvaHistoria6 = textoFormatado "*Enquanto Leandro falava, grandes sombras de cor caramelo surgiam ao redor*\n"

kanvaHistoria7 :: String
kanvaHistoria7 = textoFormatado "Leandro: Meu Deus, os fiéis companheiros do Kanva seus cachorros caramelos distorcidos, olha só aquele tem 3 focinho\n"

menuInicial :: String
menuInicial = textoFormatado "O que você deseja fazer??\n\n(1) Explorar a cidade.\n(2) Seguir Carl Wilson.\n(3) voltar ao menu"

caramelosKanva:: String
caramelosKanva = textoFormatado "OS CACHORROS FAREJAM VOCES E VÃO EM SUA DIREÇÃO! Heanes e Leandro são cercados por cachorros caramelos gigantes disformes.\nLeandro: Esses são os cachorros criados pelo kanva, fique de costas para mim para nao sermos cercados completamente!!!\n"

dialogoFerreira01::String
dialogoFerreira01 = textoFormatado "\nHeanes: Ferreira, se eu vou salvar o mundo, por que você só não me dá os melhores itens de uma vez?\n\nFerreira: *cerra os olhos e diz* Negócios são negócios, como vou pagar o meu café que tomo em seu Élho?\n\n*Ferreira não está mais aberto a conversas, acho melhor fazer alguma outra coisa decente*\n"

cursoAventura01::String
cursoAventura01 = textoFormatado "\nC.W.: Bom, agora que você já está mais orientado nessa bela cidadela, recomendo ir atrás de algumas informações sobre as I.As, Quem pode te ajudar nisso é o Leandro no museu.\n\nHeanes: Que Leandro??\n\nC.W.: Leandro Da Vinci.\n"

dialogoPadeiro01::String
dialogoPadeiro01 = textoFormatado "\n*Você encontra a Panificadora Alfa no caminho e decide conversar com o padeiro...*\n\nPadeiro: HoHoHo, Você não notou nada de estranho, Héroi?? Tenha cuidado, nem todos na Cidadela de Critais são confiáveis...\n\nHeanes: O que quer dizer com isso??\nPadeiro: Lembre-se disso: लोहार पर भरोसा मत करो... \n\n*Misterioresamente o homem que estava lá, desaparece aos olhos do professor.*\n\n*O professor decide ignorar isso por enquanto. Por enquanto...*"

explicacaoBasica01 :: String
explicacaoBasica01 = textoFormatado "\nC.W.: Ótimo! Então me ajude a carregar essas caixas, e dependendo de quantas você levar, eu pago a quantia adequada.\n"

promptPerguntas::String
promptPerguntas = "*Heanes se encaminha para um lugar de procedência duvidosa, lá ele encontra uma Vending Machine*\n\nVending Machine: OLÁ HUMANO! VOCÊ É CAPAZ DE RESPONDER A MINHA PERGUNTA?\nA cada vez que você derrotar uma IA terei uma pergunta fresquinha para você\nSó que tem um adendo, eu tenho um leve defeito de repetir a pergunta se o participante se afastar e voltar mas sei que você não abusaria desse \nbug para lucrar por que confio no seu carater\nvocê não faria isso? não é mesmo HEROI."

propagandaMaquina::String
propagandaMaquina = "NINGUEM NUNCA VEIO TÃO LONGE MEU AMIGO HUMANO, em comemoração a sua vasta inteligência irei lhe fazer uma promoção duas perguntas pelo preço de uma vinda\n será que você tem o que é necessario para responder tamanhas perguntas, essas últimas pergunta são de um nivel jamais visto nesse mundo\n meu criador conseguiu ela através de um erro no espaço tempo que chegou a uma outra dimesão e um outro planeta, você terá que responder algo sobre CAMPINA GRANDE\n vamos ver como você se sai, BOA SORTE"

opcoesCidadela:: String
opcoesCidadela = textoFormatado "Após a luta de ontem você desperta, mas vê que ainda são 6h da manhã O que você deseja fazer??\n\n(1) Explorar a cidade pela manhã.\n(2) Descansar mais um pouco\n(3) Voltar ao menu"

aposFinalDeSemana:: String
aposFinalDeSemana = textoFormatado "Após descansar por 2 dias nosso heroi acorda e vê que é segunda denovo, parece que nem em outro mundo você se livra disso, enfim o que deseja fazer??\n\n(1) Explorar a cidade em uma segunda infernal.\n(2) Dar uma procrastinada\n(3) Voltar ao menu"

dialogoFerreira02::String
dialogoFerreira02 = textoFormatado "Heanes: Ei os seus itens quebraram apos um uso? não tem nada sobre a garantia, algo como se quebrar em até 14 dias devolvemos seu dinheiro?\n\nFerreira: *arrega os olhos e diz*  Você tem a brilhante ideia de lutar contra cachorros e uma IA e quebrar os itens, e tem a cara de pau de falar que eles são defeituosos?\n\nHeanes: é pensando por esse lado..."

dialogoFerreira03::String
dialogoFerreira03 = textoFormatado "Heanes: Mais uma vez estou aqui sem nada, mas pelo que me disseram estou para ir enfrentar o ultimo desafio o que acha de me dar essa armadura que você está polindo?\n\nFerreira: *olhando com desgosto e descontentamento diz* Heroi parece que você não gosta de ser bem tratado na minha loja não é...\nHeanes: Desculpa... era apenas uma brincadeira\nHeanes sai do local parece que ferreira sabe ser cruel com as palavras."

dialogoFerreira04:: String
dialogoFerreira04 = textoFormatado "Heanes: ferreira hoje eu não tenho nada para pedir a você finalmente acabou\nFerreira: *lhe da um sorriso sincero* sim Heanes você conseguiu salvou a todos muito obrigado\nHeanes fica sem palavras, aquele homem que era rabugento e gostava de seu dinheiro sabia sorrir então.\nHeanes: De nada meu amigo Ferreira nada disso poderia ter acontecido sem sua ajuda."

dialogoLeandro01:: String
dialogoLeandro01 = textoFormatado "Leandro: Meu amigo, graças a você eu não vejo mais por aí aquelas imagens que cheira a plástico rodeando o museu muito obrigado\nHeanes: de nada meu amigo fico feliz em ajudar\nLeandro: Palavras não são o bastante para expressar minha felicidade venha a mim qualquer dia vou pintar você e colocar o nome de mano liso, será minha obra de arte\nHeanes: Isso não demoraria muito tempo pra ficando parado para você me pintar tenho que salvar o mundo\nLeandro: A arte sempre vem em primeiro lugar."

dialogoProfessorDublador::String
dialogoProfessorDublador = textoFormatado "Professor G: Heanes, meu heroi graças a você não preciso mais corrigir trabalhos errados por quê as crianças optaram por usar a IA, não gostaria de entrar e tomar uma xicara de café?\nWendell carneiro: Perai G, Heanes é ocupado, após ele derrotar todas as IA faça esse pedido, enfim obrigado Heanes graças a você aquela voz irritante sumiu\nHeanes: de nada é meu trabalho, após terminar tudo irei tomar um cafezinho e wendell tem certeza que não nos conhecemos sua voz é familiar?\nWendell: coincidência meu amigo coincidência."

dialogoTodos::String
dialogoTodos = textoFormatado "Multidão: HEANES HEANES HEANES HEANES\nHeanes não é muito orgulhoso mas fica com uma sensação boa de ouvir uma cidade gritar seu nome."

dialogoPadeiro02::String
dialogoPadeiro02 = textoFormatado "Heanes com seus instintos forjados na batalha sente algo em um beco e decide investigar, lá ele encontra ele O PADEIRO\nPadeiro: Nós encontramos de novo Heanes parabéns você cumpriu sua missão\nHeanes: Quem é você ou melhor o que é você?\nPadeiro: Ainda não é a hora de você saber disso heroi enfim meu tempo está acabando mas NOS VEMOS EM PROLOG\nO padeiro some mais uma vez e Heanes fica sem entender o que aconteceu"

cursoHistoria2::String
cursoHistoria2 = textoFormatado "*Você percebe que não descansou o suficiente, e que ninguem é de ferro, assim indo tirar um cochilo de mais meia hora\n*30 Minutes later*\nApos acordar você por algum motivo lembra de BoB Esponja e vê que é mais um dia de luta para salvar o mundo"

cursoHistoria3::String
cursoHistoria3 = textoFormatado "Segunda feira é um dia que tem algo que te puxa para baixo, você decide ir procrastinar e deixar para salvar o mundo para depois."

finalHistoria:: String
finalHistoria = textoFormatado "C.W: Parabéns Heanes, você é o salvador de todos nós e ficou bem essa faixa preta que você pegou do conversa\nHeanes: HAHA nada disso seria possivel sem sua ajuda mas... como eu volto pra casa\n*SILENCIO ENSURDECEDOR*\nC.W: aaaahnn MEU DEUS OLHA A HORA, nós vemos depois\nHeanes: EI VOLTA AQUI "

vilaoPlayHub :: String
vilaoPlayHub = textoFormatado "Eu sou o playhub e os caralho."

vilaoKanva :: String
vilaoKanva = textoFormatado "Eu sou o kanva e os caralho."

vitoriaKanva :: String
vitoriaKanva = textoFormatado "voce ganhou do kanva dog, nice!!"

historiaConversaGPT :: String
historiaConversaGPT = textoFormatado "historia da investigacao do conversaGPT"

vilaoGPT :: String
vilaoGPT = textoFormatado "historia do gpjhonsons"

vitoriaGPT :: String
vitoriaGPT = textoFormatado "NICEEE DOGGGGG VOLTA PRO TEU MUNDO AGORA NINGUEM LIGA PRA VOCE DOG WULF WULF"

endGame :: String
endGame = "endgame."

final:: String
final = textoFormatado "Você acorda e vê pessoas ao redor da sua casa, você é um heroi completo agora, saia e vá falar com seus fãs você merece a fama"
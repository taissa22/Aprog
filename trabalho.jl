using Printf
function menu(nome, title ,opc)
    @printf("""
    =============================================================
                  %s
    ============================================================= 
    
    %s

    """, nome, title)
    j=1
    for i in opc
        print("  ", j, " - ", i, "\n")
        j+=1
    end
    
end

function menuPt2(title, opc, inicio)
    println(title)
    j=1
    for i in opc
        print("  ", j+inicio, " - ", i, "\n")
        j+=1
    end
end

function ler_opcao(minima, maxima)
    print("Digite uma opção: ")
    opcao = parse(Int, readline())
    while !( minima <= opcao <= maxima)
        println("Opção inválida!")
        println()
        print("Digite uma opção: ")
        opcao = parse(Int, readline())
    end
    return opcao
    end

function telaInicial()
    menu1 = ["Ângulos", "Área", "Comprimento", "Força", "Massa", "Moeda", "Pressão", "Temperatura", "Velocidade", "Volume"]
    menu("Conversor de Unidades e Moedas","Opções: ", menu1)
    println("  0 - Sair\n")
    ler_opcao(0, 10)
end

function angulos()
    menu2 = ["Converter de radiano para grau", "Converter de grau para radiano", "Imprimir tabela de radianos para graus", "Imprimir tabela de graus para radianos"]
    menu("Conversão de ângulo", "Opções: ", menu2)
    println("  0 - Retornar para o menu anterior\n")
    ler_opcao(0, 4)
end

function forca_de()
    menu3 = ["Newton (N)", "Quilograma força (kgf)", "Dina (dyn)", "Libra-força (lbf)"]
    menu("Conversão de unidades de força", "Converter de uma das seguintes opções:", menu3)
    println("  0 - Retornar para o menu anterior\n")
    ler_opcao(0, 4)
end

function forca_para()
    menu3 = ["Newton (N)", "Quilograma força (kgf)", "Dina (dyn)", "Libra-força (lbf)"]
    menu("Conversão de unidades de força", "Converter para uma das seguintes opções:", menu3)
    println("  0 - Retornar para o menu anterior\n")
    ler_opcao(0, 4)
end

function massa_de()
    menu4 = ["quilograma (kg)", "hectograma (hg)", "decagrama  (dag)", "grama      (g)", "decigrama  (dg)", "centigrama (cg)", "miligrama  (mg)"]
    menu4_2= ["Tonelada curta", "Quarto curto", "Quintal curto", "Arroba", "Libra avoirdupois", "Onça avoirdupois", "Dracma avoirdupois", "Grão"]
    menu("Conversão de unidades de massa", "Sistema Internacional de Unidades\n--------------------------------------------", menu4)
    println()
    menuPt2("Sistema imperial de medidas (Estados Unidos)\n-------------------------------------------", menu4_2, 7)
    println("-------------------------------------------")
    println("  0 - Retornar para o menu anterior\n")
    ler_opcao(0, 15)
end

## main
telaInicial()

# if telaInicial() == 1
#     angulos()



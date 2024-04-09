using Printf
# funções visuais iniciais 
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

# função para ler opções válidas

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

# funções para os conversores

function telaInicial()
    menu1 = ["Ângulos", "Área", "Comprimento", "Força", "Massa", "Moeda", "Pressão", "Temperatura", "Velocidade", "Volume"]
    menu("Conversor de Unidades e Moedas","Opções: ", menu1)
    println("  0 - Sair\n")
    num = ler_opcao(0, 10)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function angulos()
    menu2 = ["Converter de radiano para grau", "Converter de grau para radiano", "Imprimir tabela de radianos para graus", "Imprimir tabela de graus para radianos"]
    menu("Conversão de ângulo", "Opções: ", menu2)
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 4)
    return num
end

function rad_grau()
    println("=============================================================")
    println("              Conversão de radiano para grau                 ")
    println("=============================================================")
    print("Digite o ângulo em radianos: ")
    rad = parse(Float64, readline())
    @printf("Ângulo em graus: %.2f°\n", (rad * 180/π))
    @printf("""Opções:

                1 - Converter outro ângulo 
                0 - Retornar ao menu anterior

                """)
    num = ler_opcao(0, 1)
    return num
end

function grau_rad()
    println("=============================================================")
    println("              Conversão de grau para radiano                 ")
    println("=============================================================")
    print("Digite o ângulo em graus: ")
    grau = parse(Float64, readline())
    @printf("Ângulo em radianos: %.2f\n", (grau * π/180))
    @printf("""Opções:

                1 - Converter outro ângulo 
                0 - Retornar ao menu anterior

                """)
    num = ler_opcao(0, 1)
    return num
end

function tab_graus()
    println("=============================================================")
    println("          Tabela de conversão de radianos para graus         ")
    println("=============================================================")
    println("Digite o incremento em radianos.")
    print("Digite um número real no intervalo [0.01, 6.28]: ")
    rad = parse(Float64, readline())
    @printf("""
             ---------------
             Radianos  Graus
             ---------------
             """)
    inicio = 0
    while inicio <= 6.3
        grau = inicio * 180/π
        @printf("%.4f    %.1f\n", inicio, grau)
        inicio += rad
    end
    println("---------------")
    @printf("""Opções:

                1 - Converter outro ângulo 
                0 - Retornar ao menu anterior

                """)
    num = ler_opcao(0, 1)
    return num
end

function tab_rad()
    println("=============================================================")
    println("          Tabela de conversão de graus para radianos         ")
    println("=============================================================")
    println("Digite o incremento em graus.")
    print("Digite um número inteiro no intervalo [1, 360]: ")
    grau = parse(Float64, readline())
    @printf("""
             ---------------
             Graus  Radianos
             ---------------
             """)
    inicio = 0
    while inicio <= 360
        rad = inicio * π/180
        @printf("%.1f    %.4f\n", inicio, rad)
        inicio += grau
    end
    println("---------------")
    @printf("""Opções:

                1 - Converter outro ângulo 
                0 - Retornar ao menu anterior

                """)
    num = ler_opcao(0, 1)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function area(fonte)
    menuD = ["quilômetro quadrado (km²)", "hectare (ha)", "are (a)", "metro quadrado (m²)", "decímetro quadrado (dm²)", "centímetro quadrado (cm²)", "milímetro quadrado (mm²)"]
    menuE = ["polegada quadrada (in²)", "pé quadrado (ft²)", "jarda quadrada (yd²)", "rod quadrado", "rood", "acre (ac)", "homestead", "milha quadrada (mi²)", "légua quadrada"]
    title= "Converter " * fonte * " uma das seguintes opções: \n\nSistema Internacional de Unidades\n--------------------------------------------"
    menu("Conversão de unidades de área", title, menuD)
    println()
    menuPt2("Sistema Inglês\n-------------------------------------------", menuE, 7)
    println("-------------------------------------------")
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 16)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function comprimento(fonte)
    menuD = ["quilômetro quadrado (km²)", "hectare (ha)", "are (a)", "metro quadrado (m²)", "decímetro quadrado (dm²)", "centímetro quadrado (cm²)", "milímetro quadrado (mm²)"]
    menuE = ["polegada quadrada (in²)", "pé quadrado (ft²)", "jarda quadrada (yd²)", "rod quadrado", "rood", "acre (ac)", "homestead", "milha quadrada (mi²)", "légua quadrada"]
    title= "Converter " * fonte * " uma das seguintes opções: \n\nSistema Internacional de Unidades\n--------------------------------------------"
    menu("Conversão de unidades de área", title, menuD)
    println()
    menuPt2("Sistema Inglês\n-------------------------------------------", menuE, 7)
    println("-------------------------------------------")
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 16)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------------------------------------------------------------

function forca(fonte)
    menu3 = ["Newton (N)", "Quilograma força (kgf)", "Dina (dyn)", "Libra-força (lbf)"]
    title= "Converter "* fonte * " uma das seguintes opções: "
    menu("Conversão de unidades de força", title, menu3)
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 4)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function massa(fonte)
    menu4 = ["quilograma (kg)", "hectograma (hg)", "decagrama  (dag)", "grama      (g)", "decigrama  (dg)", "centigrama (cg)", "miligrama  (mg)"]
    menu4_2= ["Tonelada curta", "Quarto curto", "Quintal curto", "Arroba", "Libra avoirdupois", "Onça avoirdupois", "Dracma avoirdupois", "Grão"]
    title= "Converter " * fonte * " uma das seguintes opções: \n\nSistema Internacional de Unidades\n--------------------------------------------"
    menu("Conversão de unidades de massa", title, menu4)
    println()
    menuPt2("Sistema imperial de medidas (Estados Unidos)\n-------------------------------------------", menu4_2, 7)
    println("-------------------------------------------")
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 15)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function moedas(fonte)
    menu3 = ["Dólar Americano (USD)", "Libra Esterlina (GBP)", "Euro (EUR)", "Iene Japonês (JPY)", "Franco Suíço (CHF)", "Dólar Australiano (AUD)", "Dólar Canadense (CAD)", "Real (BRL)", "Renminbi (RMB)"]
    title= "Converter "* fonte * " uma das seguintes opções: "
    menu("Conversão entre moedas", title, menu3)
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 9)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function pressao(fonte)
    menu5 = ["Megapascal (MPa)", "Quilopascal (kPa)", "Pascal (Pa)"]
    menu6 = ["KSI", "PSI", "Libra por polegada quadrada (lbf/in²)"]
    title= "Converter " * fonte * " uma das seguintes opções: \n\nSistema Internacional de Unidades\n--------------------------------------------"
    menu("Conversão de unidades de massa", title, menu4)
    println()
    menuPt2("Sistema Inglês\n-------------------------------------------", menu4_2, 3)
    println("-------------------------------------------")
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 15)
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# massa("de")
# massa("para")
# println(oi, oi, oi)
# println(typeof(oi))
# if telaInicial() == 1
#     angulos()
# grau_rad()
tab_rad()
function main()

end

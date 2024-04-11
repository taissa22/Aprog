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
    num = 1
    while num != 0
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
    end
    return num
end

function grau_rad()
    num = 1
    while num != 0
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
    end
    return num
end

function tab_graus()
    num = 1
    while num != 0 
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
    end
    return num
end

function tab_rad()
    num = 1
    while num != 0
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
    end
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

function area_conv(de, para)
    num = 1
    opcoes = ["quilômetro quadrado (km²)", "hectare (ha)", "are (a)", "metro quadrado (m²)", "decímetro quadrado (dm²)", "centímetro quadrado (cm²)", "milímetro quadrado (mm²)", "polegada quadrada (in²)", "pé quadrado (ft²)", "jarda quadrada (yd²)", "rod quadrado", "rood", "acre (ac)", "homestead", "milha quadrada (mi²)", "légua quadrada"]
    while num != 0
        println("=============================================================")
        @printf("Conversão de %s para %s\n", opcoes[de], opcoes[para])
        println("=============================================================\n")
        @printf("Digite a área em %s.\n", opcoes[de])
        print("Digite um número real positivo: ")
        inicial = parse(Float64, readline())
        new = de
        if de != 1
            if de == 2
                inicial = inicial * 0.01
            elseif de == 3
                inicial = inicial * 0.0001
            elseif de == 4
                inicial = inicial * 0.000001
            elseif de == 5
                inicial = inicial * 0.00000001
            elseif de == 6
                inicial = inicial / 10000000000
            elseif de == 7
                inicial = inicial / 1000000000000
            elseif de == 8
                inicial = inicial / 1550003000
            elseif de == 9
                inicial = inicial / 10763910
            elseif de == 10
                inicial = inicial / 1195990,0463
            elseif de == 11
                inicial = inicial / 39536.87
            elseif de == 12
                inicial = inicial / 988.42
            elseif de == 13
                inicial = inicial / 247.11
            elseif de == 14
                inicial = inicial / 1.5444
            elseif de == 15
                inicial = inicial * 2.59
            elseif de == 16
                inicial = inicial / 23.309892993024
                
            end
            de = 1
        end
        if de == para
            final = inicial 
        end
        if de == 1
            if para == 2
                final = inicial/100
            elseif para == 3
                final = inicial*10000
            elseif para == 4
                final = inicial * 1000000
            elseif para == 5
                final = inicial * 100000000
            elseif para == 6
                final = inicial * 10000000000
            elseif para == 7
                final = inicial * 1000000000000
            elseif para == 8
                final = inicial * 1550003000
            elseif para == 9
                final = inicial * 10763910
            elseif para == 10
                final = inicial * 1195990,0463
            elseif para == 11
                final = inicial * 39536.87
            elseif para == 12
                final = inicial * 988.42
            elseif para == 13
                final = inicial * 247.11
            elseif para == 14
                final = inicial * 1.5444
            elseif para == 15
                final = inicial / 2,59
            elseif para == 16
                final = inicial * 23,309892993024
            end
        end
        @printf("Área em %s: ", opcoes[para])
        @printf("%.2f\n", final)
        @printf("""
                    Opções:

                        1 - Converter novamente de %s para %s
                        0 - Retornar ao menu anterior

                    """, opcoes[new], opcoes[para])
    
        num = ler_opcao(0, 1)
    end
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function comprimento(fonte)
    menuD = ["quilômetro (km)", "hectômetro(hm)", "decâmetro(dam)", "metro (m)", "decímetro (dm)", "centímetro (cm)", "milímetro (mm)"]
    menuE = ["polegada (in)", "pé (ft)", "jarda (yd)", "rod", "furlong", "corrente", "mil", "milha (mi)", "légua"]
    title= "Converter " * fonte * " uma das seguintes opções: \n\nSistema Internacional de Unidades\n--------------------------------------------"
    menu("Conversão de unidades de área", title, menuD)
    println()
    menuPt2("Sistema Inglês\n-------------------------------------------", menuE, 7)
    println("-------------------------------------------")
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 16)
    return num
end


function comprimento_conv(de, para)
    num = 1
    opcoes = ["quilômetro (km)", "hectômetro(hm)", "decâmetro(dam)", "metro (m)", "decímetro (dm)", "centímetro (cm)", "milímetro (mm)", "polegada (in)", "pé (ft)", "jarda (yd)", "rod", "furlong", "corrente", "mil", "milha (mi)", "légua"]
    while num != 0
        println("=============================================================")
        @printf("Conversão de %s para %s\n", opcoes[de], opcoes[para])
        println("=============================================================\n")
        @printf("Digite o comprimento em %s.\n", opcoes[de])
        print("Digite um número real positivo: ")
        inicial = parse(Float64, readline())
        new = de
        if de != 1
            if de == 2
                inicial = inicial * 0.1
            elseif de == 3
                inicial = inicial * 0.01
            elseif de == 4
                inicial = inicial * 0.001
            elseif de == 5
                inicial = inicial * 0.0001
            elseif de == 6
                inicial = inicial * 0.00001
            elseif de == 7
                inicial = inicial * 0.000001
            elseif de == 8
                inicial = inicial / 39370
            elseif de == 9
                inicial = inicial / 3280.8
            elseif de == 10
                inicial = inicial / 1094
            elseif de == 11
                inicial = inicial / 198.83
            elseif de == 12
                inicial = inicial / 4.971
            elseif de == 13
                inicial = inicial / 49.7096
            elseif de == 14
                inicial = inicial /  39370000
            elseif de == 15
                inicial = inicial / (1000/1609)
            elseif de == 16
                inicial = inicial / (10000/48263)
            end
            de = 1
        end
        if de == para
            final = inicial 
        end
        if de == 1
            if para == 2
                final = inicial / 0.1
            elseif para == 3
                final = inicial / 0.01
            elseif para == 4
                final = inicial / 0.001
            elseif para == 5
                final = inicial / 0.0001
            elseif para == 6
                final = inicial / 0.00001
            elseif para == 7
                final = inicial / 0.000001
            elseif para == 8
                final = inicial * 39370
            elseif para == 9
                final = inicial * 3280.8
            elseif para == 10
                final = inicial * 1094
            elseif para == 11
                final = inicial * 198.83
            elseif para == 12
                final = inicial * 4.971
            elseif para == 13
                final = inicial * 49.7096
            elseif para == 14
                final = inicial * 39370000
            elseif para == 15
                final = inicial * (1000/1609)
            elseif para == 16
                final = inicial * (10000/48263)
            end
        end
        @printf("Comprimento em %s: ", opcoes[para])
        @printf("%.2f\n", final)
        @printf("""
                    Opções:

                        1 - Converter novamente de %s para %s
                        0 - Retornar ao menu anterior

                    """, opcoes[new], opcoes[para])
    
        num = ler_opcao(0, 1)
    end
    return num
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function forca(fonte)
    menu3 = ["Newton (N)", "Quilograma força (kgf)", "Dina (dyn)", "Libra-força (lbf)"]
    title= "Converter "* fonte * " uma das seguintes opções: "
    menu("Conversão de unidades de força", title, menu3)
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 4)
    return num
end

function forca_conv(de, para)
    num = 1
    opcoes = ["Newton (N)", "Quilograma força (kgf)", "Dina (dyn)", "Libra-força (lbf)"]
    while num != 0
        println("=============================================================")
        @printf("Conversão de %s para %s\n", opcoes[de], opcoes[para])
        println("=============================================================\n")
        @printf("Digite a força em %s.\n", opcoes[de])
        print("Digite um número real positivo: ")
        inicial = parse(Float64, readline())
        new = de
        #outros para newton
        if de != 1
            if de == 2
                inicial = inicial/0.101972
            elseif de == 3
                inicial = inicial/100000
            elseif de == 4
                inicial = inicial/0.22481
            end
            de = 1
        end

        if de == para
            final = inicial 
        end
        #newton para outros
        if de == 1
            if para == 2
                final = inicial * 0.101972
            elseif para == 3
                final = inicial * 100000
            elseif para == 4
                final = inicial * 0.22481
            end 
        end
        @printf("Força em %s: ", opcoes[para])
        @printf("%.2f\n", final)
        @printf("""
                    Opções:

                        1 - Converter novamente de %s para %s
                        0 - Retornar ao menu anterior

                    """, opcoes[new], opcoes[para])
    
        num = ler_opcao(0, 1)
    end
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

function massa_conv(de, para)
    num = 1
    opcoes = ["quilograma(kg)", "hectograma(hg)", "decagrama(dag)", "grama(g)", "decigrama(dg)", "centigrama(cg)", "miligrama(mg)", "Tonelada curta", "Quarto curto", "Quintal curto", "Arroba", "Libra avoirdupois", "Onça avoirdupois", "Dracma avoirdupois", "Grão"]
    while num != 0
        println("=============================================================")
        @printf("Conversão de %s para %s\n", opcoes[de], opcoes[para])
        println("=============================================================\n")
        @printf("Digite a massa em %s.\n", opcoes[de])
        print("Digite um número real positivo: ")
        inicial = parse(Float64, readline())
        new = de
        #outros para grama
        if de != 4
            if de == 1
                inicial = inicial * 0.001
            elseif de == 2
                inicial = inicial * 0.01
            elseif de == 3
                inicial = inicial * 0.1
            elseif de == 5
                inicial = inicial * 10
            elseif de == 6
                inicial = inicial * 100
            elseif de == 7
                inicial = inicial * 1000
            elseif de == 8
                inicial = inicial * 1.1023 * 0.000001
            elseif de == 9
                inicial = inicial * (1/226796)
            elseif de == 10
                inicial = inicial * (1/226796) / 5
            elseif de == 11
                inicial = inicial * (1/226796) / 20
            elseif de == 12
                inicial = inicial * (1/226796) / 500
            elseif de == 13
                inicial = inicial  * (1/226796) / 8000
            elseif de == 14
                inicial = inicial * (1/226790) / 128000
            elseif de == 15
                inicial = inicial * (1/226790) / 3500000
            end
            de = 4
        end

        if de == para
            final = inicial 
        end
        #grama para outros
        if de == 4
            if para == 1
                final = inicial  * 1000
            elseif para == 2
                final = inicial * 100
            elseif para == 3
                final = inicial * 10
            elseif para == 5
                final = inicial * 0.1
            elseif para == 6
                final = inicial * 0.01
            elseif para == 7
                final = inicial * 0.001
            elseif para == 8
                final = inicial / 1.1023 * 0.000001
            elseif para == 9
                final = inicial / (1/226796)
            elseif para == 10
                final = inicial / (1/226796) / 5
            elseif para == 11
                final = inicial / (1/226796) / 20
            elseif para == 12
                final = inicial / (1/226796) / 500
            elseif para == 13
                final = inicial / (1/226796) / 8000
            elseif para == 14
                final = inicial / (1/226790) / 128000
            elseif para == 15
                final = inicial / (1/226790) / 3500000
            end 
        end
        @printf("Massa em %s: ", opcoes[para])
        @printf("%.2f\n", final)
        @printf("""
                    Opções:

                        1 - Converter novamente de %s para %s
                        0 - Retornar ao menu anterior

                    """, opcoes[new], opcoes[para])
    
        num = ler_opcao(0, 1)
    end
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

function moedas_conv(de, para)
    num = 1
    opcoes = ["(USD)", "(GBP)", "(EUR)", "(JPY)", "(CHF)", "(AUD)", "(CAD)", "(BRL)", "(RMB)"]
    while num != 0
        println("=============================================================")
        @printf("Conversão de %s para %s\n", opcoes[de], opcoes[para])
        println("=============================================================\n")
        @printf("Digite a quantidade, em %s.\n", opcoes[de])
        print("Digite um número real positivo: ")
        inicial = parse(Float64, readline())
        new = de
        #outros para dolar
        if de != 1
            if de == 2
                inicial = inicial * 0.001
            elseif de == 3
                inicial = inicial * 0.01
            elseif de == 4
                inicial = inicial * 0.1
            elseif de == 5
                inicial = inicial * 10
            elseif de == 6
                inicial = inicial * 100
            elseif de == 7
                inicial = inicial * 1000
            elseif de == 8
                inicial = inicial * 1.1023 * 0.000001
            elseif de == 9
                inicial = inicial * (1/226796)
            end
            de = 1
        end

        if de == para
            final = inicial 
        end
        #dolar para outros
        if de == 1
            if para == 2
                final = inicial  * 1000
            elseif para == 3
                final = inicial * 10
            elseif para == 4
                final = inicial * 100
            elseif para == 5
                final = inicial * 0.1
            elseif para == 6
                final = inicial * 0.01
            elseif para == 7
                final = inicial * 0.001
            elseif para == 8
                final = inicial / 1.1023 * 0.000001
            elseif para == 9
                final = inicial / (1/226796)
            end 
        end
        @printf("Moeda em %s: ", opcoes[para])
        @printf("%.2f\n", final)
        @printf("""
                    Opções:

                        1 - Converter novamente de %s para %s
                        0 - Retornar ao menu anterior

                    """, opcoes[new], opcoes[para])
    
        num = ler_opcao(0, 1)
    end
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

function pressao_conv(de, para)
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function temperaturas(fonte)
    menu5 =  ["Kelvin (K)", "Grau Celsius (°C)", "Grau Fahrenheit (°F)", "Grau Rankine (°Ra)", "Grau Réaumur (°Ré)", "Grau Newton (°N)", "Grau Delisle (°D)"]
    title= "Converter " * fonte * " uma das seguintes opções: \n\nSistema Internacional de Unidades\n--------------------------------------------"
    menu("Conversão de unidades de massa", title, menu4)
    println("  0 - Retornar para o menu anterior\n")
    num = ler_opcao(0, 15)
    return num
end

function temperaturas_conv(de, para)
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function velocidades(fonte)
end

function velocidades_conv(de, para)
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

function volume(fonte)
end

#nem ideia como faço essa merda pqp que ÓDIOOOO
#----------------------------------------------------------------------------------------------------------------------------------------------------------

function main()
    menu = 0
    de = 0
    para = 0
    while menu!= -1
        menu = 0
        opc = telaInicial()
        if opc == 1
            while menu != 1 
                opc = angulos()
                if opc == 1
                    opc = rad_grau()
                elseif opc == 2
                    opc= grau_rad()
                elseif opc == 3
                    opc = tab_graus()
                elseif opc == 4
                    opc = tab_rad()
                elseif opc == 0
                    menu = 1
                end
            end
        elseif opc == 2
            while menu != 1 
                de = area("de")
                if de != 0
                    para = area("para")
                    if para != 0
                        menu = area_conv(de, para)
                    else
                        menu = 1
                    end
                else 
                    menu = 1
                end
            end
        elseif opc == 3
            while menu != 1 
                de = comprimento("de")
                if de != 0
                    para = comprimento("para")
                    if para != 0
                        menu = comprimento_conv(de, para)
                    else
                        menu = 1
                    end
                else 
                    menu = 1
                end
            end
        elseif opc == 4
            while menu != 1 
                de = forca("de")
                if de != 0
                    para = forca("para")
                    if para != 0
                        menu = forca_conv(de, para)
                    else
                        menu = 1
                    end
                else   
                    menu = 1
                end
            end
        elseif opc == 5
            while menu != 1 
                de = massa("de")
                if de != 0
                    para = massa("para")
                    if para != 0
                        menu = massa_conv(de, para)
                    else
                        menu = 1
                    end
                else
                 menu = 1
                end
            end
        elseif opc == 6
            while menu != 1 
                de = moedas("de")
                if de != 0
                    para = moedas("para")
                    if para != 0
                        menu = moedas_conv(de, para)
                    else
                        menu = 1
                    end
                else
                 menu = 1
                end
            end
        elseif opc == 7
            while menu != 1 
                de = pressao("de")
                if de != 0
                    para = pressao("para")
                    if para != 0
                        menu = pressao_conv(de, para)
                    else
                        menu = 1
                    end
                else
                 menu = 1
                end
            end
        elseif opc == 8
            while menu != 1 
                de = temperaturas("de")
                if de != 0
                    para = temperaturas("para")
                    if para != 0
                        menu = temperaturas_conv(de, para)
                    else
                        menu = 1
                    end
                else
                 menu = 1
                end
            end
        elseif opc == 9
            while menu != 1 
                de = velocidades("de")
                if de != 0
                    para = velocidades("para")
                    if para != 0
                        menu = velocidades_conv(de, para)
                    else
                        menu = 1
                    end
                else
                 menu = 1
                end
            end
        elseif opc == 10
            while menu != 1 
                de = volume("de")
                if de != 0
                    para = volume("para")
                    if para != 0
                        menu = volume_conv(de, para)
                    else
                        menu = 1
                    end
                else
                 menu = 1
                end
            end
        elseif opc == 0 
            exit()
        end
    end
end

#----------------------------------------------------------------------------------------------------------------------------------------------------------

main()


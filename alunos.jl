using Base
using Printf

struct Aluno
    nome::String
    matricula::String
    prova1::Int
    prova2::Int
    prova3::Int
    trabalho1::Int
    trabalho2::Int
    faltas::Int
    notaFinal::Int
    situacao::String
end

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
    num = 0
    turma::Array{Aluno} = []
    arquivo = ""
    while num != 7
        menu1 = ["Ler turma de estudantes do arquivo", "Imprimir turma de estudantes", "Imprimir estatísticas da turma", "Cadastrar novo estudante", "Editar informações de um estudante", "Reler turma de estudantes do arquivo", "Salvar e Sair"]
        menu("Menu Principal","Opções: ", menu1)
        num = ler_opcao(1, 7)
        if num == 1
            turma, arquivo = telaLerTurmas()
        elseif num == 2
            telaImprimeTurma(turma)
        elseif num == 3
            telaImprimeEstatisticas(turma)
        elseif num == 4
            turma = telaCadastroEstudante(turma)
        elseif num == 5
            turma = telaEditarEstudante(turma)
        elseif num == 6
            turma, arquivo = telaRelerTurma(turma, arquivo)
        end #if num
    end
    return
end

function telaLerTurmas()
    num = 0
    turma::Array{Aluno} = []
    arquivo = ""
    while num != 3 
        menu1 = ["Ler turma existente", "Criar nova turma", "Voltar ao menu principal"]
        menu("Ler Turma","Opções: ", menu1)
        num = ler_opcao(1, 3)
        if num == 1
            turma, arquivo = abreArmazena()
        elseif num == 2
            turma, arquivo = criaTurma()
        end # if arquivo
    end #while
    return turma, arquivo
end


function abreArmazena()
    print("Digite o nome do arquivo com a turma: ")
    arquivo = readline()
    turma::Array{Aluno} = []
    try
        open(arquivo, "r") do s
            while !eof(s)
                nome = readline(s)
                mat = readline(s)
                p1= parse(Int, readline(s))
                p2 = parse(Int, readline(s))
                p3 = parse(Int, readline(s))
                t1 = parse(Int, readline(s))
                t2 = parse(Int, readline(s))
                f = parse(Int, readline(s))
                nF = parse(Int, readline(s))
                si = readline(s)
                    aluno = Aluno(nome, mat, p1, p2, p3, t1, t2, f, nF, si)
                    push!(turma, aluno)
            end
            close(s)
            println("Arquivo $arquivo lido com sucesso!\n")
            return turma, arquivo
        end
    catch
        println("Arquivo $arquivo não existe!\n")
        return turma, arquivo
    end
end


function criaTurma()
    print("Digite o nome para a nova turma: ")
    arquivo = readline()
    try # se existe
        open(arquivo, "r") do s
            print("Arquivo $arquivo já existe. Deseja sobrescrevê-lo? (S/N)")
            resposta = readline()
            if resposta == "S" || resposta == "s"
                open(s, "w")
            else
                return
            end
        end
    catch #se não existe
        s = open(arquivo, "w")
        close(s)
    end
    println("Arquivo $arquivo criado com sucesso.")
    return arquivo
end


function telaImprimeTurma(turma::Array{Aluno})
    if isempty(turma)
        print("Não há turma carregada!\n")
        return
    else
        @printf("""
            --------------------------------------------------------------
                                     Estudantes
            --------------------------------------------------------------
            Nome                   Matrícula N1 N2 N3 T1 T2 Fal  Final Sit
            --------------------------------------------------------------
            """)
        for aluno in turma
            print("$(aluno.nome)    $(aluno.matricula) $(aluno.prova1) $(aluno.prova2) $(aluno.prova3) $(aluno.trabalho1) $(aluno.trabalho2) $(aluno.faltas)         $(aluno.situacao)\n")
        end
        println("--------------------------------------------------------------")
        println()
        return
    end
    
end

function telaImprimeEstatisticas(turma::Array{Aluno})
    if isempty(turma)
        print("Não há turma carregada!\n")
        return
    else
        @printf("""
            --------------------------------------------------------------
                                     Estatísticas
            --------------------------------------------------------------
                                    N1    N2    N3    T1    T2    Final
            --------------------------------------------------------------
            """)
        for aluno in turma
            
        end
    end
end

function telaCadastroEstudante(turma::Array{Aluno})
    if isempty(turma)
        print("Não há turma carregada!\n")
        return turma
    else
        print("Digite o nome do estudante: ")
        nome = readline()
        print("Digite a matrícula do estudante: ")
        mat = readline()
        println("Digite as 3 notas de prova:")
        p1 = parse(Int, readline())
        p2 = parse(Int, readline())
        p3 = parse(Int, readline())
        println("Digite as 2 notas de trabalho:")
        t1 = parse(Int, readline())
        t2 = parse(Int, readline())
        println("Digite as faltas:")
        f = parse(Int, readline())
        println()
        final = p1+p2+p3+t1+t2
        println("Nota Final calculada: $final")
        if final > 60 && f<18
            sit = "Aprovado"
            si = "A"
        elseif final <= 60 && f<18
            sit = "Reprovado"
            si = "R"
        elseif f>=18
            sit = "Reprovado por falta"
            si = "F"
        end
        println("Situação Final: $sit\n")
        aluno = Aluno(nome, mat, p1, p2, p3, t1, t2, f, final, si)
        push!(turma, aluno)
    end
    return turma
end


function telaEditarEstudante(turma::Array{Aluno})
    num = 0
    while num != 3
        if isempty(turma)
            print("Não há turma carregada!\n")
        else
            menu1 = ["Selecionar por número de matrícula", "Selecionar por nome", "Voltar ao menu principal"]
            menu("Editar informações do Estudante", "Opções", menu1)
            menu2= ["Alterar nome", "Alterar matrícula", "Alterar nota da prova 1", "Alterar nota da prova 2", "Alterar nota da prova 3", "Alterar nota do trabalho 1", "Alterar do trabalho 2", "Alterar número de faltas", "Voltar ao menu anterior"]
            num = ler_opcao(1, 3)
            match=false
            if num == 1
                print("Digite o número de matricula: ")
                matricula = readline()
                index=0
                for aluno in turma
                    index+=1
                    if aluno.matricula == matricula
                        menu("Editar informações do Estudante", "Opções", menu2)
                        infoAluno(turma, index)
                        match=true
                    end
                end
                if match==false
                    println("Número de matricula inválido! \n")
                end

            elseif num == 2
                print("Digite o nome: ")
                nome = readline()
                index=0
                for aluno in turma
                    index+=1
                    if aluno.nome == nome
                        menu("Editar informações do Estudante", "Opções", menu2)
                        infoAluno(turma, index)
                        match=true
                    end
                end
                if match==false
                    println("Nome inválido! \n")
                end
            end
        end
    end
    return turma
end

function infoAluno(turma::Array{Aluno}, index)
    opc=0
    while opc!=9
        ler_opcao(1, 9)
        if opc == 1
            println(turma[index].nome)
            # print("Digite o nome do estudante: ")
            # turma[index].nome = readline()
        elseif opc == 2
            print("Digite a matrícula do estudante: ")
            turma[index].matricula = readline()
        elseif opc == 3
            print("Digite a nota da P1: ")
            turma[index].prova1 = parse(Int, readline())
        elseif opc == 4
            print("Digite a nota da P2: ")
            turma[index].prova2 = parse(Int, readline())
        elseif opc == 5
            print("Digite a nota da P3: ")
            turma[index].prova3 = parse(Int, readline())
        elseif opc == 6
            print("Digite a nota da T1: ")
            turma[index].trabalho1 = parse(Int, readline())
        elseif opc == 7
            print("Digite a nota da T2: ")
            turma[index].trabalho2 = parse(Int, readline())
        elseif opc == 8
            print("Digite a falta: ")
            turma[index].faltas = parse(Int, readline())
        end
        turma[index].notaFinal = turma[index].prova1+turma[index].prova2+turma[index].prova3+turma[index].trabalho1+turma[index].trabalho2
        if final > 60 && f<18
            si = "A"
        elseif final <= 60 && f<18
            si = "R"
        elseif f>=18
            si = "F"
        end
        turma[index].situacao = si
        return
    end
end

function telaRelerTurma(turma, arquivo)
    if isempty(turma)
        print("Não há turma carregada!\n")
    else
        open(arquivo, "r") do s
            while !eof(s)
                nome = readline(s)
                mat = readline(s)
                p1= parse(Int, readline(s))
                p2 = parse(Int, readline(s))
                p3 = parse(Int, readline(s))
                t1 = parse(Int, readline(s))
                t2 = parse(Int, readline(s))
                f = parse(Int, readline(s))
                nF = parse(Int, readline(s))
                si = readline(s)
                    aluno = Aluno(nome, mat, p1, p2, p3, t1, t2, f, nF, si)
                    push!(turma, aluno)
            end
            close(s)
            println("Arquivo $arquivo lido com sucesso!\n")
    end
    return turma, arquivo
end

function media(turma::Array{Aluno}, cat)
    soma = 0.0
    for aluno in turma
        soma += aluno.cat
    end
    media = soma / length(turma)
    return media
end

telaInicial()
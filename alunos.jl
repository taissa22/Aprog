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
    while num != 7
        menu1 = ["Ler turma de estudantes do arquivo", "Imprimir turma de estudantes", "Imprimir estatísticas da turma", "Cadastrar novo estudante", "Editar informações de um estudante", "Reler turma de estudantes do arquivo", "Salvar e Sair"]
        menu("Menu Principal","Opções: ", menu1)
        num = ler_opcao(1, 7)
        if num == 1
            turma = telaLerTurmas()
        elseif num == 2
            telaImprimeTurma(turma)
        elseif num == 3
            telaImprimeEstatisticas(turma)
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
            turma = abreArmazena()
        elseif num == 2
            arquivo = criaTurma()
        end # if arquivo
    end #while
    return turma
end


function abreArmazena()
    print("Digite o nome do arquivo com a turma: ")
    arquivo = readline()
    try
        open(arquivo, "r") do s
            turma::Array{Aluno} = []
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
            return turma
        end
    catch
        println("Arquivo $arquivo não existe!\n")
        return
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
            end
            close(s)
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
            print("$(aluno.nome) $(aluno.matricula) $(aluno.prova1) $(aluno.prova2) $(aluno.prova3) $(aluno.trabalho1) $(aluno.trabalho2) $(aluno.faltas) $(aluno.situacao)\n")
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
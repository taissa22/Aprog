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

# print("Digite o nome do arquivo com a turma: ")
#     arquivo = readline()
#     turma=[]
#     try
#         open(arquivo, "r") do s
#             println("Arquivo $arquivo lido com sucesso!")
#             turma = []
#             while !eof(s)
#                 nome = readline(s)
#                 mat = readline(s)
#                 p1= parse(Float32, readline(s))
#                 p2 = parse(Float32, readline(s))
#                 p3 = parse(Float32, readline(s))
#                 t1 = parse(Float32, readline(s))
#                 t2 = parse(Float32, readline(s))
#                 f = parse(Int, readline(s))
#                 nF = parse(Float32, readline(s))
#                 si = readline(s)
#                 aluno = Aluno(nome, mat, p1, p2, p3, t1, t2, f, nF, si)
#                 push!(turma, aluno)
#             end
#             close(s)
#         end
#     catch
#         println("Arquivo $arquivo não existe!")
#     end

notas= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
tam = length(notas)
arquivo = "turma1.txt"

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
            return turma
        end
    catch
        println("Arquivo $arquivo não existe!\n")
        return turma
    end
end


function salvarSair(turma::Array{Aluno}, arquivo)
    try # se existe
        open(arquivo, "r+") do s
            println("Arquivo $arquivo já existe. Deseja sobrescrevê-lo? (S/N) ")
            resposta = readline()
            if resposta == "S" || resposta == "s"
                for aluno in turma
                    println(aluno.nome)
                    println(s, aluno.nome)
                    println(s, aluno.matricula)
                    println(s, aluno.prova1)
                    println(s, aluno.prova2)
                    println(s, aluno.prova3)
                    println(s, aluno.trabalho1)
                    println(s, aluno.trabalho2)
                    println(s, aluno.faltas)
                    println(s, aluno.notaFinal)
                end
            end
        end
    catch #se não existe
        println("Arquivo $arquivo não existe. Deseja criar um novo? (S/N) ")
        resposta = readline()
        if resposta == "S" || resposta == "s"
            open(arquivo, "w+") do s
                for aluno in turma
                    println(aluno.nome)
                    println(s, aluno.nome)
                    println(s, aluno.matricula)
                    println(s, aluno.prova1)
                    println(s, aluno.prova2)
                    println(s, aluno.prova3)
                    println(s, aluno.trabalho1)
                    println(s, aluno.trabalho2)
                    println(s, aluno.faltas)
                    println(s, aluno.notaFinal)
                end
            end
        end
    end
    print("Até a próxima")
    return
end
turma = abreArmazena() 
println(turma)
salvarSair(turma, arquivo)
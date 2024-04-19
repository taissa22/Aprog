struct Aluno
    nome::String
    matricula::String
    prova1::Float32
    prova2::Float32
    prova3::Float32
    trabalho1::Float32
    trabalho2::Float32
    faltas::Int
    notaFinal::Float32
    situacao::String
end

print("Digite o nome do arquivo com a turma: ")
    arquivo = readline()
    turma=[]
    try
        open(arquivo, "r") do s
            println("Arquivo $arquivo lido com sucesso!")
            turma = []
            while !eof(s)
                nome = readline(s)
                mat = readline(s)
                p1= parse(Float32, readline(s))
                p2 = parse(Float32, readline(s))
                p3 = parse(Float32, readline(s))
                t1 = parse(Float32, readline(s))
                t2 = parse(Float32, readline(s))
                f = parse(Int, readline(s))
                nF = parse(Float32, readline(s))
                si = readline(s)
                aluno = Aluno(nome, mat, p1, p2, p3, t1, t2, f, nF, si)
                push!(turma, aluno)
            end
            close(s)
        end
    catch
        println("Arquivo $arquivo não existe!")
    end
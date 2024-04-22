function conteFrequencia(notas, min, max)
    freq=0
    for nota in notas
        if nota>min && nota<max
            freq=freq+1
        end
    end
    return freq
end

function crieHistograma(freq, min, max)
    print("$min - $max   $freq ")
    if freq>0
        for i in freq
            print("*")
        end
    end
    println()
    
end


function Histograma(notas)
    min=0
    max=10
    while max<=100
        min+=1
        freq=conteFrequencia(notas, min, max)
        crieHistograma(freq, min, max)
        min=min+9
        max=max+10
    end
end 

notas = [5, 43, 46, 85, 92]
Histograma(notas)
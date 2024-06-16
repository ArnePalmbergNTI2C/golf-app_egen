#För att starta detta programmet, högerklicka på filen till vänster som heter main.rb. öppna den med integrated terminal. sen skriv >> "Ruby .\main.rb"

def switch(array, array2, array3)

    endgame = array3

    i = 0
    output = []

    while i < array.length

        x = 0

        while x < array2.length
    
            j = 0
            string = ""
    
            while j < array2[x].length

                array2[x] = array2[x].sub(/^\d+\s*/, '')
                if array2[x][j] == array[i][j] 
                    string << array[i][j]
                end

                j += 1

            end
   
            if string.length == array[i].length

                output << endgame[x]
            
    
            end
            x +=1

        end
    
        i += 1

    end

    return output

end

def Mats(array)

    new_array = []
    
    while array.length > 0
        i = 0
        minsta = 1000000
        while i < array.length

            x = 0

            sum = ""
            bob = 0


            while x < array[i].length


                j = 0

                while j < 10

                    if array[i][x] == j.to_s

                        sum << array[i][x]
                        bob += sum.to_f

                    end

                    j += 1

                end

                x += 1

            end


            if bob < minsta
                minsta = bob 
                temp = i
            end

            i += 1
        end
        new_array << array[temp]
        array.delete_at(temp)

    end 

    return new_array

end

array3 = File.readlines("../skriva/golf_data.txt").map { |line| line.gsub(/[\t]/, ' ') }
array2 = File.readlines("../skriva/golf_data.txt").map { |line| line.gsub(/[\t]/, ' ') }
array = File.readlines("../skriva/personer.txt")

slut = switch(array, array2, array3)
slut_fil = File.open("Inte_sorterad_lista.txt", "w")
slut_fil.puts(slut)
slut_fil.close

array = File.readlines("Inte_sorterad_lista.txt")
bob = Mats(array)
fil = File.open("Sorterad_lista.txt", "w")
fil.puts(bob)
fil.close
# ARIMALALA Miarintsoa Itokiana Michael ESIIA 3 numero 28


class AutomateDisturb 
    attr_reader :Billet
    def initialize()
        @solde = 2000000
        @billet = [5000 ,10000, 20000] # billets: 5 000ar 10 000ar 20 000ar
    end

    def startDAB() 

        option = 100
        while option !=0    # Option sur le menu
            print "\nBienvenue sur notre distributeur de billet automatique\n"
            print "Voici le menu:\n"
            print "1-Retrait\n2-Verifier votre solde\n0-Quitter\n=>"
            option = readline.to_i    

            case option
                when 1
                    inputBillet = 0
                    test = false
                    while(inputBillet<50000 || inputBillet>800000)
                        print "Entrer le montant(entre 50 000ar - 800 000ar): "
                        inputBillet = readline.to_i
                        if(inputBillet>@solde)
                            print "Desole, votre solde est insuffisant\n\n"
                            break
                        else test = true    # true si tout est OK
                        end
                    end  

                    optionRetreat = 0     
                    while(optionRetreat!=1 && optionRetreat!=2 && test)
                        print "1-Minimum de billet\n2-Balancer le nombre de billet\n=>"
                        optionRetreat = readline.to_i    
                    end

                    case optionRetreat
                        when 1
                            result = self.MinBillet(inputBillet)
                            print "Voici votre argent:\n 5 000Ar x #{result[0]}\n10 000Ar x #{result[1]}\n20 000Ar x #{result[2]}\n"
                            
                        when 2
                            result = self.BalanceBillet(inputBillet)
                            print "Voici votre argent:\n 5 000Ar x #{result[0]}\n10 000Ar x #{result[1]}\n20 000Ar x #{result[2]}\n"
                    end

                when 2 
                    print "Votre solde est #{@solde} Ariary\n\n"
            end                        
        end
        

    end

    def MinBillet( inputBillet ) 
        @@nbrBillet = [0, 0, 0]  # [nbrBillet 5000, nbrBillet 10000, nbrBillet 20000]
        tmp = inputBillet
        while inputBillet > 0
            if (inputBillet >= 20000 )
                inputBillet-=20000
                @@nbrBillet[2]+=1
            else 
                if(inputBillet >= 10000 )
                    inputBillet-=10000
                    @@nbrBillet[1]+=1
                else 
                    if(inputBillet >= 5000)
                            inputBillet-=5000
                            @@nbrBillet[0]+=1
                    else
                        p "Desole, nous n'avons pas des billets plus petit que 5000 Ariary"
                        break; 
                    end
                end
            end
        end
        @solde -= tmp - inputBillet 
        return @@nbrBillet
    end

    def isBalanced(x , y)
        return x<=y
    end

    def BalanceBillet(inputBillet)
        @@nbrBillet = [0, 0, 0]  # [nbrBillet 5000, nbrBillet 10000, nbrBillet 20000]
        tmp = inputBillet
        while inputBillet > 0
            if (inputBillet >= 20000 && isBalanced(@@nbrBillet[2], @@nbrBillet[1]))
                inputBillet-=20000
                @@nbrBillet[2]+=1
            else 
                if(inputBillet >= 10000 && isBalanced(@@nbrBillet[1], @@nbrBillet[0]))
                    inputBillet-=10000
                    @@nbrBillet[1]+=1
                else 
                    if(inputBillet >= 5000)
                            inputBillet-=5000
                            @@nbrBillet[0]+=1
                    else
                        p "Desole, nous n'avons pas des billets plus petit que 5000 Ariary"
                        break; 
                    end
                end
            end
        end
        @solde -= tmp - inputBillet 
        return @@nbrBillet
    end

    def VerifSold() 
        return @solde
    end
end

DAB = AutomateDisturb.new

DAB.startDAB


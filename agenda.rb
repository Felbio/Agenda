# Adicionar, Editar e Remover contatos;
# Contatos terão as seguintes informações: Nome e Telefone;
# Poderemos verificar todos os contatos registrados ou somente um contato por vez;

@agenda = [
    {nome: "Felipe", telefone: "999999999"},
    {nome: "Lucas", telefone: "989898989"},
    {nome: "Manoel", telefone: "987987987"}
]

def grupo_de_contatos
    @agenda.each do |contato|
        puts "Nome: #{contato[:nome]} - Telefone #{contato[:telefone]}"
        
    end
    puts "*-------------------------------------*"
end

def inserir_contato
    print "Nome: " 
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp

    @agenda << {nome: nome, telefone: telefone}
end

def ver_contato
    puts "Digite o nome que você deseja: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "Nome: #{contato[:nome]} - Telefone: #{contato[:telefone]}"             
        end        
    end
    puts "*-------------------------------------*"
end

def editar_contato
    print "Nome a ser editado: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            print "Nome para editar (se não vai alterar aperte enter): "
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

            print "Telefone para editar (se não vai alterar aperte enter): "
            telefone_salvo = contato[:telefone]

            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
end

def remover_contato
    print "Contato a ser removido: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
        indice = @agenda.index(contato)
        @agenda.delete_at(indice)
        break
        end
    end
end

loop do
    puts "1. Contatos\n2. Inserir Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair\n"
    selection = gets.chomp.to_i
    
    case
    when selection == 0
        puts "Até logo"
        break
    when selection == 1
        grupo_de_contatos
    when selection == 2
    inserir_contato
    when selection == 3
        ver_contato
    when selection == 4
        editar_contato
    when selection == 5
        remover_contato
    else
        puts "Essa função não existe! Por favor, digite uma função válida!"
    end
end
